-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu Mar 28 09:24:21 2019
-- Host        : L5906-01 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               D:/tp3_bb_27mars/TP3_BB_ARD/TP3_BB_ARD.sim/sim_1/synth/func/xsim/horloge_oled_TB_func_synth.vhd
-- Design      : horloge_oled
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity antirebond_1b is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end antirebond_1b;

architecture STRUCTURE of antirebond_1b is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal b_clean_i_1_n_0 : STD_LOGIC;
  signal b_clean_i_2_n_0 : STD_LOGIC;
  signal b_clean_i_3_n_0 : STD_LOGIC;
  signal \b_shiftreg[7]_i_1_n_0\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[0]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[1]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[2]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[3]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[4]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[5]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[6]\ : STD_LOGIC;
  signal \b_shiftreg_reg_n_0_[7]\ : STD_LOGIC;
  signal \cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal minusOp : STD_LOGIC_VECTOR ( 4 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[4]_i_1\ : label is "soft_lutpair2";
begin
  SR(0) <= \^sr\(0);
b_clean_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF3FFFFA0000000"
    )
        port map (
      I0 => b_clean_i_2_n_0,
      I1 => b_clean_i_3_n_0,
      I2 => \b_shiftreg_reg_n_0_[0]\,
      I3 => \b_shiftreg_reg_n_0_[1]\,
      I4 => \b_shiftreg[7]_i_1_n_0\,
      I5 => \^sr\(0),
      O => b_clean_i_1_n_0
    );
b_clean_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \b_shiftreg_reg_n_0_[4]\,
      I1 => \b_shiftreg_reg_n_0_[5]\,
      I2 => \b_shiftreg_reg_n_0_[2]\,
      I3 => \b_shiftreg_reg_n_0_[3]\,
      I4 => \b_shiftreg_reg_n_0_[7]\,
      I5 => \b_shiftreg_reg_n_0_[6]\,
      O => b_clean_i_2_n_0
    );
b_clean_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \b_shiftreg_reg_n_0_[4]\,
      I1 => \b_shiftreg_reg_n_0_[5]\,
      I2 => \b_shiftreg_reg_n_0_[2]\,
      I3 => \b_shiftreg_reg_n_0_[3]\,
      I4 => \b_shiftreg_reg_n_0_[7]\,
      I5 => \b_shiftreg_reg_n_0_[6]\,
      O => b_clean_i_3_n_0
    );
b_clean_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => b_clean_i_1_n_0,
      Q => \^sr\(0),
      R => '0'
    );
\b_shiftreg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \cnt_reg__0\(3),
      I1 => \cnt_reg__0\(1),
      I2 => \cnt_reg__0\(0),
      I3 => \cnt_reg__0\(2),
      I4 => \cnt_reg__0\(4),
      O => \b_shiftreg[7]_i_1_n_0\
    );
\b_shiftreg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => D(0),
      Q => \b_shiftreg_reg_n_0_[0]\,
      R => '0'
    );
\b_shiftreg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[0]\,
      Q => \b_shiftreg_reg_n_0_[1]\,
      R => '0'
    );
\b_shiftreg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[1]\,
      Q => \b_shiftreg_reg_n_0_[2]\,
      R => '0'
    );
\b_shiftreg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[2]\,
      Q => \b_shiftreg_reg_n_0_[3]\,
      R => '0'
    );
\b_shiftreg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[3]\,
      Q => \b_shiftreg_reg_n_0_[4]\,
      R => '0'
    );
\b_shiftreg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[4]\,
      Q => \b_shiftreg_reg_n_0_[5]\,
      R => '0'
    );
\b_shiftreg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[5]\,
      Q => \b_shiftreg_reg_n_0_[6]\,
      R => '0'
    );
