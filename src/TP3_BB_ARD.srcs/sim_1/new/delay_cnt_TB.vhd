----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 11:21:08 AM
-- Design Name: 
-- Module Name: spi_master_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity delay_cnt_TB is
--  Port ( );
end delay_cnt_TB;

architecture Behavioral of delay_cnt_TB is

component delay_cnt is

 port(
    clk_i       : in  std_logic;
    start_i     : in  std_logic;
    cmd_delay_i : in  std_logic_vector(18 downto 0);
     end_o  : out std_logic
    );

    
end component;

-- INPUTS
   signal clk_i_tb : std_logic := '0';
   signal start_i_tb   : std_logic := '0';
   signal cmd_delay_i_tb : std_logic_vector(18 downto 0):= (others=>'0');
   
   
-- OUTPUTS
    signal end_o_tb   : std_logic := '0';
   
  
-- Clock period definitions
   constant clk_period : time := 10 ns;


begin

-- Instantiate the Unit Under Test (UUT)
    uut: delay_cnt
        port map
          (
          clk_i => clk_i_tb,
          start_i => start_i_tb,
          cmd_delay_i => cmd_delay_i_tb,
          end_o => end_o_tb
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
   wait for 9/2*clk_period;
   start_i_tb<='1';
   cmd_delay_i_tb<="0000000000000000011";
      
   wait for clk_period;
   start_i_tb<='0';
   cmd_delay_i_tb<=(others=>'0');
   
    wait for 4*clk_period;
    
     start_i_tb<='1';
   cmd_delay_i_tb<="0000000000000000100";
      
   wait for clk_period;
   start_i_tb<='0';
   cmd_delay_i_tb<=(others=>'0');
 
      wait;
   end process;



end Behavioral;
