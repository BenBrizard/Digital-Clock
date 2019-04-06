-------------------------------------------------------------------------------
-- Title      : Synchronisation
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : sync_io_1.vhd
-- Author     : 
-- Created    : 
-- Last update: 2019-03-09
-------------------------------------------------------------------------------
-- Description: Module de synchronisation pour des signaux de 1 bit
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity sync_io_1 is
  generic (
    GENERIC_IO_LOGIC : std_logic := '1'  -- 1=POSITIVE 0=NEGATIVE
    );
  port (
    --source clock-domain
    sig_src_i : in  std_logic;
    --destination clock-domain 
    clk_dst_i : in  std_logic;
    sig_dst_o : out std_logic
    );
end sync_io_1;

architecture arch_sync_io_1 of sync_io_1 is

  signal sig_meta                 : std_logic;
  signal sig_dst                  : std_logic;
  attribute ASYNC_REG             : string;
  attribute ASYNC_REG of sig_meta : signal is "TRUE";
  attribute ASYNC_REG of sig_dst  : signal is "TRUE";

begin

  sig_dst_o <= sig_dst;

  resynchronisation : process(clk_dst_i)
  begin
    if rising_edge(clk_dst_i) then
        sig_meta <= sig_src_i;
        sig_dst  <= sig_meta;
      end if;
  end process;

end arch_sync_io_1;