\b_shiftreg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \b_shiftreg[7]_i_1_n_0\,
      D => \b_shiftreg_reg_n_0_[6]\,
      Q => \b_shiftreg_reg_n_0_[7]\,
      R => '0'
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cnt_reg__0\(0),
      O => \cnt[0]_i_1_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \cnt_reg__0\(1),
      I1 => \cnt_reg__0\(0),
      O => minusOp(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \cnt_reg__0\(2),
      I1 => \cnt_reg__0\(0),
      I2 => \cnt_reg__0\(1),
      O => minusOp(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \cnt_reg__0\(3),
      I1 => \cnt_reg__0\(1),
      I2 => \cnt_reg__0\(0),
      I3 => \cnt_reg__0\(2),
      O => minusOp(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \cnt_reg__0\(4),
      I1 => \cnt_reg__0\(2),
      I2 => \cnt_reg__0\(0),
      I3 => \cnt_reg__0\(1),
      I4 => \cnt_reg__0\(3),
      O => minusOp(4)
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \cnt[0]_i_1_n_0\,
      Q => \cnt_reg__0\(0),
      R => '0'
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => minusOp(1),
      Q => \cnt_reg__0\(1),
      R => '0'
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => minusOp(2),
      Q => \cnt_reg__0\(2),
      R => '0'
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => minusOp(3),
      Q => \cnt_reg__0\(3),
      R => '0'
    );
\cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => minusOp(4),
      Q => \cnt_reg__0\(4),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \clk_wiz__clk_wiz_clk_wiz\ is
  port (
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \clk_wiz__clk_wiz_clk_wiz\ : entity is "clk_wiz_clk_wiz";
end \clk_wiz__clk_wiz_clk_wiz\;

architecture STRUCTURE of \clk_wiz__clk_wiz_clk_wiz\ is
  signal clk_in1_clk_wiz : STD_LOGIC;
  signal clk_out1_clk_wiz : STD_LOGIC;
  signal clk_out2_clk_wiz : STD_LOGIC;
  signal clkfbout_buf_clk_wiz : STD_LOGIC;
  signal clkfbout_clk_wiz : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clk_wiz,
      O => clkfbout_buf_clk_wiz
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clk_in1_clk_wiz
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out1_clk_wiz,
      O => clk_out1
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out2_clk_wiz,
      O => clk_out2
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 6.250000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 10.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 6.250000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 125,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clk_wiz,
      CLKFBOUT => clkfbout_clk_wiz,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_clk_wiz,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_out1_clk_wiz,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_out2_clk_wiz,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity compteur_25dutycycle is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
end compteur_25dutycycle;

architecture STRUCTURE of compteur_25dutycycle is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count_on : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \count_on[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[11]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[13]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[14]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[16]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[18]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[19]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[20]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[21]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[22]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[24]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[24]_i_2_n_0\ : STD_LOGIC;
  signal \count_on[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[31]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_on[5]_i_1_n_0\ : STD_LOGIC;
  signal count_tot : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \count_tot[31]_i_2_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_3_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_4_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_5_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_6_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_7_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_8_n_0\ : STD_LOGIC;
  signal \count_tot[31]_i_9_n_0\ : STD_LOGIC;
  signal count_tot_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \ho_dels_o_OBUF[7]_inst_i_2_n_0\ : STD_LOGIC;
  signal \ho_dels_o_OBUF[7]_inst_i_3_n_0\ : STD_LOGIC;
  signal \ho_dels_o_OBUF[7]_inst_i_4_n_0\ : STD_LOGIC;
  signal \ho_dels_o_OBUF[7]_inst_i_5_n_0\ : STD_LOGIC;
  signal \ho_dels_o_OBUF[7]_inst_i_6_n_0\ : STD_LOGIC;
  signal \ho_dels_o_OBUF[7]_inst_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_n_1\ : STD_LOGIC;
  signal \minusOp_carry__2_n_2\ : STD_LOGIC;
  signal \minusOp_carry__2_n_3\ : STD_LOGIC;
  signal \minusOp_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__3_n_1\ : STD_LOGIC;
  signal \minusOp_carry__3_n_2\ : STD_LOGIC;
  signal \minusOp_carry__3_n_3\ : STD_LOGIC;
  signal \minusOp_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__4_n_1\ : STD_LOGIC;
  signal \minusOp_carry__4_n_2\ : STD_LOGIC;
  signal \minusOp_carry__4_n_3\ : STD_LOGIC;
  signal \minusOp_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__5_n_0\ : STD_LOGIC;
  signal \minusOp_carry__5_n_1\ : STD_LOGIC;
  signal \minusOp_carry__5_n_2\ : STD_LOGIC;
  signal \minusOp_carry__5_n_3\ : STD_LOGIC;
  signal \minusOp_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__6_n_2\ : STD_LOGIC;
  signal \minusOp_carry__6_n_3\ : STD_LOGIC;
  signal minusOp_carry_i_1_n_0 : STD_LOGIC;
  signal minusOp_carry_i_2_n_0 : STD_LOGIC;
  signal minusOp_carry_i_3_n_0 : STD_LOGIC;
  signal minusOp_carry_i_4_n_0 : STD_LOGIC;
  signal minusOp_carry_n_0 : STD_LOGIC;
  signal minusOp_carry_n_1 : STD_LOGIC;
  signal minusOp_carry_n_2 : STD_LOGIC;
  signal minusOp_carry_n_3 : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__2_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__3_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__4_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__5_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__6_n_7\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \NLW_minusOp_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_minusOp_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_minusOp_inferred__0/i__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_minusOp_inferred__0/i__carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  E(0) <= \^e\(0);
\count_on[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555557"
    )
        port map (
      I0 => count_on(0),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[0]_i_1_n_0\
    );
\count_on[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__1_n_5\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[11]_i_1_n_0\
    );
\count_on[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__1_n_4\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[12]_i_1_n_0\
    );
\count_on[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__2_n_7\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[13]_i_1_n_0\
    );
\count_on[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__2_n_6\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[14]_i_1_n_0\
    );
\count_on[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__2_n_4\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[16]_i_1_n_0\
    );
\count_on[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__3_n_6\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[18]_i_1_n_0\
    );
\count_on[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__3_n_5\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[19]_i_1_n_0\
    );
\count_on[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry_n_7\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[1]_i_1_n_0\
    );
\count_on[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__3_n_4\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[20]_i_1_n_0\
    );
\count_on[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__4_n_7\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[21]_i_1_n_0\
    );
\count_on[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__4_n_6\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[22]_i_1_n_0\
    );
\count_on[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \^e\(0),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[24]_i_1_n_0\
    );
\count_on[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__4_n_4\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[24]_i_2_n_0\
    );
\count_on[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry_n_6\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[2]_i_1_n_0\
    );
\count_on[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => SR(0),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[31]_i_1_n_0\
    );
\count_on[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry_n_5\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[3]_i_1_n_0\
    );
\count_on[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry_n_4\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[4]_i_1_n_0\
    );
\count_on[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \minusOp_inferred__0/i__carry__0_n_7\,
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => \count_on[5]_i_1_n_0\
    );
\count_on_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[0]_i_1_n_0\,
      Q => count_on(0),
      R => SR(0)
    );
\count_on_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__1_n_6\,
      Q => count_on(10),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[11]_i_1_n_0\,
      Q => count_on(11),
      R => SR(0)
    );
\count_on_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[12]_i_1_n_0\,
      Q => count_on(12),
      R => SR(0)
    );
\count_on_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[13]_i_1_n_0\,
      Q => count_on(13),
      R => SR(0)
    );
\count_on_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[14]_i_1_n_0\,
      Q => count_on(14),
      R => SR(0)
    );
\count_on_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__2_n_5\,
      Q => count_on(15),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[16]_i_1_n_0\,
      Q => count_on(16),
      R => SR(0)
    );
\count_on_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__3_n_7\,
      Q => count_on(17),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[18]_i_1_n_0\,
      Q => count_on(18),
      R => SR(0)
    );
