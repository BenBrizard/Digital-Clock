------------------------------------------------------------------------------
-- Title      : compteur_bcd_2
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : compteur_bcd_2.vhd
-- Author     : SB
-- Created    : 2019-01-26
-- Last update: 2019-03-20
-------------------------------------------------------------------------------
-- Description: Compteur BCD a 2 chiffres.
--              Le compteur incremente par l'entree ce_i ou par programmation.
------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity compteur_bcd_2 is
  generic (TERMINAL_COUNT : integer := 59);
  port (rst_i       : in  std_logic;
        clk_i       : in  std_logic;
        ce_i        : in  std_logic;
        inc_time_i  : in  std_logic;
        digit_pos_i : in  std_logic;
        tc_o        : out std_logic;
        value_o     : out std_logic_vector(7 downto 0));
end compteur_bcd_2;

architecture arch_compteur_bcd_2 of compteur_bcd_2 is

  signal dizaine : unsigned(3 downto 0) := "0000";
  signal unite   : unsigned(3 downto 0) := "0000";
  signal tc_r    : std_logic            := '0';

  constant MAX_VAL_UNIT : natural := TERMINAL_COUNT mod 10;
  constant MAX_VAL_DIZ  : natural := (TERMINAL_COUNT - MAX_VAL_UNIT)/10;

begin

  -- Process Combinatoire
  value_o <= std_logic_vector(dizaine) & std_logic_vector(unite);
  tc_o    <= tc_r;

  count : process(clk_i)
  begin
    -- Effectuer le traitement a chaque front montant du clk_i
    if rising_edge(clk_i) then
      --  Reset Synchrone des signaux: unite, dizaine et tc_r
      if rst_i = '1' then
        unite   <= (others => '0');
        dizaine <= (others => '0');
        tc_r    <= '0';
      else
        -- Mode Programation des dizaine
        if digit_pos_i = '1' and inc_time_i = '1' then
          if dizaine >= MAX_VAL_DIZ or (dizaine + 1 >= MAX_VAL_DIZ and unite > MAX_VAL_UNIT) then
            dizaine <= (others => '0');
          else
            dizaine <= dizaine + 1;
          end if;
          tc_r <= '0';
        -- Mode Programation des unite ou mode de fonctionement normal
        elsif inc_time_i = '1' or ce_i = '1' then
          -- Tester si on est rendu a la valeur du TERMINAL_COUNT
          -- Si Oui on fais une remise a zeros des signaux: unite, dizaine et tc_r
          if dizaine >= MAX_VAL_DIZ and unite >= MAX_VAL_UNIT then
            dizaine <= (others => '0');
            unite   <= (others => '0');
            tc_r    <= ce_i and not inc_time_i;
          -- Si Non Si les unite sont superieurs ou egale a 9 on incremente les 
          -- dizaine et on remet a zero les unites
          elsif unite >= 9 then
            dizaine <= dizaine + 1;
            unite   <= (others => '0');
            tc_r    <= '0';
          -- Si Non on increment les unite
          else
            unite <= unite + 1;
            tc_r  <= '0';
          end if;
        else
          tc_r <= '0';
        end if;
      end if;
    end if;

  end process;

end arch_compteur_bcd_2;

