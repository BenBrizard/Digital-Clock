-------------------------------------------------------------------------------
-- Title      : compteur de delai
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : delay_cnt.vhd
-- Author     : 
-- Created    : 2019-03-13
-- Last update: 2019-03-13
-------------------------------------------------------------------------------
-- Description: Compteur pour le dÃ©lai des commandes
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity delay_cnt is
  port(
    clk_i       : in  std_logic;
    start_i     : in  std_logic;
    cmd_delay_i : in  std_logic_vector(18 downto 0);
    end_o       : out std_logic
    );
end delay_cnt;

architecture Behavioral of delay_cnt is

signal count : unsigned(18 downto 0):=(others=>'0');

begin

end_o <= '1' when ((count = 0) AND (start_i = '0'))
                    else '0';

P_sync: process(clk_i)
begin
if(rising_edge(clk_i))then

    if(start_i = '1') then
    --chargement du délai
        count <= unsigned(cmd_delay_i);
        
    elsif (count /= x"0" ) then
    --décrémente le compteur
       count <= count - x"1";
    else 
    --on reste a zero, on attend le prochain délai
        count <= (others=>'0');   
    end if;
        	
 end if;

end process;
end Behavioral;
