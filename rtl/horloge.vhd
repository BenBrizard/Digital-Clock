-------------------------------------------------------------------------------
-- Title      : Horloge numerique
-- Project    : Horloge numerique - projet 3 ELE3311 - hiver 2019
-------------------------------------------------------------------------------
-- File       : horloge.vhd
-- Author     : EMJ
-- Created    : 2019-02-06
-- Last update: 2019-03-11
-------------------------------------------------------------------------------
-- Description: Le module horloge 
--              Instancie les I/O et les sous-modules nécessaires au
--              fonctionnement de l'horloge
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity horloge is
  port (
    -- inputs
    clk_i       : in  std_logic;
    rst_i       : in  std_logic;
    mode_i      : in  std_logic;
    inc_one_i   : in  std_logic;
    inc_ten_i   : in  std_logic;
    speed_i     : in  std_logic_vector (1 downto 0);
    digit_sel_i : in  std_logic_vector (2 downto 0);
    -- outputs
    heartbeat_o : out std_logic_vector (7 downto 0);
    digit_o     : out std_logic_vector (3 downto 0)
    );
end entity horloge;

architecture arch_horloge_top of horloge is

  component sync_io_1 is
    generic (
      GENERIC_IO_LOGIC : std_logic := '1');  -- 1 = POSITIVE 0 = NEGATIVE
    port (
      --source clock-domain
      sig_src_i : in  std_logic;
      --destination clock-domain 
      clk_dst_i : in  std_logic;
      sig_dst_o : out std_logic
      );
  end component sync_io_1;

  component antirebond_1b_dfm
    port (
      clk_i : in  std_logic;
      en_i  : in  std_logic;
      b_i   : in  std_logic;
      b_o   : out std_logic
      );
  end component;

  component diviseur_horloge is
    generic (MULTIPLIER : positive := 1);
    port (
      rst_i   : in  std_logic;
      clk_i   : in  std_logic;
      speed_i : in  std_logic_vector(1 downto 0);
      clk_o   : out std_logic
      );
  end component diviseur_horloge;

  component msa_horloge
    port (
      -- inputs
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      mode_i   : in  std_logic;
      -- outputs
      prog_h_o : out std_logic;
      prog_m_o : out std_logic
      );
  end component;

  component compteur_bcd_2              -- compteur BCD sur 2 digits
    generic (
      TERMINAL_COUNT : positive := 59  -- valeur max, après laquelle il recommence à 00
      );
    port (
      -- inputs
      clk_i       : in  std_logic;
      rst_i       : in  std_logic;
      inc_time_i  : in  std_logic;
      digit_pos_i : in  std_logic;
      ce_i        : in  std_logic;
      -- outputs
      tc_o        : out std_logic;
      value_o     : out std_logic_vector (7 downto 0)
      );
  end component;

  component compteur_25dutycycle is
    port (
      clk_i       : in  std_logic;
      rst_i       : in  std_logic;
      trotteuse_o : out std_logic
      );
  end component;

  -- msa horloge
  signal prog_h           : std_logic;
  signal prog_m           : std_logic;
  -- incrementer l'heure
  signal inc_val          : std_logic;
  -- diviseur horloge
  signal speed_clk_m      : std_logic_vector (1 downto 0);
  signal dh_en_sec        : std_logic;
  signal dh_en_mar        : std_logic;
  -- Compteurs BCD
  signal inc_time_heures  : std_logic;
  signal inc_time_minutes : std_logic;
  signal rst_cnt_secondes : std_logic;
  signal ce_heures        : std_logic;
  signal ce_minutes       : std_logic;
  signal ce_secondes      : std_logic;
  signal tc_o_heures      : std_logic;
  signal tc_o_minutes     : std_logic;
  signal tc_o_secondes    : std_logic;
  signal cb_heures        : std_logic_vector (7 downto 0);
  signal cb_minutes       : std_logic_vector (7 downto 0);
  signal cb_secondes      : std_logic_vector (7 downto 0);
  constant PIC_TWO_POINT  : std_logic_vector(3 downto 0) := "1010";
  constant PIC_VERT_LINE  : std_logic_vector(3 downto 0) := "1011";
  -- anti-rebonds
  signal mode_ar          : std_logic;
  signal inc_one_ar       : std_logic;
  signal inc_ten_ar       : std_logic;
  -- synchronisation
  signal mode_clk         : std_logic;
  signal inc_one_clk      : std_logic;
  signal inc_ten_clk      : std_logic;
  signal speed_clk        : std_logic_vector (1 downto 0);

