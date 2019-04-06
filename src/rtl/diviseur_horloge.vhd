-------------------------------------------------------------------------------
-- Title      : diviseur_horloge
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : diviseur_horloge.vhd
-- Author     : SB
-- Created    : 2019-01-26
-- Last update: 2019-03-13
-------------------------------------------------------------------------------
-- Description: Génère des horloges de 1 Hz, 4 Hz, 1 kHz ou 1 MHz partir d'une
--              horloge de 100 MHz.  
--              La fréquence de sortie dépend du signal speed_i. 
------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity diviseur_horloge is
  generic (MULTIPLIER : positive := 1);
  port (rst_i   : in  std_logic;
        clk_i   : in  std_logic;
        speed_i : in  std_logic_vector(1 downto 0);
        clk_o   : out std_logic);
end diviseur_horloge;

architecture arch_diviseur_horloge of diviseur_horloge is

  signal divisor      : unsigned(31 downto 0)         := X"05f5e100";
  signal counter      : unsigned(31 downto 0)         := (others => '0');
  signal speed_r      : std_logic_vector(1 downto 0)  := (others => '0');

  constant div_1_Hz   : unsigned(31 downto 0)         := X"05f5e100";  -- 1 Hz
  constant div_4_Hz   : unsigned(31 downto 0)         := X"017d7840";  -- 4 Hz
  constant div_8_kHz  : unsigned(31 downto 0)         := X"000030D4";  -- 8 kHz
  constant div_1_MHz  : unsigned(31 downto 0)         := X"00000064";  -- 1 MHz

begin

  clk_o <= '1' when counter >= divisor else
           '0';

  process(speed_i)
  begin
    case speed_i is
      when "00"   => divisor <= resize(div_1_Hz *MULTIPLIER, divisor'length);
      when "01"   => divisor <= resize(div_4_Hz *MULTIPLIER, divisor'length);
      when "10"   => divisor <= resize(div_8_kHz*MULTIPLIER, divisor'length);
      when others => divisor <= resize(div_1_MHz*MULTIPLIER, divisor'length);
    end case;
  end process;

  -- Clock = 100 MHz
  process(clk_i)
  begin
    -- Effectuer le traitement a chaque front montant du clk_i
    if rising_edge(clk_i) then
      --  Reset Synchrone du counter
      if rst_i = '1' then
        counter <= (others => '0');
      -- Si Non 
      else
        -- Detection s'il y a eu un changement de speed
        -- Si Oui on remet a zero le outer et on met a jour le speed
        if speed_i /= speed_r then  
          counter <= (others => '0');
          speed_r <= speed_i;
        -- Si Non 
        else
          -- Si le counter est superieu a divisor on remet a zeros le counter 
          if counter >= divisor  then
            counter <= (others => '0');
          -- Si non on increment le counter
          else
            counter <= counter + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

end arch_diviseur_horloge;
