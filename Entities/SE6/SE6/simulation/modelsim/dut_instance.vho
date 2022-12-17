-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "11/22/2022 18:13:39"

-- 
-- Device: Altera 10M25SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_16,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_18,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_19,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_129,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_136,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_138,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sign_extend_6 IS
    PORT (
	SE_in : IN std_logic_vector(5 DOWNTO 0);
	SE_out : OUT std_logic_vector(15 DOWNTO 0)
	);
END sign_extend_6;

-- Design Ports Information
-- SE_out[0]	=>  Location: PIN_131,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[1]	=>  Location: PIN_47,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[2]	=>  Location: PIN_41,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[3]	=>  Location: PIN_57,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[4]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[5]	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[6]	=>  Location: PIN_118,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[7]	=>  Location: PIN_134,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[8]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[9]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[10]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[11]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[12]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[13]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[14]	=>  Location: PIN_62,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_out[15]	=>  Location: PIN_97,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_in[0]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_in[1]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_in[2]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_in[3]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_in[4]	=>  Location: PIN_130,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SE_in[5]	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sign_extend_6 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SE_in : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_SE_out : std_logic_vector(15 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \SE_out[0]~output_o\ : std_logic;
SIGNAL \SE_out[1]~output_o\ : std_logic;
SIGNAL \SE_out[2]~output_o\ : std_logic;
SIGNAL \SE_out[3]~output_o\ : std_logic;
SIGNAL \SE_out[4]~output_o\ : std_logic;
SIGNAL \SE_out[5]~output_o\ : std_logic;
SIGNAL \SE_out[6]~output_o\ : std_logic;
SIGNAL \SE_out[7]~output_o\ : std_logic;
SIGNAL \SE_out[8]~output_o\ : std_logic;
SIGNAL \SE_out[9]~output_o\ : std_logic;
SIGNAL \SE_out[10]~output_o\ : std_logic;
SIGNAL \SE_out[11]~output_o\ : std_logic;
SIGNAL \SE_out[12]~output_o\ : std_logic;
SIGNAL \SE_out[13]~output_o\ : std_logic;
SIGNAL \SE_out[14]~output_o\ : std_logic;
SIGNAL \SE_out[15]~output_o\ : std_logic;
SIGNAL \SE_in[0]~input_o\ : std_logic;
SIGNAL \SE_in[1]~input_o\ : std_logic;
SIGNAL \SE_in[2]~input_o\ : std_logic;
SIGNAL \SE_in[3]~input_o\ : std_logic;
SIGNAL \SE_in[4]~input_o\ : std_logic;
SIGNAL \SE_in[5]~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SE_in <= SE_in;
SE_out <= ww_SE_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y29_N24
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X12_Y21_N9
\SE_out[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SE_in[0]~input_o\,
	devoe => ww_devoe,
	o => \SE_out[0]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\SE_out[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SE_in[1]~input_o\,
	devoe => ww_devoe,
	o => \SE_out[1]~output_o\);

-- Location: IOOBUF_X6_Y0_N9
\SE_out[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SE_in[2]~input_o\,
	devoe => ww_devoe,
	o => \SE_out[2]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\SE_out[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SE_in[3]~input_o\,
	devoe => ww_devoe,
	o => \SE_out[3]~output_o\);

-- Location: IOOBUF_X12_Y21_N30
\SE_out[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SE_in[4]~input_o\,
	devoe => ww_devoe,
	o => \SE_out[4]~output_o\);

-- Location: IOOBUF_X60_Y13_N16
\SE_out[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SE_in[5]~input_o\,
	devoe => ww_devoe,
	o => \SE_out[5]~output_o\);

-- Location: IOOBUF_X28_Y36_N2
\SE_out[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[6]~output_o\);

-- Location: IOOBUF_X10_Y21_N2
\SE_out[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[7]~output_o\);

-- Location: IOOBUF_X8_Y21_N23
\SE_out[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[8]~output_o\);

-- Location: IOOBUF_X19_Y21_N23
\SE_out[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[9]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\SE_out[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[10]~output_o\);

-- Location: IOOBUF_X40_Y0_N30
\SE_out[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[11]~output_o\);

-- Location: IOOBUF_X60_Y10_N2
\SE_out[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[12]~output_o\);

-- Location: IOOBUF_X6_Y0_N2
\SE_out[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[13]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\SE_out[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[14]~output_o\);

-- Location: IOOBUF_X60_Y22_N9
\SE_out[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \SE_out[15]~output_o\);

-- Location: IOIBUF_X14_Y21_N22
\SE_in[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE_in(0),
	o => \SE_in[0]~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\SE_in[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE_in(1),
	o => \SE_in[1]~input_o\);

-- Location: IOIBUF_X8_Y0_N15
\SE_in[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE_in(2),
	o => \SE_in[2]~input_o\);

-- Location: IOIBUF_X21_Y0_N29
\SE_in[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE_in(3),
	o => \SE_in[3]~input_o\);

-- Location: IOIBUF_X12_Y21_N1
\SE_in[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE_in(4),
	o => \SE_in[4]~input_o\);

-- Location: IOIBUF_X60_Y13_N22
\SE_in[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SE_in(5),
	o => \SE_in[5]~input_o\);

-- Location: UNVM_X0_Y22_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X25_Y34_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X25_Y33_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_SE_out(0) <= \SE_out[0]~output_o\;

ww_SE_out(1) <= \SE_out[1]~output_o\;

ww_SE_out(2) <= \SE_out[2]~output_o\;

ww_SE_out(3) <= \SE_out[3]~output_o\;

ww_SE_out(4) <= \SE_out[4]~output_o\;

ww_SE_out(5) <= \SE_out[5]~output_o\;

ww_SE_out(6) <= \SE_out[6]~output_o\;

ww_SE_out(7) <= \SE_out[7]~output_o\;

ww_SE_out(8) <= \SE_out[8]~output_o\;

ww_SE_out(9) <= \SE_out[9]~output_o\;

ww_SE_out(10) <= \SE_out[10]~output_o\;

ww_SE_out(11) <= \SE_out[11]~output_o\;

ww_SE_out(12) <= \SE_out[12]~output_o\;

ww_SE_out(13) <= \SE_out[13]~output_o\;

ww_SE_out(14) <= \SE_out[14]~output_o\;

ww_SE_out(15) <= \SE_out[15]~output_o\;
END structure;


