-------------------------------------------------------------------------------
-- Title      : Contr√¥leur d'affichage
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : display_fsm.vhd
-- Author     : 
-- Created    : 2019-03-13
-- Last update: 2019-03-13
-------------------------------------------------------------------------------
-- Description: Contr√¥leur qui g√©n√®re les signaux de contr√¥le en fonction des
--              commandes √† ex√©cuter ne provenance de la m√©moire de commandes
--              ou si on est en mode de transmission des donn√©es. 
-------------------------------------------------------------------------------
--envoie meme le 00
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity display_fsm is
  port(
    -- inputs
    clk_i               : in  std_logic;
    dc_end_i            : in  std_logic;
    cmd_instruction_i   : in  std_logic_vector(1 downto 0);
    spi_ready_i         : in  std_logic;
    -- outputs
    df_spi_data_valid_o : out std_logic;
    df_dc_o             : out std_logic;
    df_mux_sel_o        : out std_logic;
    df_cmd_inc_o        : out std_logic;
    df_cmd_rst_o        : out std_logic;
    df_start_o          : out std_logic;
    df_en_pwr_o         : out std_logic
    );
end entity display_fsm;

architecture rtl of display_fsm is

type T_etat1 is (cmd,last_cmd, data);
type T_etat2 is (demarrage, dumb_wait, lectureTransmi,updateAdresse, attente);
signal etat_present1 : T_etat1 := cmd ;
signal etat_suivant1 : T_etat1 := cmd ;

signal etat_present2 : T_etat2 := demarrage ;
signal etat_suivant2 : T_etat2 := demarrage ;

begin

sync : process(clk_i)
begin
    if (rising_edge(clk_i)) then
		etat_present1 <= etat_suivant1;
		etat_present2 <= etat_suivant2;
		
	end if;
end process;


selection_mode : process(cmd_instruction_i,dc_end_i,spi_ready_i,etat_present1,etat_present2)
begin
	case etat_present1 is
		when cmd =>
			
			if   cmd_instruction_i(1)='1' and etat_present2=lectureTransmi then 
				etat_suivant1 <= last_cmd;
			else
				etat_suivant1 <= cmd;
			end if;
		when last_cmd =>
		  if etat_present2=attente and dc_end_i='1' AND spi_ready_i='1' then
		       etat_suivant1 <= data;
		  else    
		       etat_suivant1 <= last_cmd;
		  end if;
		when others => --inclue le mode data
			etat_suivant1 <= data;
	end case;

end process;


data_mode : process(etat_present2,dc_end_i,spi_ready_i)
begin
	case etat_present2 is
	   when demarrage => 
	          --attend pour s'affranchir des effets transitoires
		      etat_suivant2<=dumb_wait;
		      
	   when dumb_wait => 
	           --attend pour s'affranchir des effets transitoires
		      etat_suivant2<=lectureTransmi;	      
	
	   when lectureTransmi => 
		      etat_suivant2<=updateAdresse;
		      
	   when attente =>
	   
	         if(dc_end_i='1' AND spi_ready_i='1') then --on fait un and, on sait que 1 des 2 flag vient de revenir a 1
		          etat_suivant2<=lectureTransmi;
		      else
		          etat_suivant2<=attente;
		      end if;
	   
            	       
	   when others =>--updateAdresse
            etat_suivant2<=attente;
          
    			
	end case;

end process;


-- Sortie


df_cmd_inc_o <= '1' when (etat_present2 = updateAdresse)
                    else  '0';
-- on reset le compteur d'adresse a 0 on saprete a envoyer des infos
df_cmd_rst_o <= '1' when (etat_present1 = last_cmd  AND  etat_present2=attente and dc_end_i='1' AND spi_ready_i='1')   
                    else '0';
-- commence le compteur de dÈlais

df_start_o <= '1' when  (cmd_instruction_i(0) = '0' AND  etat_present2 = lectureTransmi AND (etat_present1 = cmd OR etat_present1 = last_cmd))
                  else   '0';    
    

-- hand shake avec le spi pour envoyer des donnÈs


df_spi_data_valid_o <= '1' when (cmd_instruction_i(0) = '1'  AND  etat_present2 = lectureTransmi and (etat_present1=cmd or etat_present1=last_cmd)) or (etat_present2 = lectureTransmi and etat_present1=data)
                           else  '0';


-- On commence a envoyer des caracteres 
df_mux_sel_o <= '1' when  etat_present1 = data
                    else  '0';
                           
                            
-- La sortie df_dc_o est une sortie qui est transmise ‡ l'Ècran OLED et lorsqu'elle vaut 1, les
-- donnÈes qui sont transmises ‡ l'Ècran sont des donnÈes ‡ afficher, sinon, ce sont des commandes.
df_dc_o <= '1' when (etat_present1 = data)  
               else  '0';

-- La sortie df_en_pwr_o est valide lorsque le module power_reg doit prendre en compte la
-- commande qui est lue prÈsentement, sinon il ne change pas la valeur de ses registres.
df_en_pwr_o <= '1' when (etat_present1 = cmd OR etat_present1 = last_cmd) AND etat_present2 = lectureTransmi
                   else   '0';

end architecture rtl;
