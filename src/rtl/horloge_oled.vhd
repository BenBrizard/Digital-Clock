library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Package avec les CMD_MEM et CHAR_MEM
library xil_defaultlib;
use xil_defaultlib.ROM_data.all;--ROM DATA IS A PACKAGE


entity horloge_oled is
  port (
    -- inputs
    clk_100mhz_i : in  std_logic;
    rst_i_n      : in  std_logic;
    mode_i       : in  std_logic;
    inc_one_i    : in  std_logic;
    inc_ten_i    : in  std_logic;
    speed_i      : in  std_logic_vector (1 downto 0);
    -- outputs
    ho_dels_o    : out std_logic_vector (7 downto 0);
    ho_df_dc     : out std_logic;
    ho_pr_vdd    : out std_logic;
    ho_pr_vbat   : out std_logic;
    ho_pr_res    : out std_logic;
    ho_spi_sclk  : out std_logic;
    ho_spi_mosi  : out std_logic
    );
end horloge_oled;

architecture arch_horloge_oled of horloge_oled is


component spi_master
  port(
    -- Input
    clk_i   : in  std_logic;
    valid_i : in  std_logic;
    data_i  : in  std_logic_vector(7 downto 0);
    -- Output
    sclk_o  : out std_logic;
    ready_o : out std_logic;
    mosi_o  : out std_logic);
 end component;
 
 component delay_cnt
     port(
    clk_i       : in  std_logic;
    start_i     : in  std_logic;
    cmd_delay_i : in  std_logic_vector(18 downto 0);
    end_o       : out std_logic
    );
end component;

 component cmd_addr
  port(
    clk_i        : in  std_logic;
    cmd_inc_i    : in  std_logic;
    cmd_rst_i    : in  std_logic;
    addr_count_o : out std_logic_vector(8 downto 0)
    );
 end component;
    
component clk_wiz
port
 (-- Clock in ports
  clk_in1           : in     std_logic;
  -- Clock out ports
  clk_out1          : out    std_logic;--100 mhz
  clk_out2          : out    std_logic;--5mhz
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
 );
end component;

component sync_io_1 is
     generic (
    GENERIC_IO_LOGIC : std_logic := '1'  -- 1=POSITIVE 0=NEGATIVE
    );
  port (
    --source clock-domain
    sig_src_i : in  std_logic;
    --destination clock-domain 
    clk_dst_i : in  std_logic;
    sig_dst_o : out std_logic
    );
  end component;

  component antirebond_1b is
  generic (
    GENERIC_SW_LOGIC : std_logic := '1'  -- 1=POSITIVE 0=NEGATIVE
      );
  port (
    clk_i : in  std_logic;
    en_i  : in  std_logic;
    b_i   : in  std_logic;
    b_o   : out std_logic
    );
  end component;
 

  component display_fsm 
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
  end component;

  
  -- declarations
  component horloge is
    port (
      -- inputs
      clk_i       : in  std_logic;
      rst_i       : in  std_logic;
      mode_i      : in  std_logic;
      inc_one_i   : in  std_logic;
      inc_ten_i   : in  std_logic;
      speed_i     : in  std_logic_vector (1 downto 0);
      digit_sel_i : in  std_logic_vector (2 downto 0);
      -- outputs
      heartbeat_o : out std_logic_vector (7 downto 0);
      digit_o     : out std_logic_vector (3 downto 0)
      );
  end component horloge;

  component power_reg
    port(
      clk_i       : in  std_logic;
      en_pwr      : in  std_logic;
      cmd_pwr_reg : in  std_logic_vector (5 downto 0);
      pr_vdd_o    : out std_logic;
      pr_vbat_o   : out std_logic;
      pr_res_o    : out std_logic
      );
  end component;