\count_on_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[19]_i_1_n_0\,
      Q => count_on(19),
      R => SR(0)
    );
\count_on_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[1]_i_1_n_0\,
      Q => count_on(1),
      R => SR(0)
    );
\count_on_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[20]_i_1_n_0\,
      Q => count_on(20),
      R => SR(0)
    );
\count_on_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[21]_i_1_n_0\,
      Q => count_on(21),
      R => SR(0)
    );
\count_on_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[22]_i_1_n_0\,
      Q => count_on(22),
      R => SR(0)
    );
\count_on_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__4_n_5\,
      Q => count_on(23),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[24]_i_2_n_0\,
      Q => count_on(24),
      R => SR(0)
    );
\count_on_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__5_n_7\,
      Q => count_on(25),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__5_n_6\,
      Q => count_on(26),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__5_n_5\,
      Q => count_on(27),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__5_n_4\,
      Q => count_on(28),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__6_n_7\,
      Q => count_on(29),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[2]_i_1_n_0\,
      Q => count_on(2),
      R => SR(0)
    );
\count_on_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__6_n_6\,
      Q => count_on(30),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__6_n_5\,
      Q => count_on(31),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[3]_i_1_n_0\,
      Q => count_on(3),
      R => SR(0)
    );
\count_on_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[4]_i_1_n_0\,
      Q => count_on(4),
      R => SR(0)
    );
\count_on_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_on[24]_i_1_n_0\,
      D => \count_on[5]_i_1_n_0\,
      Q => count_on(5),
      R => SR(0)
    );
\count_on_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__0_n_6\,
      Q => count_on(6),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__0_n_5\,
      Q => count_on(7),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__0_n_4\,
      Q => count_on(8),
      R => \count_on[31]_i_1_n_0\
    );
\count_on_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \^e\(0),
      D => \minusOp_inferred__0/i__carry__1_n_7\,
      Q => count_on(9),
      R => \count_on[31]_i_1_n_0\
    );
\count_tot[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(0),
      O => count_tot_0(0)
    );
\count_tot[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(10),
      O => count_tot_0(10)
    );
\count_tot[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(11),
      O => count_tot_0(11)
    );
\count_tot[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(12),
      O => count_tot_0(12)
    );
\count_tot[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(13),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(13)
    );
\count_tot[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(14),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(14)
    );
\count_tot[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(15),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(15)
    );
\count_tot[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(16),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(16)
    );
\count_tot[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(17),
      O => count_tot_0(17)
    );
\count_tot[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(18),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(18)
    );
\count_tot[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(19),
      O => count_tot_0(19)
    );
\count_tot[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(1),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(1)
    );
\count_tot[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(20),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(20)
    );
\count_tot[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(21),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(21)
    );
\count_tot[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(22),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(22)
    );
\count_tot[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(23),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(23)
    );
\count_tot[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(24),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(24)
    );
\count_tot[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(25),
      O => count_tot_0(25)
    );
\count_tot[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(26),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(26)
    );
\count_tot[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(27),
      O => count_tot_0(27)
    );
\count_tot[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(28),
      O => count_tot_0(28)
    );
\count_tot[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(29),
      O => count_tot_0(29)
    );
\count_tot[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(2),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(2)
    );
\count_tot[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(30),
      O => count_tot_0(30)
    );
\count_tot[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(31),
      O => count_tot_0(31)
    );
\count_tot[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => count_tot(18),
      I1 => count_tot(19),
      I2 => count_tot(16),
      I3 => count_tot(17),
      I4 => \count_tot[31]_i_6_n_0\,
      O => \count_tot[31]_i_2_n_0\
    );
\count_tot[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => count_tot(26),
      I1 => count_tot(27),
      I2 => count_tot(24),
      I3 => count_tot(25),
      I4 => \count_tot[31]_i_7_n_0\,
      O => \count_tot[31]_i_3_n_0\
    );
\count_tot[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => count_tot(2),
      I1 => count_tot(3),
      I2 => count_tot(0),
      I3 => count_tot(1),
      I4 => \count_tot[31]_i_8_n_0\,
      O => \count_tot[31]_i_4_n_0\
    );
\count_tot[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => count_tot(10),
      I1 => count_tot(11),
      I2 => count_tot(8),
      I3 => count_tot(9),
      I4 => \count_tot[31]_i_9_n_0\,
      O => \count_tot[31]_i_5_n_0\
    );
\count_tot[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count_tot(21),
      I1 => count_tot(20),
      I2 => count_tot(23),
      I3 => count_tot(22),
      O => \count_tot[31]_i_6_n_0\
    );
\count_tot[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count_tot(29),
      I1 => count_tot(28),
      I2 => count_tot(31),
      I3 => count_tot(30),
      O => \count_tot[31]_i_7_n_0\
    );
\count_tot[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count_tot(5),
      I1 => count_tot(4),
      I2 => count_tot(7),
      I3 => count_tot(6),
      O => \count_tot[31]_i_8_n_0\
    );
\count_tot[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count_tot(13),
      I1 => count_tot(12),
      I2 => count_tot(15),
      I3 => count_tot(14),
      O => \count_tot[31]_i_9_n_0\
    );
\count_tot[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(3),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(3)
    );
\count_tot[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(4),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(4)
    );
\count_tot[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(5),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(5)
    );
\count_tot[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(6),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(6)
    );
\count_tot[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(7),
      I1 => \count_tot[31]_i_2_n_0\,
      I2 => \count_tot[31]_i_3_n_0\,
      I3 => \count_tot[31]_i_4_n_0\,
      I4 => \count_tot[31]_i_5_n_0\,
      O => count_tot_0(7)
    );
\count_tot[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(8),
      O => count_tot_0(8)
    );
