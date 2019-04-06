-------------------------------------------------------------------------------
-- Title      : Antirebond détecteur de front montant
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : antirebond_1b.vhd
-- Created    : 2019-02-28
-- Last update: 2019-03-13
-------------------------------------------------------------------------------
-- Description: Antirebond, l'entrée doit être stable pendant 1ms pour que b_o
--              soit valide pendant une période d'horloge. Le bouton doit être
--              relâché et stable avant que b_o puisse être de nouveau valide.
--              en_i est un signal à une fréquence de 8kHz. 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity antirebond_1b is
  generic (
    GENERIC_SW_LOGIC : std_logic := '1'  -- 1=POSITIVE 0=NEGATIVE
      );
  port (
    clk_i : in  std_logic;
    en_i  : in  std_logic;
    b_i   : in  std_logic;
    b_o   : out std_logic
    );
end antirebond_1b;


architecture arch_antirebond_1b of antirebond_1b is
  signal b_shiftreg : std_logic_vector (7 downto 0);
  signal b_clean    : std_logic;
  signal cnt        : unsigned(4 downto 0) := (others => '0');  -- en simulation
  -- signal cnt        : unsigned(15 downto 0) := (others => '0');  -- en synthèse

begin

  b_o <= b_clean;


  P_sync : process(clk_i)
  begin
    if rising_edge(clk_i) then
      
      cnt <= cnt -1;

      if cnt = 0 then
        b_shiftreg <= b_shiftreg(6 downto 0) & b_i;

        if b_shiftreg = "11111111" then
          b_clean <= '1';
        elsif b_shiftreg = "00000000" then
          b_clean <= '0';
        end if;
        
      end if;
    end if;
  end process;
end arch_antirebond_1b;