-- dÃƒÂ©claration des signaux
  signal rst_sync           : std_logic:='0';
  -- clk
  signal clk_sys           : std_logic:='0';
  signal clk_5mhz          : std_logic:='0';
  signal locked            : std_logic:='0';
  -- rst
  signal rst_sys           : std_logic:='0';
  -- horloge
  --bit de sélection du bit qu'on veut afficher
  signal h_digit           : std_logic_vector (3 downto 0):=(others=>'0');
  --entrée de l'horloge, chiffre qu'on a selectionner et qu'on veut afficher
  signal digit_sel         : std_logic_vector (2 downto 0):=(others=>'0');
  -- Memoire des commandes
  signal cmd_power_reg     : std_logic_vector(5 downto 0):=(others=>'0');
  -- sorties
  signal dels_o            : std_logic_vector (7 downto 0):=(others=>'0');
  signal df_dc             : std_logic:='0';
  signal pr_vdd            : std_logic:='0';
  signal pr_vbat           : std_logic:='0';
  signal pr_res            : std_logic:='0';
  signal spi_cs            : std_logic:='0';
  signal spi_sclk          : std_logic:='0';
  signal spi_mosi          : std_logic:='0';
  
  -- MIDWAY 
signal midway_rst_i   : std_logic:='0';
signal midway_dc_end_i    : std_logic:='0';
signal midway_spi_ready_i : std_logic:='0';
signal midway_df_spi_data_valid_o : std_logic:='0';
signal midway_df_mux_sel_o : std_logic:='0';
signal midway_df_cmd_inc_o : std_logic:='0';
signal midway_df_cmd_rst_o : std_logic:='0';
signal midway_df_start_o : std_logic:='0';
signal midway_df_en_pwr : std_logic:='0';
signal midway_cmd_addr : std_logic_vector(8 downto 0):=(others=>'0');
signal midway_cmd_instruction_i : std_logic_vector(1 downto 0) :=(others=>'0');
signal midway_cmd_delay_i : std_logic_vector(18 downto 0) :=(others=>'0');
signal cmd_data : std_logic_vector(7 downto 0) :=(others=>'0');
signal char_data : std_logic_vector(7 downto 0) :=(others=>'0');
signal mux_data : std_logic_vector(7 downto 0) :=(others=>'0');
--signal colonne : integer:=0;
--signal ligne : integer:=0;
signal colonne :  std_logic_vector(3 downto 0) :=(others=>'0');
signal ligne : std_logic_vector(1 downto 0) :=(others=>'0');
--signal iterator : integer:=0;


signal cmd_data_vector : std_logic_vector(63 downto 0) :=(others=>'0');
signal midway_char_position : std_logic_vector( 9 downto 0) :=(others=>'0');

begin

  midway_rst_i <=not(rst_i_n);
  -- sorties
  ho_dels_o   <= dels_o;
  ho_df_dc    <= df_dc;
  ho_pr_vdd   <= pr_vdd;
  ho_pr_vbat  <= pr_vbat;
  ho_pr_res   <= pr_res;
  ho_spi_sclk <= spi_sclk;
  ho_spi_mosi <= spi_mosi;
  mux_data <= cmd_data when midway_df_mux_sel_o='0' 
                       else char_data;  
                       
   --ce compteur augmente seulement quand display_fsm lui dit, soit à la
   --fin des tâches des différents modules                    
   --on choisit les bits les plus significatifs
  --ON ECRIT DE GAUCHE A DROITE...FAIT DES JUMP DE 16 BITS QUAND ON CHANGE DE CHAR
  --so 16 = 2^4, premier bit quon veut cest le 4e !
 digit_sel<=midway_cmd_addr(6 downto 4);--selectionne le symbole qu'on veut afficher
 --keep in mind midway_cmd_addr est simplement un compteur
  
cmd_memory : process(clk_5mhz)
begin
            
--on lit la mémoire sur un front montant d'horloge
--les données sont mises dans un buffer
 if(rising_edge(clk_5mhz)) then
    cmd_data_vector <= CMD_MEM(to_integer(unsigned(midway_cmd_addr)));
end if;
end process;

--les sorties sont attribuées selon le vecteur de données synchronisé précédemment
         cmd_data<=cmd_data_vector(7 downto 0); 
         cmd_power_reg<=cmd_data_vector(37 downto 32);
         midway_cmd_instruction_i<=cmd_data_vector(39 downto 38);
	     midway_cmd_delay_i<=cmd_data_vector(26 downto 8);
         
         


char_memory : process(clk_5mhz)
begin
--on lit la mémoire sur un front montant d'horloge
--les données sont mises dans un buffer
 if(rising_edge(clk_5mhz)) then        
       char_data<=CHAR_MEM(to_integer(unsigned( midway_char_position)));		
	end if;
