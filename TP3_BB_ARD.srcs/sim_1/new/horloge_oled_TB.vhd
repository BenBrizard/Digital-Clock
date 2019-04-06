
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Package avec les CMD_MEM et CHAR_MEM
library xil_defaultlib;
use xil_defaultlib.ROM_data.all;--ROM DATA IS A PACKAGE

entity horloge_oled_TB is
--  Port ( );
end horloge_oled_TB;

architecture Behavioral of horloge_oled_TB is

component horloge_oled is
  port(
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
    ho_spi_mosi  : out std_logic);
    
end component;

-- INPUTS
   signal clk_i_tb : std_logic := '0';
   signal rst_i_n_tb   : std_logic := '1';
   signal mode_i_tb : std_logic := '0';
   signal inc_one_i_tb : std_logic := '0';
   signal inc_ten_i_tb : std_logic := '0';
   signal speed_i_tb : std_logic_vector(1 downto 0):= "11";
   
-- OUTPUTS
   signal ho_dels_o_tb : std_logic_vector(7 downto 0):= (others=>'0');
   signal ho_df_dc_tb : std_logic := '0';
   signal ho_pr_vdd_tb : std_logic := '0';
   signal ho_pr_vbat_tb : std_logic := '0';
   signal ho_pr_res_tb : std_logic := '0';
   signal  ho_spi_sclk_tb : std_logic := '0';    
   signal ho_spi_mosi_tb : std_logic := '0';   
  
-- Clock period definitions
   constant clk_period : time := 10 ns;


begin

-- Instantiate the Unit Under Test (UUT)
    uut: horloge_oled 
        port map
          (
          -- inputs
          clk_100mhz_i => clk_i_tb,
          rst_i_n => rst_i_n_tb,
          mode_i => mode_i_tb,
          inc_one_i => inc_one_i_tb,
          inc_ten_i => inc_ten_i_tb,
          speed_i => speed_i_tb,
          
         -- outputs
          ho_dels_o => ho_dels_o_tb,
          ho_df_dc => ho_df_dc_tb,
          ho_pr_vdd => ho_pr_vdd_tb,
          ho_pr_vbat => ho_pr_vbat_tb,
          ho_pr_res => ho_pr_res_tb,
          ho_spi_sclk => ho_spi_sclk_tb,
          ho_spi_mosi => ho_spi_mosi_tb
          );
  
    -- Clock process definitions
   clk_process :process
   begin
		clk_i_tb <= '0';
		wait for clk_period/2;
		clk_i_tb <= '1';
		wait for clk_period/2;
   end process; 
 
    
 -- Stimulus process
   stim_proc: process
   begin
   

wait for 300*clk_period;
              
      wait;
   end process;



end Behavioral;