\count_tot[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \count_tot[31]_i_2_n_0\,
      I1 => \count_tot[31]_i_3_n_0\,
      I2 => \count_tot[31]_i_4_n_0\,
      I3 => \count_tot[31]_i_5_n_0\,
      I4 => data0(9),
      O => count_tot_0(9)
    );
\count_tot_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(0),
      Q => count_tot(0),
      R => SR(0)
    );
\count_tot_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(10),
      Q => count_tot(10),
      R => SR(0)
    );
\count_tot_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(11),
      Q => count_tot(11),
      R => SR(0)
    );
\count_tot_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(12),
      Q => count_tot(12),
      R => SR(0)
    );
\count_tot_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(13),
      Q => count_tot(13),
      R => SR(0)
    );
\count_tot_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(14),
      Q => count_tot(14),
      R => SR(0)
    );
\count_tot_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(15),
      Q => count_tot(15),
      R => SR(0)
    );
\count_tot_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(16),
      Q => count_tot(16),
      R => SR(0)
    );
\count_tot_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(17),
      Q => count_tot(17),
      R => SR(0)
    );
\count_tot_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(18),
      Q => count_tot(18),
      R => SR(0)
    );
\count_tot_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(19),
      Q => count_tot(19),
      R => SR(0)
    );
\count_tot_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(1),
      Q => count_tot(1),
      R => SR(0)
    );
\count_tot_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(20),
      Q => count_tot(20),
      R => SR(0)
    );
\count_tot_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(21),
      Q => count_tot(21),
      R => SR(0)
    );
\count_tot_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(22),
      Q => count_tot(22),
      R => SR(0)
    );
\count_tot_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(23),
      Q => count_tot(23),
      R => SR(0)
    );
\count_tot_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(24),
      Q => count_tot(24),
      R => SR(0)
    );
\count_tot_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(25),
      Q => count_tot(25),
      R => SR(0)
    );
\count_tot_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(26),
      Q => count_tot(26),
      R => SR(0)
    );
\count_tot_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(27),
      Q => count_tot(27),
      R => SR(0)
    );
\count_tot_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(28),
      Q => count_tot(28),
      R => SR(0)
    );
\count_tot_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(29),
      Q => count_tot(29),
      R => SR(0)
    );
\count_tot_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(2),
      Q => count_tot(2),
      R => SR(0)
    );
\count_tot_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(30),
      Q => count_tot(30),
      R => SR(0)
    );
\count_tot_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(31),
      Q => count_tot(31),
      R => SR(0)
    );
\count_tot_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(3),
      Q => count_tot(3),
      R => SR(0)
    );
\count_tot_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(4),
      Q => count_tot(4),
      R => SR(0)
    );
\count_tot_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(5),
      Q => count_tot(5),
      R => SR(0)
    );
\count_tot_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(6),
      Q => count_tot(6),
      R => SR(0)
    );
\count_tot_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(7),
      Q => count_tot(7),
      R => SR(0)
    );
\count_tot_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(8),
      Q => count_tot(8),
      R => SR(0)
    );
\count_tot_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => count_tot_0(9),
      Q => count_tot(9),
      R => SR(0)
    );
\ho_dels_o_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \ho_dels_o_OBUF[7]_inst_i_2_n_0\,
      I1 => \ho_dels_o_OBUF[7]_inst_i_3_n_0\,
      I2 => \ho_dels_o_OBUF[7]_inst_i_4_n_0\,
      I3 => \ho_dels_o_OBUF[7]_inst_i_5_n_0\,
      I4 => \ho_dels_o_OBUF[7]_inst_i_6_n_0\,
      I5 => \ho_dels_o_OBUF[7]_inst_i_7_n_0\,
      O => \^e\(0)
    );
\ho_dels_o_OBUF[7]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => count_on(12),
      I1 => count_on(13),
      I2 => count_on(10),
      I3 => count_on(11),
      I4 => count_on(9),
      I5 => count_on(8),
      O => \ho_dels_o_OBUF[7]_inst_i_2_n_0\
    );
\ho_dels_o_OBUF[7]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => count_on(18),
      I1 => count_on(19),
      I2 => count_on(16),
      I3 => count_on(17),
      I4 => count_on(15),
      I5 => count_on(14),
      O => \ho_dels_o_OBUF[7]_inst_i_3_n_0\
    );
\ho_dels_o_OBUF[7]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => count_on(30),
      I1 => count_on(31),
      I2 => count_on(28),
      I3 => count_on(29),
      I4 => count_on(27),
      I5 => count_on(26),
      O => \ho_dels_o_OBUF[7]_inst_i_4_n_0\
    );
\ho_dels_o_OBUF[7]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => count_on(24),
      I1 => count_on(25),
      I2 => count_on(22),
      I3 => count_on(23),
      I4 => count_on(21),
      I5 => count_on(20),
      O => \ho_dels_o_OBUF[7]_inst_i_5_n_0\
    );
\ho_dels_o_OBUF[7]_inst_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => count_on(0),
      I1 => count_on(1),
      O => \ho_dels_o_OBUF[7]_inst_i_6_n_0\
    );
\ho_dels_o_OBUF[7]_inst_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => count_on(6),
      I1 => count_on(7),
      I2 => count_on(4),
      I3 => count_on(5),
      I4 => count_on(3),
      I5 => count_on(2),
      O => \ho_dels_o_OBUF[7]_inst_i_7_n_0\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(8),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(7),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(6),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(5),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(12),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(11),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(10),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(9),
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(16),
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(15),
      O => \i__carry__2_i_2_n_0\
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(14),
      O => \i__carry__2_i_3_n_0\
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(13),
      O => \i__carry__2_i_4_n_0\
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(20),
      O => \i__carry__3_i_1_n_0\
    );
\i__carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(19),
      O => \i__carry__3_i_2_n_0\
    );
\i__carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(18),
      O => \i__carry__3_i_3_n_0\
    );
