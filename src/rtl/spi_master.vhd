library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity spi_master is
  port(
    -- Input
    clk_i   : in  std_logic;
    valid_i : in  std_logic;
    data_i  : in  std_logic_vector(7 downto 0);
    -- Output
    sclk_o  : out std_logic;
    ready_o : out std_logic;
    mosi_o  : out std_logic);
end spi_master;

architecture rtl of spi_master is
signal data_reg: std_logic_vector(7 downto 0):=(others=>'0');
signal count : unsigned(3 downto 0):=(others=>'0');
signal cs : std_logic := '0';


begin
sync: process(clk_i)
begin
if(rising_edge(clk_i))then
    
    if(valid_i='1') then
    --chargement parallele des données
       data_reg<=data_i ;
       count<= to_unsigned(7,4);
       cs<='0';

    else    
    --on donne les donéées en série au controleur
        data_reg <= data_reg(6 downto 0) & '0';
        if count /= 0 then
            count<= count-1;
         else
            cs <= '1';
         end if;
        
    end if;       	
 end if;
end process;

sclk_o<= NOT(clk_i) or cs ;
ready_o <= cs;
mosi_o <= data_reg(7) and not cs ;


end architecture rtl;