end process;


 

   --permet de savoir quelle ligne on est rendu dans le chiffre, compteur de 0 à 3
     ligne<=midway_cmd_addr(8 downto 7);
     
     --permet de savoir quelle colonne on est rendu dans le chiffre, compteur de 0 à 15
     colonne<=midway_cmd_addr(3 downto 0);
   
    -- permet d'itérer correctement dans la memoire
    midway_char_position <= ( h_digit & ligne & colonne);

      

  -- Horloge
  inst_horloge : horloge
    port map(
      -- inputs
      clk_i       => clk_sys,
      rst_i       => rst_sys,
      mode_i      => mode_i,
      inc_one_i   => inc_one_i,
      inc_ten_i   => inc_ten_i,
      speed_i     => speed_i,
      digit_sel_i => digit_sel,
      -- outputs
      heartbeat_o => dels_o,
      digit_o     => h_digit
      );

  -- Registres d'alimentations
  pwr_regs_proc : power_reg
    port map(
      clk_i       => clk_sys,
      en_pwr      => midway_df_en_pwr,
      cmd_pwr_reg => cmd_power_reg,
      pr_vdd_o    => pr_vdd,
      pr_vbat_o   => pr_vbat,
      pr_res_o    => pr_res
      );

  

  Inst_spi_master: spi_master
  port map
  (
    -- Input
    clk_i =>  clk_5mhz,
    valid_i =>midway_df_spi_data_valid_o,--vient de display_fsm
    data_i  => mux_data,
    -- Output
    sclk_o=>spi_sclk,
    ready_o =>midway_spi_ready_i,--va dans display fsm
    mosi_o => spi_mosi
    );
    
 inst_display_fsm : display_fsm
 port map
 (
    -- inputs
    clk_i => clk_5mhz,
    dc_end_i   =>midway_dc_end_i,
    cmd_instruction_i   => midway_cmd_instruction_i,--VIENT DE LA MÉMOIRE DES COMMANDES
    spi_ready_i  => midway_spi_ready_i,
    -- outputs
    df_spi_data_valid_o => midway_df_spi_data_valid_o,
    df_dc_o   => df_dc,
    df_mux_sel_o => midway_df_mux_sel_o,
    df_cmd_inc_o => midway_df_cmd_inc_o,
    df_cmd_rst_o =>midway_df_cmd_rst_o,
    df_start_o   => midway_df_start_o ,
    df_en_pwr_o  => midway_df_en_pwr 
    );
    
Inst_delay_cnt: delay_cnt    
port map
(
clk_i =>clk_5mhz,
start_i => midway_df_start_o ,--vient de display1_fsm
cmd_delay_i=> midway_cmd_delay_i,
end_o   => midway_dc_end_i--display_fsm
);
    
Inst_cmd_addr: cmd_addr  
port map 
(
clk_i     => clk_5mhz,
cmd_inc_i   => midway_df_cmd_inc_o,
cmd_rst_i  => midway_df_cmd_rst_o,
addr_count_o => midway_cmd_addr 
);
    
Inst_clk_wiz: clk_wiz
port map
  (     
  -- Clock in ports
  clk_in1 => clk_100mhz_i,
  -- Clock out ports  
  clk_out1 => clk_sys,
  clk_out2 => clk_5mhz,
  -- Status and control signals                
  reset => '0',--inutile
  locked => locked      --inutile      
  );

-- inc_one_i
  inst_sync_io_rst : sync_io_1
    generic map (
      GENERIC_IO_LOGIC => '1'           -- 1=POSITIVE 0=NEGATIVE
      )
    port map (
      --source clock-domain
      sig_src_i => midway_rst_i,--Logique positive
      --destination clock-domain 
    
      clk_dst_i => clk_sys,
      sig_dst_o => rst_sync
      );
     
 
  inst_ar_rst : antirebond_1b 
  generic map (
    GENERIC_SW_LOGIC => '1'  -- 1=POSITIVE 0=NEGATIVE
      )
 port map (
      clk_i => clk_sys,
      en_i  => '1',
      b_i   => rst_sync,
      b_o   => rst_sys
      );



end arch_horloge_oled;