begin

  -- clk_enable pour debounce 
  speed_clk_m <= "11" when speed_clk = "11" else "10";

  INST_diviseur_horloge_deb : diviseur_horloge
    generic map (
      MULTIPLIER => 1
      )
    port map(
      rst_i   => rst_i,
      clk_i   => clk_i,
      speed_i => speed_clk_m,
      clk_o   => dh_en_mar
      );

  -- clk_enable pour compteur BCD
  INST_diviseur_horloge_sec : diviseur_horloge
    generic map (
      MULTIPLIER => 1
      )
    port map(
      rst_i   => rst_i,
      clk_i   => clk_i,
      speed_i => speed_clk,
      clk_o   => dh_en_sec
      );

  -- msa_horloge
  INST_msa_horloge : msa_horloge
    port map(
      -- inputs
      clk_i    => clk_i,
      rst_i    => rst_i,
      mode_i   => mode_ar,
      -- outputs
      prog_h_o => prog_h,
      prog_m_o => prog_m
      );

  inc_val <= inc_one_ar or inc_ten_ar;

  -- Compteurs BCD pour horloges
  -- Heures
  inc_time_heures <= prog_h and inc_val;
  ce_heures       <= tc_o_minutes and (not(prog_h or prog_m));
  INST_heures : compteur_bcd_2
    generic map (
      TERMINAL_COUNT => 23
      )
    port map (
      -- inputs
      clk_i       => clk_i,
      rst_i       => rst_i,
      inc_time_i  => inc_time_heures,
      digit_pos_i => inc_ten_ar,
      ce_i        => ce_heures,
      -- outputs
      tc_o        => tc_o_heures,
      value_o     => cb_heures
      );

  --Minutes
  inc_time_minutes <= prog_m and inc_val;
  ce_minutes       <= tc_o_secondes and (not(prog_h or prog_m));
  INST_minutes : compteur_bcd_2
    generic map (
      TERMINAL_COUNT => 59
      )
    port map (
      -- inputs
      clk_i       => clk_i,
      rst_i       => rst_i,
      inc_time_i  => inc_time_minutes,
      digit_pos_i => inc_ten_ar,
      ce_i        => ce_minutes,
      -- outputs
      tc_o        => tc_o_minutes,
      value_o     => cb_minutes
      );

  -- Secondes
  rst_cnt_secondes <= prog_h or prog_m or rst_i;
  ce_secondes      <= dh_en_sec and (not(prog_h or prog_m));
  INST_secondes : compteur_bcd_2
    generic map (
      TERMINAL_COUNT => 59
      )
    port map (
      -- inputs
      clk_i       => clk_i,
      rst_i       => rst_cnt_secondes,
      inc_time_i  => '0',
      digit_pos_i => '0',
      ce_i        => ce_secondes,
      -- outputs
      tc_o        => tc_o_secondes,
      value_o     => cb_secondes
      );

  -- inc_one_i
  inst_sync_io_up : sync_io_1
    generic map (
      GENERIC_IO_LOGIC => '1'           -- 1=POSITIVE 0=NEGATIVE
      )
    port map (
      --source clock-domain
      sig_src_i => inc_one_i,
      --destination clock-domain 
      clk_dst_i => clk_i,
      sig_dst_o => inc_one_clk
      );

  inst_ar_up : antirebond_1b_dfm
    port map (
      clk_i => clk_i,
      en_i  => dh_en_mar,
      b_i   => inc_one_clk,
      b_o   => inc_one_ar
      );

-- mode_i
  inst_sync_io_center : sync_io_1
    generic map (
      GENERIC_IO_LOGIC => '1'           -- 1=POSITIVE 0=NEGATIVE
      )
    port map (
      --source clock-domain
      sig_src_i => mode_i,
      --destination clock-domain 
      clk_dst_i => clk_i,
      sig_dst_o => mode_clk
      );

  inst_ar_center : antirebond_1b_dfm
    port map (
      clk_i => clk_i,
      en_i  => dh_en_mar,
      b_i   => mode_clk,
      b_o   => mode_ar
      );

-- inc_ten_i
  inst_clk_io_left : sync_io_1
    generic map (
      GENERIC_IO_LOGIC => '1'           -- 1=POSITIVE 0=NEGATIVE
      )
    port map (
      --source clock-domain
      sig_src_i => inc_ten_i,
      --destination clock-domain 
      clk_dst_i => clk_i,
      sig_dst_o => inc_ten_clk
      );

  inst_ar_left : antirebond_1b_dfm
    port map (
      clk_i => clk_i,
      en_i  => dh_en_mar,
      b_i   => inc_ten_clk,
      b_o   => inc_ten_ar
      );

-- speed_i(0)
  inst_sync_io_speed_0 : sync_io_1
    generic map (
      GENERIC_IO_LOGIC => '1'           -- 1=POSITIVE 0=NEGATIVE
      )
    port map (
      --source clock-domain
      sig_src_i => speed_i(0),
      --destination clock-domain 
      clk_dst_i => clk_i,
      sig_dst_o => speed_clk(0)
      );

-- speed_i(1)
  inst_sync_io_speed_1 : sync_io_1
    generic map (
      GENERIC_IO_LOGIC => '1'           -- 1=POSITIVE 0=NEGATIVE
      )
    port map (
      --source clock-domain
      sig_src_i => speed_i(1),
      --destination clock-domain 
      clk_dst_i => clk_i,
      sig_dst_o => speed_clk(1)
      );

-- trotteuse
  heartbeat_o(6 downto 0) <= (others => '0');
  trotteuse : compteur_25dutycycle
    port map(
      clk_i       => clk_i,
      rst_i       => rst_i,
      trotteuse_o => heartbeat_o(7)
      );
  
-- output mux
  -- transmet le chiffre ou la valeur d'offset à fournir à la mémoire CHAR_MEM pour
  -- afficher le caractère correspondant à la position en entrée, soit les
  -- dizaines ou unitées des heures, minutes et secondes, en plus des ":" et "|".
  mux_output_select : process(digit_sel_i, cb_heures, cb_minutes, cb_secondes)
  begin
    case digit_sel_i is
      when "000" =>
        digit_o <= cb_heures(7 downto 4);
      when "001" =>
        digit_o <= cb_heures(3 downto 0);
      when "010" =>
        digit_o <= PIC_TWO_POINT;
      when "011" =>
        digit_o <= cb_minutes(7 downto 4);
      when "100" =>
        digit_o <= cb_minutes(3 downto 0);
      when "101" =>
        digit_o <= PIC_VERT_LINE;
      when "110" =>
        digit_o <= cb_secondes(7 downto 4);
      when others =>                    --"111"              
        digit_o <= cb_secondes(3 downto 0);
    end case;
  end process;

end architecture;


