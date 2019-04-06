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

entity spi_master_TB is
--  Port ( );
end spi_master_TB;

architecture Behavioral of spi_master_TB is

component spi_master is
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

-- INPUTS
   signal clk_i_tb : std_logic := '0';
   signal valid_i_tb   : std_logic := '0';
   signal data_i_tb : std_logic_vector(7 downto 0):= (others=>'0');
   
-- OUTPUTS
   signal  sclk_o_tb : std_logic := '0';    
   signal ready_o_tb : std_logic := '0';
   signal mosi_o_tb : std_logic := '0';
   
  
-- Clock period definitions
   constant clk_period : time := 10 ns;


begin

-- Instantiate the Unit Under Test (UUT)
    uut: spi_master 
        port map
          (
          clk_i => clk_i_tb,
          valid_i => valid_i_tb,
          data_i => data_i_tb,
          sclk_o => sclk_o_tb,
          ready_o => ready_o_tb,
          mosi_o => mosi_o_tb
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
   
  data_i_tb <= "00001111";
  valid_i_tb <= '1';
  
  wait for clk_period;
  
  data_i_tb <= "00000000";
  valid_i_tb <= '0';
   
  wait for 9*clk_period;
  
  data_i_tb <= "10101010";
  valid_i_tb <= '1';
   wait for clk_period;
  data_i_tb <= "00000000";
  valid_i_tb <= '0';                      
      wait;
   end process;



end Behavioral;