\i__carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(17),
      O => \i__carry__3_i_4_n_0\
    );
\i__carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(24),
      O => \i__carry__4_i_1_n_0\
    );
\i__carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(23),
      O => \i__carry__4_i_2_n_0\
    );
\i__carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(22),
      O => \i__carry__4_i_3_n_0\
    );
\i__carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(21),
      O => \i__carry__4_i_4_n_0\
    );
\i__carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(28),
      O => \i__carry__5_i_1_n_0\
    );
\i__carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(27),
      O => \i__carry__5_i_2_n_0\
    );
\i__carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(26),
      O => \i__carry__5_i_3_n_0\
    );
\i__carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(25),
      O => \i__carry__5_i_4_n_0\
    );
\i__carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(31),
      O => \i__carry__6_i_1_n_0\
    );
\i__carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(30),
      O => \i__carry__6_i_2_n_0\
    );
\i__carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(29),
      O => \i__carry__6_i_3_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(4),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(3),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(2),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_on(1),
      O => \i__carry_i_4_n_0\
    );
minusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => minusOp_carry_n_0,
      CO(2) => minusOp_carry_n_1,
      CO(1) => minusOp_carry_n_2,
      CO(0) => minusOp_carry_n_3,
      CYINIT => count_tot(0),
      DI(3 downto 0) => count_tot(4 downto 1),
      O(3 downto 0) => data0(4 downto 1),
      S(3) => minusOp_carry_i_1_n_0,
      S(2) => minusOp_carry_i_2_n_0,
      S(1) => minusOp_carry_i_3_n_0,
      S(0) => minusOp_carry_i_4_n_0
    );
\minusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => minusOp_carry_n_0,
      CO(3) => \minusOp_carry__0_n_0\,
      CO(2) => \minusOp_carry__0_n_1\,
      CO(1) => \minusOp_carry__0_n_2\,
      CO(0) => \minusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_tot(8 downto 5),
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \minusOp_carry__0_i_1_n_0\,
      S(2) => \minusOp_carry__0_i_2_n_0\,
      S(1) => \minusOp_carry__0_i_3_n_0\,
      S(0) => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(8),
      O => \minusOp_carry__0_i_1_n_0\
    );
\minusOp_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(7),
      O => \minusOp_carry__0_i_2_n_0\
    );
\minusOp_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(6),
      O => \minusOp_carry__0_i_3_n_0\
    );
\minusOp_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(5),
      O => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__0_n_0\,
      CO(3) => \minusOp_carry__1_n_0\,
      CO(2) => \minusOp_carry__1_n_1\,
      CO(1) => \minusOp_carry__1_n_2\,
      CO(0) => \minusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_tot(12 downto 9),
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \minusOp_carry__1_i_1_n_0\,
      S(2) => \minusOp_carry__1_i_2_n_0\,
      S(1) => \minusOp_carry__1_i_3_n_0\,
      S(0) => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(12),
      O => \minusOp_carry__1_i_1_n_0\
    );
\minusOp_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(11),
      O => \minusOp_carry__1_i_2_n_0\
    );
\minusOp_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(10),
      O => \minusOp_carry__1_i_3_n_0\
    );
\minusOp_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(9),
      O => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__1_n_0\,
      CO(3) => \minusOp_carry__2_n_0\,
      CO(2) => \minusOp_carry__2_n_1\,
      CO(1) => \minusOp_carry__2_n_2\,
      CO(0) => \minusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_tot(16 downto 13),
      O(3 downto 0) => data0(16 downto 13),
      S(3) => \minusOp_carry__2_i_1_n_0\,
      S(2) => \minusOp_carry__2_i_2_n_0\,
      S(1) => \minusOp_carry__2_i_3_n_0\,
      S(0) => \minusOp_carry__2_i_4_n_0\
    );
\minusOp_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(16),
      O => \minusOp_carry__2_i_1_n_0\
    );
\minusOp_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(15),
      O => \minusOp_carry__2_i_2_n_0\
    );
\minusOp_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(14),
      O => \minusOp_carry__2_i_3_n_0\
    );
\minusOp_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(13),
      O => \minusOp_carry__2_i_4_n_0\
    );
\minusOp_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__2_n_0\,
      CO(3) => \minusOp_carry__3_n_0\,
      CO(2) => \minusOp_carry__3_n_1\,
      CO(1) => \minusOp_carry__3_n_2\,
      CO(0) => \minusOp_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_tot(20 downto 17),
      O(3 downto 0) => data0(20 downto 17),
      S(3) => \minusOp_carry__3_i_1_n_0\,
      S(2) => \minusOp_carry__3_i_2_n_0\,
      S(1) => \minusOp_carry__3_i_3_n_0\,
      S(0) => \minusOp_carry__3_i_4_n_0\
    );
\minusOp_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(20),
      O => \minusOp_carry__3_i_1_n_0\
    );
\minusOp_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(19),
      O => \minusOp_carry__3_i_2_n_0\
    );
\minusOp_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(18),
      O => \minusOp_carry__3_i_3_n_0\
    );
\minusOp_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(17),
      O => \minusOp_carry__3_i_4_n_0\
    );
\minusOp_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__3_n_0\,
      CO(3) => \minusOp_carry__4_n_0\,
      CO(2) => \minusOp_carry__4_n_1\,
      CO(1) => \minusOp_carry__4_n_2\,
      CO(0) => \minusOp_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_tot(24 downto 21),
      O(3 downto 0) => data0(24 downto 21),
      S(3) => \minusOp_carry__4_i_1_n_0\,
      S(2) => \minusOp_carry__4_i_2_n_0\,
      S(1) => \minusOp_carry__4_i_3_n_0\,
      S(0) => \minusOp_carry__4_i_4_n_0\
    );
\minusOp_carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(24),
      O => \minusOp_carry__4_i_1_n_0\
    );
