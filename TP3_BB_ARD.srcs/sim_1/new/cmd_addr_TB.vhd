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

entity cmd_addr_TB is
--  Port ( );
end cmd_addr_TB;

architecture Behavioral of cmd_addr_TB is

component cmd_addr is

  port(
    clk_i        : in  std_logic;
    cmd_inc_i    : in  std_logic;
    cmd_rst_i    : in  std_logic;
    addr_count_o : out std_logic_vector(8 downto 0)
    );

    
end component;

-- INPUTS
   signal clk_i_tb : std_logic := '0';
   signal cmd_inc_i_tb   : std_logic := '0';
   signal cmd_rst_i_tb   : std_logic := '0';
   
   
-- OUTPUTS
signal addr_count_o_tb : std_logic_vector(8 downto 0):= (others=>'0');
   
  
-- Clock period definitions
   constant clk_period : time := 10 ns;


begin

-- Instantiate the Unit Under Test (UUT)
    uut: cmd_addr
        port map
          (
          clk_i => clk_i_tb,
          cmd_inc_i => cmd_inc_i_tb,
          cmd_rst_i => cmd_rst_i_tb,
          addr_count_o => addr_count_o_tb
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
   cmd_rst_i_tb<='1'; 
   wait for 3*clk_period;
   cmd_rst_i_tb<='0'; 
   wait for 2*clk_period;
   
   cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
   wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
  
  
  wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';

 wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';

 wait for 2*clk_period;
   
    cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
    
    cmd_rst_i_tb<='1';
   wait for clk_period;
    cmd_rst_i_tb<='0';
      wait for clk_period;
      
   cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
    
        cmd_inc_i_tb<='1';
   wait for clk_period;
   cmd_inc_i_tb<='0';
   
    wait for 2*clk_period;
        
      wait;
   end process;



end Behavioral;
