-------------------------------------------------------------------------------
-- Title      : registre d'alimentation
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : power_reg.vhd
-- Author     : SB
-- Created    : 2019-03-04
-- Last update: 2019-03-11
-------------------------------------------------------------------------------
-- Description: Module qui gère l'alimentation de l'écran OLED
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity power_reg is
  port(
    clk_i       : in  std_logic;
    en_pwr      : in  std_logic;
    cmd_pwr_reg : in  std_logic_vector (5 downto 0);
    pr_vdd_o    : out std_logic;
    pr_vbat_o   : out std_logic;
    pr_res_o    : out std_logic
    );
end power_reg;

architecture Behavioral of power_reg is

  constant VDD_SET_BIT  : integer := 0;
  constant VDD_BIT      : integer := 1;
  constant VBAT_SET_BIT : integer := 2;
  constant VBAT_BIT     : integer := 3;
  constant RES_SET_BIT  : integer := 4;
  constant RES_BIT      : integer := 5;

  -- Ces signaux sont initialisés à 1 parce qu'ils ne doivent pas être
  -- sensible au reset. 
  signal vdd_reg  : std_logic := '1';
  signal vbat_reg : std_logic := '1';
  signal res_reg  : std_logic := '1';

begin

  pr_vdd_o  <= vdd_reg;
  pr_vbat_o <= vbat_reg;
  pr_res_o  <= res_reg;

  process(clk_i)
  begin
    if rising_edge(clk_i) then
      if(en_pwr = '1')then
        vdd_reg <= (cmd_pwr_reg(VDD_SET_BIT) and cmd_pwr_reg(VDD_BIT)) or
                   (not cmd_pwr_reg(VDD_SET_BIT) and vdd_reg);
        vbat_reg <= (cmd_pwr_reg(VBAT_SET_BIT) and cmd_pwr_reg(VBAT_BIT))or
                    (not cmd_pwr_reg(VBAT_SET_BIT)and vbat_reg);
        res_reg <= (cmd_pwr_reg(RES_SET_BIT) and cmd_pwr_reg(RES_BIT)) or
                   (not cmd_pwr_reg(RES_SET_BIT) and res_reg);
      end if;
    end if;
  end process;
end Behavioral;