\minusOp_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(23),
      O => \minusOp_carry__4_i_2_n_0\
    );
\minusOp_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(22),
      O => \minusOp_carry__4_i_3_n_0\
    );
\minusOp_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(21),
      O => \minusOp_carry__4_i_4_n_0\
    );
\minusOp_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__4_n_0\,
      CO(3) => \minusOp_carry__5_n_0\,
      CO(2) => \minusOp_carry__5_n_1\,
      CO(1) => \minusOp_carry__5_n_2\,
      CO(0) => \minusOp_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_tot(28 downto 25),
      O(3 downto 0) => data0(28 downto 25),
      S(3) => \minusOp_carry__5_i_1_n_0\,
      S(2) => \minusOp_carry__5_i_2_n_0\,
      S(1) => \minusOp_carry__5_i_3_n_0\,
      S(0) => \minusOp_carry__5_i_4_n_0\
    );
\minusOp_carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(28),
      O => \minusOp_carry__5_i_1_n_0\
    );
\minusOp_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(27),
      O => \minusOp_carry__5_i_2_n_0\
    );
\minusOp_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(26),
      O => \minusOp_carry__5_i_3_n_0\
    );
\minusOp_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(25),
      O => \minusOp_carry__5_i_4_n_0\
    );
\minusOp_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__5_n_0\,
      CO(3 downto 2) => \NLW_minusOp_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \minusOp_carry__6_n_2\,
      CO(0) => \minusOp_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => count_tot(30 downto 29),
      O(3) => \NLW_minusOp_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2) => \minusOp_carry__6_i_1_n_0\,
      S(1) => \minusOp_carry__6_i_2_n_0\,
      S(0) => \minusOp_carry__6_i_3_n_0\
    );
\minusOp_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(31),
      O => \minusOp_carry__6_i_1_n_0\
    );
\minusOp_carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(30),
      O => \minusOp_carry__6_i_2_n_0\
    );
\minusOp_carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(29),
      O => \minusOp_carry__6_i_3_n_0\
    );
minusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(4),
      O => minusOp_carry_i_1_n_0
    );
minusOp_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(3),
      O => minusOp_carry_i_2_n_0
    );
minusOp_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(2),
      O => minusOp_carry_i_3_n_0
    );
minusOp_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_tot(1),
      O => minusOp_carry_i_4_n_0
    );
\minusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \minusOp_inferred__0/i__carry_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry_n_3\,
      CYINIT => count_on(0),
      DI(3 downto 0) => count_on(4 downto 1),
      O(3) => \minusOp_inferred__0/i__carry_n_4\,
      O(2) => \minusOp_inferred__0/i__carry_n_5\,
      O(1) => \minusOp_inferred__0/i__carry_n_6\,
      O(0) => \minusOp_inferred__0/i__carry_n_7\,
      S(3) => \i__carry_i_1_n_0\,
      S(2) => \i__carry_i_2_n_0\,
      S(1) => \i__carry_i_3_n_0\,
      S(0) => \i__carry_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__0_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__0_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__0_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_on(8 downto 5),
      O(3) => \minusOp_inferred__0/i__carry__0_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__0_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__0_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_1_n_0\,
      S(2) => \i__carry__0_i_2_n_0\,
      S(1) => \i__carry__0_i_3_n_0\,
      S(0) => \i__carry__0_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__0_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__1_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__1_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__1_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_on(12 downto 9),
      O(3) => \minusOp_inferred__0/i__carry__1_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__1_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__1_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__1_n_7\,
      S(3) => \i__carry__1_i_1_n_0\,
      S(2) => \i__carry__1_i_2_n_0\,
      S(1) => \i__carry__1_i_3_n_0\,
      S(0) => \i__carry__1_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__1_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__2_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__2_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__2_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_on(16 downto 13),
      O(3) => \minusOp_inferred__0/i__carry__2_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__2_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__2_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__2_n_7\,
      S(3) => \i__carry__2_i_1_n_0\,
      S(2) => \i__carry__2_i_2_n_0\,
      S(1) => \i__carry__2_i_3_n_0\,
      S(0) => \i__carry__2_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__2_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__3_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__3_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__3_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_on(20 downto 17),
      O(3) => \minusOp_inferred__0/i__carry__3_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__3_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__3_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__3_n_7\,
      S(3) => \i__carry__3_i_1_n_0\,
      S(2) => \i__carry__3_i_2_n_0\,
      S(1) => \i__carry__3_i_3_n_0\,
      S(0) => \i__carry__3_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__3_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__4_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__4_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__4_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_on(24 downto 21),
      O(3) => \minusOp_inferred__0/i__carry__4_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__4_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__4_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__4_n_7\,
      S(3) => \i__carry__4_i_1_n_0\,
      S(2) => \i__carry__4_i_2_n_0\,
      S(1) => \i__carry__4_i_3_n_0\,
      S(0) => \i__carry__4_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__4_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__5_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__5_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__5_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => count_on(28 downto 25),
      O(3) => \minusOp_inferred__0/i__carry__5_n_4\,
      O(2) => \minusOp_inferred__0/i__carry__5_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__5_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__5_n_7\,
      S(3) => \i__carry__5_i_1_n_0\,
      S(2) => \i__carry__5_i_2_n_0\,
      S(1) => \i__carry__5_i_3_n_0\,
      S(0) => \i__carry__5_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__5_n_0\,
      CO(3 downto 2) => \NLW_minusOp_inferred__0/i__carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \minusOp_inferred__0/i__carry__6_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => count_on(30 downto 29),
      O(3) => \NLW_minusOp_inferred__0/i__carry__6_O_UNCONNECTED\(3),
      O(2) => \minusOp_inferred__0/i__carry__6_n_5\,
      O(1) => \minusOp_inferred__0/i__carry__6_n_6\,
      O(0) => \minusOp_inferred__0/i__carry__6_n_7\,
      S(3) => '0',
      S(2) => \i__carry__6_i_1_n_0\,
      S(1) => \i__carry__6_i_2_n_0\,
      S(0) => \i__carry__6_i_3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity spi_master is
  port (
    ho_spi_sclk_OBUF : out STD_LOGIC;
    clk_out2 : in STD_LOGIC
  );
