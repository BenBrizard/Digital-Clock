-------------------------------------------------------------------------------
-- Title      : msa_horloge
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : msa_horloge.vhd
-- Author     : AR
-- Created    : 2019-01-26
-- Last update: 2019-03-09
-------------------------------------------------------------------------------
-- Description: MSA qui gère le changement des modes.
------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity msa_horloge is
  port (
    rst_i    : in  std_logic;
    clk_i    : in  std_logic;
    mode_i   : in  std_logic;
    prog_h_o : out std_logic;
    prog_m_o : out std_logic
    );
end msa_horloge;

architecture Behavioral of msa_horloge is

  type T_etat is (affichage, prog_heures, prog_minutes);
  signal etat : T_etat;

begin

  process (clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        etat <= affichage;
      else
        case etat is
          when affichage =>
            if mode_i = '1' then
              etat <= prog_heures;
            else
              etat <= affichage;
            end if;

          when prog_heures =>
            if mode_i = '1' then
              etat <= prog_minutes;
            else
              etat <= prog_heures;
            end if;

          when others =>
            if mode_i = '1' then
              etat <= affichage;
            else
              etat <= prog_minutes;
            end if;
        end case;
      end if;
    end if;
  end process;

  prog_h_o <= '1' when etat = prog_heures  else '0';
  prog_m_o <= '1' when etat = prog_minutes else '0';

end Behavioral;

