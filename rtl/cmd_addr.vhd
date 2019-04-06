-------------------------------------------------------------------------------
-- Title      : Compteur d'adresse
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : cmd_addr.vhd
-- Author     : 
-- Created    : 2019-03-13
-- Last update: 2019-03-13
-------------------------------------------------------------------------------
-- Description: Compteur pour les adresses en mémoire. Incrémente de 1 lorsque
--              cmd_inc_i est valide et recommence à 0 lorsque cmd_rst_i est
--              valide.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity cmd_addr is
  port(
    clk_i        : in  std_logic;
    cmd_inc_i    : in  std_logic;
    cmd_rst_i    : in  std_logic;
    addr_count_o : out std_logic_vector(8 downto 0)
    );
end cmd_addr;

architecture Behavioral of cmd_addr is

signal count : unsigned(8 downto 0):=(others=>'0');

begin
 

addr_count_o <= std_logic_vector(count);

P_sync: process(clk_i)
begin
if(rising_edge(clk_i))then
    if(cmd_rst_i = '1') then
        count <= (others=>'0');
        
    elsif (cmd_inc_i='1') then
    --on incremente le compteur lorsqu'on recoit la commande inc
       count <= count + 1; 
       
    end if;
        	
 end if;
end process;
  
end Behavioral;