end spi_master;

architecture STRUCTURE of spi_master is
  signal count : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ho_spi_sclk_OBUF_inst_i_1 : label is "soft_lutpair0";
begin
\count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F0E"
    )
        port map (
      I0 => count(3),
      I1 => count(2),
      I2 => count(0),
      I3 => count(1),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F00E"
    )
        port map (
      I0 => count(3),
      I1 => count(2),
      I2 => count(0),
      I3 => count(1),
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCC2"
    )
        port map (
      I0 => count(3),
      I1 => count(2),
      I2 => count(0),
      I3 => count(1),
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => count(3),
      I1 => count(2),
      I2 => count(1),
      I3 => count(0),
      O => \count[3]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => count(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => count(2),
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out2,
      CE => '1',
      D => \count[3]_i_1_n_0\,
      Q => count(3),
      R => '0'
    );
ho_spi_sclk_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE01FFFF"
    )
        port map (
      I0 => count(0),
      I1 => count(1),
      I2 => count(2),
      I3 => count(3),
      I4 => clk_out2,
      O => ho_spi_sclk_OBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sync_io_1 is
  port (
    \out\ : out STD_LOGIC;
    clk_out1 : in STD_LOGIC;
    rst_i_n_IBUF : in STD_LOGIC
  );
end sync_io_1;

architecture STRUCTURE of sync_io_1 is
  signal midway_rst_i : STD_LOGIC;
  signal sig_dst : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sig_dst : signal is "true";
  signal sig_meta : STD_LOGIC;
  attribute async_reg of sig_meta : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sig_dst_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sig_dst_reg : label is "yes";
  attribute ASYNC_REG_boolean of sig_meta_reg : label is std.standard.true;
  attribute KEEP of sig_meta_reg : label is "yes";
begin
  \out\ <= sig_dst;
sig_dst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => sig_meta,
      Q => sig_dst,
      R => '0'
    );
sig_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out1,
      CE => '1',
      D => midway_rst_i,
      Q => sig_meta,
      R => '0'
    );
sig_src_i_inferred_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_i_n_IBUF,
      O => midway_rst_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sync_io_1_0 is
  port (
    sig_meta_reg_0 : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sync_io_1_0 : entity is "sync_io_1";
end sync_io_1_0;

architecture STRUCTURE of sync_io_1_0 is
  signal sig_dst : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sig_dst : signal is "true";
  signal sig_meta : STD_LOGIC;
  attribute async_reg of sig_meta : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sig_dst_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sig_dst_reg : label is "yes";
  attribute ASYNC_REG_boolean of sig_meta_reg : label is std.standard.true;
  attribute KEEP of sig_meta_reg : label is "yes";
begin
sig_dst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta,
      Q => sig_dst,
      R => '0'
    );
sig_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta_reg_0,
      Q => sig_meta,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sync_io_1_1 is
  port (
    sig_meta_reg_0 : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sync_io_1_1 : entity is "sync_io_1";
end sync_io_1_1;

architecture STRUCTURE of sync_io_1_1 is
  signal sig_dst : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sig_dst : signal is "true";
  signal sig_meta : STD_LOGIC;
  attribute async_reg of sig_meta : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sig_dst_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sig_dst_reg : label is "yes";
  attribute ASYNC_REG_boolean of sig_meta_reg : label is std.standard.true;
  attribute KEEP of sig_meta_reg : label is "yes";
begin
sig_dst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta,
      Q => sig_dst,
      R => '0'
    );
sig_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta_reg_0,
      Q => sig_meta,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sync_io_1_2 is
  port (
    speed_i_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sync_io_1_2 : entity is "sync_io_1";
end sync_io_1_2;

architecture STRUCTURE of sync_io_1_2 is
  signal sig_dst : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sig_dst : signal is "true";
  signal sig_meta : STD_LOGIC;
  attribute async_reg of sig_meta : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sig_dst_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sig_dst_reg : label is "yes";
  attribute ASYNC_REG_boolean of sig_meta_reg : label is std.standard.true;
  attribute KEEP of sig_meta_reg : label is "yes";
begin
sig_dst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta,
      Q => sig_dst,
      R => '0'
    );
sig_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => speed_i_IBUF(0),
      Q => sig_meta,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sync_io_1_3 is
  port (
    speed_i_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sync_io_1_3 : entity is "sync_io_1";
end sync_io_1_3;

architecture STRUCTURE of sync_io_1_3 is
  signal sig_dst : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sig_dst : signal is "true";
  signal sig_meta : STD_LOGIC;
  attribute async_reg of sig_meta : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sig_dst_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sig_dst_reg : label is "yes";
  attribute ASYNC_REG_boolean of sig_meta_reg : label is std.standard.true;
  attribute KEEP of sig_meta_reg : label is "yes";
begin
sig_dst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta,
      Q => sig_dst,
      R => '0'
    );
sig_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => speed_i_IBUF(0),
      Q => sig_meta,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sync_io_1_4 is
  port (
    in0 : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sync_io_1_4 : entity is "sync_io_1";
end sync_io_1_4;

architecture STRUCTURE of sync_io_1_4 is
  signal sig_dst : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of sig_dst : signal is "true";
  signal sig_meta : STD_LOGIC;
  attribute async_reg of sig_meta : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of sig_dst_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of sig_dst_reg : label is "yes";
  attribute ASYNC_REG_boolean of sig_meta_reg : label is std.standard.true;
  attribute KEEP of sig_meta_reg : label is "yes";
begin
sig_dst_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sig_meta,
      Q => sig_dst,
      R => '0'
    );
