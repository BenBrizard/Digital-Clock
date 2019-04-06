-------------------------------------------------------------------------------
-- Title      : Module pour la trotteuse, allume 25% avec une periode de 

-- Project    : Horloge numerique - projet 2 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : trotteuse.vhd
-- Author     : EMJ
-- Created    : 2019-01-28
-- Last update: 2019-03-09
-------------------------------------------------------------------------------
-- Description: Le module gère l'affichage de la trotteuse. Il s'agit
--              d'un compteur avec un duty cycle de 25%
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity compteur_25dutycycle is
  port (
    clk_i       : in  std_logic;
    rst_i       : in  std_logic;
    trotteuse_o : out std_logic
    );
end compteur_25dutycycle;

architecture arch_compteur_25dutycycle of compteur_25dutycycle is
  signal trotteuse         : std_logic;
  signal count_on          : unsigned(31 downto 0);
  signal count_tot         : unsigned(31 downto 0);
  constant COUNT_ON_PERIOD : unsigned(31 downto 0) := x"017D783F";  -- 24 999 999
  constant COUNT_PERIOD    : unsigned(31 downto 0) := x"05F5E0FF";  -- 99 999 999
begin

  trotteuse_o <= '1' when count_on /= 0 else
                 '0';

  sync : process (clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        count_on  <= (others => '0');
        count_tot <= (others => '0');
      else
        count_tot <= (count_tot - 1);
        if (count_tot = 0) then
          count_tot <= COUNT_PERIOD;
          count_on  <= COUNT_ON_PERIOD;
        elsif (count_on /= 0) then
          count_on  <= (count_on - 1);
        end if;
      end if;
    end if;
  end process;
end arch_compteur_25dutycycle;

