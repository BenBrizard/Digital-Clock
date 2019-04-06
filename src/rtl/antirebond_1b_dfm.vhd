-------------------------------------------------------------------------------
-- Title      : Antirebond détecteur de front montant
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : antirebond_1b.vhd
-- Created    : 2019-02-28
-- Last update: 2019-03-13
-------------------------------------------------------------------------------
-- Description: Antirebond, l'entrée doit être stable pendant 1ms pour que b_o
--              soit valide pendant une période d'horloge. Le bouton doit être
--              relâché et stable avant que b_o puisse être de nouveau valide.
--              en_i est un signal à une fréquence de 8kHz. 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity antirebond_1b_dfm is
  generic (
    GENERIC_SW_LOGIC : std_logic := '1'  -- 1=POSITIVE 0=NEGATIVE
    );
  port (
    clk_i : in  std_logic;
    en_i  : in  std_logic;
    b_i   : in  std_logic;
    b_o   : out std_logic
    );
end antirebond_1b_dfm;


architecture arch_antirebond_1b_dfm of antirebond_1b_dfm is
  type etat_t is (relache, appuye);
  signal etat       : etat_t;
  signal b_shiftreg : std_logic_vector (7 downto 0);
  signal b_clean    : std_logic;
  signal en_r       : std_logic;

begin

  b_o <= b_clean;


  P_sync : process(clk_i)
  begin
    if rising_edge(clk_i) then
      
      en_r <= en_i;
      
      if en_i = '1' and en_r = '0' then
        b_shiftreg <= b_shiftreg(6 downto 0) & b_i;
        
        case etat is
          when relache =>
            etat <= relache;
            if b_shiftreg = "11111111" then
              b_clean <= '1';
              etat    <= appuye;
            else
              b_clean <= '0';
            end if;
          when others =>
            b_clean <= '0';
            if b_shiftreg = "00000000" then
              etat <= relache;
            else
              etat <= appuye;
            end if;
        end case;
        
      else
        b_clean    <= '0';
      end if;
    end if;
  end process;
end arch_antirebond_1b_dfm;