sig_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => in0,
      Q => sig_meta,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz is
  port (
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clk_wiz;

architecture STRUCTURE of clk_wiz is
begin
inst: entity work.\clk_wiz__clk_wiz_clk_wiz\
     port map (
      clk_in1 => clk_in1,
      clk_out1 => clk_out1,
      clk_out2 => clk_out2,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity horloge is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    in0 : in STD_LOGIC;
    sig_meta_reg : in STD_LOGIC;
    sig_meta_reg_0 : in STD_LOGIC;
    speed_i_IBUF : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end horloge;

architecture STRUCTURE of horloge is
begin
inst_clk_io_left: entity work.sync_io_1_0
     port map (
      CLK => CLK,
      sig_meta_reg_0 => sig_meta_reg_0
    );
inst_sync_io_center: entity work.sync_io_1_1
     port map (
      CLK => CLK,
      sig_meta_reg_0 => sig_meta_reg
    );
inst_sync_io_speed_0: entity work.sync_io_1_2
     port map (
      CLK => CLK,
      speed_i_IBUF(0) => speed_i_IBUF(0)
    );
inst_sync_io_speed_1: entity work.sync_io_1_3
     port map (
      CLK => CLK,
      speed_i_IBUF(0) => speed_i_IBUF(1)
    );
inst_sync_io_up: entity work.sync_io_1_4
     port map (
      CLK => CLK,
      in0 => in0
    );
trotteuse: entity work.compteur_25dutycycle
     port map (
      CLK => CLK,
      E(0) => E(0),
      SR(0) => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity horloge_oled is
  port (
    clk_100mhz_i : in STD_LOGIC;
    rst_i_n : in STD_LOGIC;
    mode_i : in STD_LOGIC;
    inc_one_i : in STD_LOGIC;
    inc_ten_i : in STD_LOGIC;
    speed_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ho_dels_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ho_df_dc : out STD_LOGIC;
    ho_pr_vdd : out STD_LOGIC;
    ho_pr_vbat : out STD_LOGIC;
    ho_pr_res : out STD_LOGIC;
    ho_spi_sclk : out STD_LOGIC;
    ho_spi_mosi : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of horloge_oled : entity is true;
end horloge_oled;

architecture STRUCTURE of horloge_oled is
  signal b_o : STD_LOGIC;
  signal clk_out1 : STD_LOGIC;
  signal clk_out2 : STD_LOGIC;
  signal ho_dels_o_OBUF : STD_LOGIC_VECTOR ( 7 to 7 );
  signal ho_spi_sclk_OBUF : STD_LOGIC;
  signal inc_one_i_IBUF : STD_LOGIC;
  signal inc_ten_i_IBUF : STD_LOGIC;
  signal mode_i_IBUF : STD_LOGIC;
  signal rst_i_n_IBUF : STD_LOGIC;
  signal sig_dst_o : STD_LOGIC;
  signal speed_i_IBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_Inst_clk_wiz_locked_UNCONNECTED : STD_LOGIC;
  attribute syn_black_box : string;
  attribute syn_black_box of Inst_clk_wiz : label is "TRUE";
begin
Inst_clk_wiz: entity work.clk_wiz
     port map (
      clk_in1 => clk_100mhz_i,
      clk_out1 => clk_out1,
      clk_out2 => clk_out2,
      locked => NLW_Inst_clk_wiz_locked_UNCONNECTED,
      reset => '0'
    );
Inst_spi_master: entity work.spi_master
     port map (
      clk_out2 => clk_out2,
      ho_spi_sclk_OBUF => ho_spi_sclk_OBUF
    );
\ho_dels_o_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(0)
    );
\ho_dels_o_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(1)
    );
\ho_dels_o_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(2)
    );
\ho_dels_o_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(3)
    );
\ho_dels_o_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(4)
    );
\ho_dels_o_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(5)
    );
\ho_dels_o_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_dels_o(6)
    );
\ho_dels_o_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ho_dels_o_OBUF(7),
      O => ho_dels_o(7)
    );
ho_df_dc_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_df_dc
    );
ho_pr_res_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => ho_pr_res
    );
ho_pr_vbat_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => ho_pr_vbat
    );
ho_pr_vdd_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => ho_pr_vdd
    );
ho_spi_mosi_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => ho_spi_mosi
    );
ho_spi_sclk_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => ho_spi_sclk_OBUF,
      O => ho_spi_sclk
    );
inc_one_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => inc_one_i,
      O => inc_one_i_IBUF
    );
inc_ten_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => inc_ten_i,
      O => inc_ten_i_IBUF
    );
inst_ar_rst: entity work.antirebond_1b
     port map (
      CLK => clk_out1,
      D(0) => sig_dst_o,
      SR(0) => b_o
    );
inst_horloge: entity work.horloge
     port map (
      CLK => clk_out1,
      E(0) => ho_dels_o_OBUF(7),
      SR(0) => b_o,
      in0 => inc_one_i_IBUF,
      sig_meta_reg => mode_i_IBUF,
      sig_meta_reg_0 => inc_ten_i_IBUF,
      speed_i_IBUF(1 downto 0) => speed_i_IBUF(1 downto 0)
    );
inst_sync_io_rst: entity work.sync_io_1
     port map (
      clk_out1 => clk_out1,
      \out\ => sig_dst_o,
      rst_i_n_IBUF => rst_i_n_IBUF
    );
mode_i_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => mode_i,
      O => mode_i_IBUF
    );
rst_i_n_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst_i_n,
      O => rst_i_n_IBUF
    );
\speed_i_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => speed_i(0),
      O => speed_i_IBUF(0)
    );
\speed_i_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => speed_i(1),
      O => speed_i_IBUF(1)
    );
end STRUCTURE;
