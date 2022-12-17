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

-- DATE "11/22/2022 18:57:57"

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

ENTITY 	DUT IS
    PORT (
	input_vector : IN std_logic_vector(33 DOWNTO 0);
	output_vector : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END DUT;

-- Design Ports Information
-- output_vector[0]	=>  Location: PIN_97,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[1]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[2]	=>  Location: PIN_78,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[3]	=>  Location: PIN_81,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[4]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[5]	=>  Location: PIN_79,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[6]	=>  Location: PIN_131,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[7]	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[8]	=>  Location: PIN_122,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[9]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[10]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[11]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[12]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[13]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[14]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[15]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[2]	=>  Location: PIN_92,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[18]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[1]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[0]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[3]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[19]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[4]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[20]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[5]	=>  Location: PIN_96,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[21]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[6]	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[22]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[7]	=>  Location: PIN_93,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[23]	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[8]	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[24]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[9]	=>  Location: PIN_14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[25]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[10]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[26]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[11]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[27]	=>  Location: PIN_123,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[12]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[28]	=>  Location: PIN_62,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[13]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[29]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[14]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[30]	=>  Location: PIN_57,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[15]	=>  Location: PIN_56,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[31]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[16]	=>  Location: PIN_61,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[32]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[17]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[33]	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DUT IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_vector : std_logic_vector(33 DOWNTO 0);
SIGNAL ww_output_vector : std_logic_vector(15 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \output_vector[0]~output_o\ : std_logic;
SIGNAL \output_vector[1]~output_o\ : std_logic;
SIGNAL \output_vector[2]~output_o\ : std_logic;
SIGNAL \output_vector[3]~output_o\ : std_logic;
SIGNAL \output_vector[4]~output_o\ : std_logic;
SIGNAL \output_vector[5]~output_o\ : std_logic;
SIGNAL \output_vector[6]~output_o\ : std_logic;
SIGNAL \output_vector[7]~output_o\ : std_logic;
SIGNAL \output_vector[8]~output_o\ : std_logic;
SIGNAL \output_vector[9]~output_o\ : std_logic;
SIGNAL \output_vector[10]~output_o\ : std_logic;
SIGNAL \output_vector[11]~output_o\ : std_logic;
SIGNAL \output_vector[12]~output_o\ : std_logic;
SIGNAL \output_vector[13]~output_o\ : std_logic;
SIGNAL \output_vector[14]~output_o\ : std_logic;
SIGNAL \output_vector[15]~output_o\ : std_logic;
SIGNAL \input_vector[0]~input_o\ : std_logic;
SIGNAL \input_vector[1]~input_o\ : std_logic;
SIGNAL \input_vector[18]~input_o\ : std_logic;
SIGNAL \input_vector[2]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[0]~0_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[1]~1_combout\ : std_logic;
SIGNAL \input_vector[19]~input_o\ : std_logic;
SIGNAL \input_vector[3]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[1]~2_combout\ : std_logic;
SIGNAL \input_vector[4]~input_o\ : std_logic;
SIGNAL \input_vector[20]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[2]~3_combout\ : std_logic;
SIGNAL \add_instance|carry~0_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[2]~4_combout\ : std_logic;
SIGNAL \input_vector[21]~input_o\ : std_logic;
SIGNAL \add_instance|carry~1_combout\ : std_logic;
SIGNAL \add_instance|ALU_C~5_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[3]~6_combout\ : std_logic;
SIGNAL \input_vector[5]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[3]~7_combout\ : std_logic;
SIGNAL \input_vector[22]~input_o\ : std_logic;
SIGNAL \input_vector[6]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[4]~8_combout\ : std_logic;
SIGNAL \add_instance|carry~2_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[4]~9_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[5]~10_combout\ : std_logic;
SIGNAL \input_vector[23]~input_o\ : std_logic;
SIGNAL \input_vector[7]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[5]~11_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[5]~12_combout\ : std_logic;
SIGNAL \add_instance|carry~3_combout\ : std_logic;
SIGNAL \input_vector[24]~input_o\ : std_logic;
SIGNAL \input_vector[8]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[6]~13_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[6]~14_combout\ : std_logic;
SIGNAL \input_vector[25]~input_o\ : std_logic;
SIGNAL \input_vector[9]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C~15_combout\ : std_logic;
SIGNAL \add_instance|carry~4_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[7]~16_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[7]~17_combout\ : std_logic;
SIGNAL \input_vector[10]~input_o\ : std_logic;
SIGNAL \input_vector[26]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[8]~18_combout\ : std_logic;
SIGNAL \add_instance|carry~5_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[8]~19_combout\ : std_logic;
SIGNAL \add_instance|ALU_C~20_combout\ : std_logic;
SIGNAL \add_instance|carry~6_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[9]~21_combout\ : std_logic;
SIGNAL \input_vector[11]~input_o\ : std_logic;
SIGNAL \input_vector[27]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[9]~22_combout\ : std_logic;
SIGNAL \input_vector[28]~input_o\ : std_logic;
SIGNAL \input_vector[12]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[10]~23_combout\ : std_logic;
SIGNAL \add_instance|carry~7_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[10]~24_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[11]~25_combout\ : std_logic;
SIGNAL \input_vector[29]~input_o\ : std_logic;
SIGNAL \input_vector[13]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[11]~26_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[11]~27_combout\ : std_logic;
SIGNAL \add_instance|carry~8_combout\ : std_logic;
SIGNAL \input_vector[14]~input_o\ : std_logic;
SIGNAL \input_vector[30]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[12]~28_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[12]~29_combout\ : std_logic;
SIGNAL \input_vector[15]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C~30_combout\ : std_logic;
SIGNAL \add_instance|carry~9_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[13]~31_combout\ : std_logic;
SIGNAL \input_vector[31]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[13]~32_combout\ : std_logic;
SIGNAL \input_vector[16]~input_o\ : std_logic;
SIGNAL \input_vector[32]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[14]~33_combout\ : std_logic;
SIGNAL \add_instance|carry~10_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[14]~34_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[15]~35_combout\ : std_logic;
SIGNAL \input_vector[17]~input_o\ : std_logic;
SIGNAL \input_vector[33]~input_o\ : std_logic;
SIGNAL \add_instance|ALU_C[15]~36_combout\ : std_logic;
SIGNAL \add_instance|ALU_C[15]~37_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
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

-- Location: LCCOMB_X26_Y24_N24
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

-- Location: IOOBUF_X60_Y22_N9
\output_vector[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[0]~0_combout\,
	devoe => ww_devoe,
	o => \output_vector[0]~output_o\);

-- Location: IOOBUF_X60_Y22_N16
\output_vector[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[1]~2_combout\,
	devoe => ww_devoe,
	o => \output_vector[1]~output_o\);

-- Location: IOOBUF_X60_Y8_N9
\output_vector[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[2]~4_combout\,
	devoe => ww_devoe,
	o => \output_vector[2]~output_o\);

-- Location: IOOBUF_X60_Y8_N16
\output_vector[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[3]~7_combout\,
	devoe => ww_devoe,
	o => \output_vector[3]~output_o\);

-- Location: IOOBUF_X60_Y8_N2
\output_vector[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[4]~9_combout\,
	devoe => ww_devoe,
	o => \output_vector[4]~output_o\);

-- Location: IOOBUF_X60_Y8_N23
\output_vector[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[5]~12_combout\,
	devoe => ww_devoe,
	o => \output_vector[5]~output_o\);

-- Location: IOOBUF_X12_Y21_N9
\output_vector[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[6]~14_combout\,
	devoe => ww_devoe,
	o => \output_vector[6]~output_o\);

-- Location: IOOBUF_X25_Y28_N16
\output_vector[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[7]~17_combout\,
	devoe => ww_devoe,
	o => \output_vector[7]~output_o\);

-- Location: IOOBUF_X16_Y21_N16
\output_vector[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[8]~19_combout\,
	devoe => ww_devoe,
	o => \output_vector[8]~output_o\);

-- Location: IOOBUF_X25_Y28_N23
\output_vector[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[9]~22_combout\,
	devoe => ww_devoe,
	o => \output_vector[9]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\output_vector[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[10]~24_combout\,
	devoe => ww_devoe,
	o => \output_vector[10]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\output_vector[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[11]~27_combout\,
	devoe => ww_devoe,
	o => \output_vector[11]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\output_vector[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[12]~29_combout\,
	devoe => ww_devoe,
	o => \output_vector[12]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\output_vector[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[13]~32_combout\,
	devoe => ww_devoe,
	o => \output_vector[13]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\output_vector[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[14]~34_combout\,
	devoe => ww_devoe,
	o => \output_vector[14]~output_o\);

-- Location: IOOBUF_X25_Y27_N16
\output_vector[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \add_instance|ALU_C[15]~37_combout\,
	devoe => ww_devoe,
	o => \output_vector[15]~output_o\);

-- Location: IOIBUF_X60_Y2_N22
\input_vector[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(0),
	o => \input_vector[0]~input_o\);

-- Location: IOIBUF_X60_Y2_N8
\input_vector[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(1),
	o => \input_vector[1]~input_o\);

-- Location: IOIBUF_X12_Y21_N29
\input_vector[18]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(18),
	o => \input_vector[18]~input_o\);

-- Location: IOIBUF_X60_Y15_N22
\input_vector[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(2),
	o => \input_vector[2]~input_o\);

-- Location: LCCOMB_X59_Y14_N8
\add_instance|ALU_C[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[0]~0_combout\ = (\input_vector[1]~input_o\ & (\input_vector[0]~input_o\ $ (((!\input_vector[2]~input_o\) # (!\input_vector[18]~input_o\))))) # (!\input_vector[1]~input_o\ & ((\input_vector[18]~input_o\ $ (\input_vector[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[0]~input_o\,
	datab => \input_vector[1]~input_o\,
	datac => \input_vector[18]~input_o\,
	datad => \input_vector[2]~input_o\,
	combout => \add_instance|ALU_C[0]~0_combout\);

-- Location: LCCOMB_X59_Y14_N10
\add_instance|ALU_C[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[1]~1_combout\ = (\input_vector[0]~input_o\ & (\input_vector[1]~input_o\)) # (!\input_vector[0]~input_o\ & (!\input_vector[1]~input_o\ & (\input_vector[18]~input_o\ & \input_vector[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[0]~input_o\,
	datab => \input_vector[1]~input_o\,
	datac => \input_vector[18]~input_o\,
	datad => \input_vector[2]~input_o\,
	combout => \add_instance|ALU_C[1]~1_combout\);

-- Location: IOIBUF_X60_Y14_N22
\input_vector[19]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(19),
	o => \input_vector[19]~input_o\);

-- Location: IOIBUF_X60_Y10_N15
\input_vector[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(3),
	o => \input_vector[3]~input_o\);

-- Location: LCCOMB_X59_Y14_N4
\add_instance|ALU_C[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[1]~2_combout\ = \add_instance|ALU_C[1]~1_combout\ $ (((\input_vector[19]~input_o\ & ((!\input_vector[3]~input_o\))) # (!\input_vector[19]~input_o\ & ((\input_vector[1]~input_o\) # (\input_vector[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C[1]~1_combout\,
	datab => \input_vector[1]~input_o\,
	datac => \input_vector[19]~input_o\,
	datad => \input_vector[3]~input_o\,
	combout => \add_instance|ALU_C[1]~2_combout\);

-- Location: IOIBUF_X60_Y10_N1
\input_vector[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(4),
	o => \input_vector[4]~input_o\);

-- Location: IOIBUF_X60_Y10_N8
\input_vector[20]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(20),
	o => \input_vector[20]~input_o\);

-- Location: LCCOMB_X59_Y14_N24
\add_instance|ALU_C[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[2]~3_combout\ = (\input_vector[4]~input_o\ & (\input_vector[1]~input_o\ $ (!\input_vector[20]~input_o\))) # (!\input_vector[4]~input_o\ & (!\input_vector[1]~input_o\ & \input_vector[20]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[4]~input_o\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[20]~input_o\,
	combout => \add_instance|ALU_C[2]~3_combout\);

-- Location: LCCOMB_X59_Y14_N30
\add_instance|carry~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~0_combout\ = (\input_vector[19]~input_o\ & ((\input_vector[3]~input_o\) # ((\input_vector[18]~input_o\ & \input_vector[2]~input_o\)))) # (!\input_vector[19]~input_o\ & (\input_vector[3]~input_o\ & (\input_vector[18]~input_o\ & 
-- \input_vector[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[19]~input_o\,
	datab => \input_vector[3]~input_o\,
	datac => \input_vector[18]~input_o\,
	datad => \input_vector[2]~input_o\,
	combout => \add_instance|carry~0_combout\);

-- Location: LCCOMB_X59_Y14_N18
\add_instance|ALU_C[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[2]~4_combout\ = \add_instance|ALU_C[2]~3_combout\ $ (((!\input_vector[0]~input_o\ & ((\input_vector[1]~input_o\) # (\add_instance|carry~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[0]~input_o\,
	datab => \add_instance|ALU_C[2]~3_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \add_instance|carry~0_combout\,
	combout => \add_instance|ALU_C[2]~4_combout\);

-- Location: IOIBUF_X60_Y14_N15
\input_vector[21]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(21),
	o => \input_vector[21]~input_o\);

-- Location: LCCOMB_X59_Y14_N14
\add_instance|carry~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~1_combout\ = (\add_instance|carry~0_combout\ & ((\input_vector[4]~input_o\) # (\input_vector[20]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[4]~input_o\,
	datac => \add_instance|carry~0_combout\,
	datad => \input_vector[20]~input_o\,
	combout => \add_instance|carry~1_combout\);

-- Location: LCCOMB_X59_Y14_N20
\add_instance|ALU_C~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C~5_combout\ = (\input_vector[4]~input_o\ & \input_vector[20]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[4]~input_o\,
	datad => \input_vector[20]~input_o\,
	combout => \add_instance|ALU_C~5_combout\);

-- Location: LCCOMB_X59_Y14_N16
\add_instance|ALU_C[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[3]~6_combout\ = (\input_vector[0]~input_o\ & (((\input_vector[1]~input_o\)))) # (!\input_vector[0]~input_o\ & (!\input_vector[1]~input_o\ & ((\add_instance|carry~1_combout\) # (\add_instance|ALU_C~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[0]~input_o\,
	datab => \add_instance|carry~1_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \add_instance|ALU_C~5_combout\,
	combout => \add_instance|ALU_C[3]~6_combout\);

-- Location: IOIBUF_X60_Y22_N23
\input_vector[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(5),
	o => \input_vector[5]~input_o\);

-- Location: LCCOMB_X59_Y14_N26
\add_instance|ALU_C[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[3]~7_combout\ = \add_instance|ALU_C[3]~6_combout\ $ (((\input_vector[21]~input_o\ & ((!\input_vector[5]~input_o\))) # (!\input_vector[21]~input_o\ & ((\input_vector[1]~input_o\) # (\input_vector[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[21]~input_o\,
	datab => \add_instance|ALU_C[3]~6_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[5]~input_o\,
	combout => \add_instance|ALU_C[3]~7_combout\);

-- Location: IOIBUF_X60_Y10_N23
\input_vector[22]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(22),
	o => \input_vector[22]~input_o\);

-- Location: IOIBUF_X60_Y13_N15
\input_vector[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(6),
	o => \input_vector[6]~input_o\);

-- Location: LCCOMB_X59_Y14_N22
\add_instance|ALU_C[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[4]~8_combout\ = (\input_vector[22]~input_o\ & (\input_vector[6]~input_o\ $ (!\input_vector[1]~input_o\))) # (!\input_vector[22]~input_o\ & (\input_vector[6]~input_o\ & !\input_vector[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_vector[22]~input_o\,
	datac => \input_vector[6]~input_o\,
	datad => \input_vector[1]~input_o\,
	combout => \add_instance|ALU_C[4]~8_combout\);

-- Location: LCCOMB_X59_Y14_N12
\add_instance|carry~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~2_combout\ = (\input_vector[21]~input_o\ & ((\add_instance|ALU_C~5_combout\) # ((\add_instance|carry~1_combout\) # (\input_vector[5]~input_o\)))) # (!\input_vector[21]~input_o\ & (\input_vector[5]~input_o\ & 
-- ((\add_instance|ALU_C~5_combout\) # (\add_instance|carry~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[21]~input_o\,
	datab => \add_instance|ALU_C~5_combout\,
	datac => \add_instance|carry~1_combout\,
	datad => \input_vector[5]~input_o\,
	combout => \add_instance|carry~2_combout\);

-- Location: LCCOMB_X59_Y14_N0
\add_instance|ALU_C[4]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[4]~9_combout\ = \add_instance|ALU_C[4]~8_combout\ $ (((!\input_vector[0]~input_o\ & ((\input_vector[1]~input_o\) # (\add_instance|carry~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C[4]~8_combout\,
	datab => \input_vector[1]~input_o\,
	datac => \input_vector[0]~input_o\,
	datad => \add_instance|carry~2_combout\,
	combout => \add_instance|ALU_C[4]~9_combout\);

-- Location: LCCOMB_X59_Y14_N2
\add_instance|ALU_C[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[5]~10_combout\ = (\add_instance|carry~2_combout\ & ((\input_vector[6]~input_o\) # (\input_vector[22]~input_o\))) # (!\add_instance|carry~2_combout\ & (\input_vector[6]~input_o\ & \input_vector[22]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~2_combout\,
	datab => \input_vector[6]~input_o\,
	datac => \input_vector[22]~input_o\,
	combout => \add_instance|ALU_C[5]~10_combout\);

-- Location: IOIBUF_X60_Y13_N22
\input_vector[23]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(23),
	o => \input_vector[23]~input_o\);

-- Location: IOIBUF_X60_Y15_N15
\input_vector[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(7),
	o => \input_vector[7]~input_o\);

-- Location: LCCOMB_X59_Y14_N28
\add_instance|ALU_C[5]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[5]~11_combout\ = (\input_vector[23]~input_o\ & (\input_vector[1]~input_o\ $ (!\input_vector[7]~input_o\))) # (!\input_vector[23]~input_o\ & (!\input_vector[1]~input_o\ & \input_vector[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[23]~input_o\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[7]~input_o\,
	combout => \add_instance|ALU_C[5]~11_combout\);

-- Location: LCCOMB_X59_Y14_N6
\add_instance|ALU_C[5]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[5]~12_combout\ = \add_instance|ALU_C[5]~11_combout\ $ (((!\input_vector[0]~input_o\ & ((\add_instance|ALU_C[5]~10_combout\) # (\input_vector[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[0]~input_o\,
	datab => \add_instance|ALU_C[5]~10_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \add_instance|ALU_C[5]~11_combout\,
	combout => \add_instance|ALU_C[5]~12_combout\);

-- Location: LCCOMB_X59_Y15_N0
\add_instance|carry~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~3_combout\ = (\input_vector[7]~input_o\ & ((\add_instance|ALU_C[5]~10_combout\) # (\input_vector[23]~input_o\))) # (!\input_vector[7]~input_o\ & (\add_instance|ALU_C[5]~10_combout\ & \input_vector[23]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[7]~input_o\,
	datab => \add_instance|ALU_C[5]~10_combout\,
	datac => \input_vector[23]~input_o\,
	combout => \add_instance|carry~3_combout\);

-- Location: IOIBUF_X19_Y21_N29
\input_vector[24]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(24),
	o => \input_vector[24]~input_o\);

-- Location: IOIBUF_X25_Y26_N15
\input_vector[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(8),
	o => \input_vector[8]~input_o\);

-- Location: LCCOMB_X25_Y20_N24
\add_instance|ALU_C[6]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[6]~13_combout\ = (\input_vector[24]~input_o\ & (\input_vector[1]~input_o\ $ (!\input_vector[8]~input_o\))) # (!\input_vector[24]~input_o\ & (!\input_vector[1]~input_o\ & \input_vector[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_vector[24]~input_o\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[8]~input_o\,
	combout => \add_instance|ALU_C[6]~13_combout\);

-- Location: LCCOMB_X25_Y20_N10
\add_instance|ALU_C[6]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[6]~14_combout\ = \add_instance|ALU_C[6]~13_combout\ $ (((!\input_vector[0]~input_o\ & ((\add_instance|carry~3_combout\) # (\input_vector[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~3_combout\,
	datab => \add_instance|ALU_C[6]~13_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[6]~14_combout\);

-- Location: IOIBUF_X53_Y0_N1
\input_vector[25]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(25),
	o => \input_vector[25]~input_o\);

-- Location: IOIBUF_X25_Y26_N22
\input_vector[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(9),
	o => \input_vector[9]~input_o\);

-- Location: LCCOMB_X25_Y20_N12
\add_instance|ALU_C~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C~15_combout\ = (\input_vector[24]~input_o\ & \input_vector[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \input_vector[24]~input_o\,
	datad => \input_vector[8]~input_o\,
	combout => \add_instance|ALU_C~15_combout\);

-- Location: LCCOMB_X25_Y20_N14
\add_instance|carry~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~4_combout\ = (\add_instance|carry~3_combout\ & ((\input_vector[24]~input_o\) # (\input_vector[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_vector[24]~input_o\,
	datac => \add_instance|carry~3_combout\,
	datad => \input_vector[8]~input_o\,
	combout => \add_instance|carry~4_combout\);

-- Location: LCCOMB_X25_Y20_N16
\add_instance|ALU_C[7]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[7]~16_combout\ = (\input_vector[1]~input_o\ & (((\input_vector[0]~input_o\)))) # (!\input_vector[1]~input_o\ & (!\input_vector[0]~input_o\ & ((\add_instance|ALU_C~15_combout\) # (\add_instance|carry~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C~15_combout\,
	datab => \input_vector[1]~input_o\,
	datac => \add_instance|carry~4_combout\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[7]~16_combout\);

-- Location: LCCOMB_X25_Y20_N2
\add_instance|ALU_C[7]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[7]~17_combout\ = \add_instance|ALU_C[7]~16_combout\ $ (((\input_vector[25]~input_o\ & (!\input_vector[9]~input_o\)) # (!\input_vector[25]~input_o\ & ((\input_vector[9]~input_o\) # (\input_vector[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100101110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[25]~input_o\,
	datab => \input_vector[9]~input_o\,
	datac => \input_vector[1]~input_o\,
	datad => \add_instance|ALU_C[7]~16_combout\,
	combout => \add_instance|ALU_C[7]~17_combout\);

-- Location: IOIBUF_X14_Y21_N29
\input_vector[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(10),
	o => \input_vector[10]~input_o\);

-- Location: IOIBUF_X25_Y29_N22
\input_vector[26]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(26),
	o => \input_vector[26]~input_o\);

-- Location: LCCOMB_X25_Y20_N6
\add_instance|ALU_C[8]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[8]~18_combout\ = (\input_vector[10]~input_o\ & (\input_vector[26]~input_o\ $ (!\input_vector[1]~input_o\))) # (!\input_vector[10]~input_o\ & (\input_vector[26]~input_o\ & !\input_vector[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[10]~input_o\,
	datab => \input_vector[26]~input_o\,
	datac => \input_vector[1]~input_o\,
	combout => \add_instance|ALU_C[8]~18_combout\);

-- Location: LCCOMB_X25_Y20_N4
\add_instance|carry~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~5_combout\ = (\input_vector[9]~input_o\ & ((\add_instance|ALU_C~15_combout\) # ((\add_instance|carry~4_combout\) # (\input_vector[25]~input_o\)))) # (!\input_vector[9]~input_o\ & (\input_vector[25]~input_o\ & 
-- ((\add_instance|ALU_C~15_combout\) # (\add_instance|carry~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C~15_combout\,
	datab => \input_vector[9]~input_o\,
	datac => \add_instance|carry~4_combout\,
	datad => \input_vector[25]~input_o\,
	combout => \add_instance|carry~5_combout\);

-- Location: LCCOMB_X25_Y20_N0
\add_instance|ALU_C[8]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[8]~19_combout\ = \add_instance|ALU_C[8]~18_combout\ $ (((!\input_vector[0]~input_o\ & ((\input_vector[1]~input_o\) # (\add_instance|carry~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C[8]~18_combout\,
	datab => \input_vector[1]~input_o\,
	datac => \add_instance|carry~5_combout\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[8]~19_combout\);

-- Location: LCCOMB_X25_Y20_N26
\add_instance|ALU_C~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C~20_combout\ = (\input_vector[10]~input_o\ & \input_vector[26]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \input_vector[10]~input_o\,
	datad => \input_vector[26]~input_o\,
	combout => \add_instance|ALU_C~20_combout\);

-- Location: LCCOMB_X25_Y20_N20
\add_instance|carry~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~6_combout\ = (\add_instance|carry~5_combout\ & ((\input_vector[10]~input_o\) # (\input_vector[26]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \add_instance|carry~5_combout\,
	datac => \input_vector[10]~input_o\,
	datad => \input_vector[26]~input_o\,
	combout => \add_instance|carry~6_combout\);

-- Location: LCCOMB_X25_Y20_N30
\add_instance|ALU_C[9]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[9]~21_combout\ = (\input_vector[1]~input_o\ & (((\input_vector[0]~input_o\)))) # (!\input_vector[1]~input_o\ & (!\input_vector[0]~input_o\ & ((\add_instance|ALU_C~20_combout\) # (\add_instance|carry~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C~20_combout\,
	datab => \add_instance|carry~6_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[9]~21_combout\);

-- Location: IOIBUF_X19_Y21_N22
\input_vector[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(11),
	o => \input_vector[11]~input_o\);

-- Location: IOIBUF_X14_Y21_N1
\input_vector[27]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(27),
	o => \input_vector[27]~input_o\);

-- Location: LCCOMB_X25_Y20_N8
\add_instance|ALU_C[9]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[9]~22_combout\ = \add_instance|ALU_C[9]~21_combout\ $ (((\input_vector[11]~input_o\ & ((!\input_vector[27]~input_o\))) # (!\input_vector[11]~input_o\ & ((\input_vector[1]~input_o\) # (\input_vector[27]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C[9]~21_combout\,
	datab => \input_vector[11]~input_o\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[27]~input_o\,
	combout => \add_instance|ALU_C[9]~22_combout\);

-- Location: IOIBUF_X36_Y0_N8
\input_vector[28]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(28),
	o => \input_vector[28]~input_o\);

-- Location: IOIBUF_X24_Y0_N29
\input_vector[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(12),
	o => \input_vector[12]~input_o\);

-- Location: LCCOMB_X25_Y1_N8
\add_instance|ALU_C[10]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[10]~23_combout\ = (\input_vector[28]~input_o\ & (\input_vector[12]~input_o\ $ (!\input_vector[1]~input_o\))) # (!\input_vector[28]~input_o\ & (\input_vector[12]~input_o\ & !\input_vector[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[28]~input_o\,
	datab => \input_vector[12]~input_o\,
	datac => \input_vector[1]~input_o\,
	combout => \add_instance|ALU_C[10]~23_combout\);

-- Location: LCCOMB_X25_Y20_N18
\add_instance|carry~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~7_combout\ = (\input_vector[11]~input_o\ & ((\add_instance|ALU_C~20_combout\) # ((\input_vector[27]~input_o\) # (\add_instance|carry~6_combout\)))) # (!\input_vector[11]~input_o\ & (\input_vector[27]~input_o\ & 
-- ((\add_instance|ALU_C~20_combout\) # (\add_instance|carry~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C~20_combout\,
	datab => \input_vector[11]~input_o\,
	datac => \input_vector[27]~input_o\,
	datad => \add_instance|carry~6_combout\,
	combout => \add_instance|carry~7_combout\);

-- Location: LCCOMB_X25_Y1_N2
\add_instance|ALU_C[10]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[10]~24_combout\ = \add_instance|ALU_C[10]~23_combout\ $ (((!\input_vector[0]~input_o\ & ((\input_vector[1]~input_o\) # (\add_instance|carry~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[1]~input_o\,
	datab => \add_instance|ALU_C[10]~23_combout\,
	datac => \add_instance|carry~7_combout\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[10]~24_combout\);

-- Location: LCCOMB_X25_Y1_N20
\add_instance|ALU_C[11]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[11]~25_combout\ = (\input_vector[12]~input_o\ & ((\add_instance|carry~7_combout\) # (\input_vector[28]~input_o\))) # (!\input_vector[12]~input_o\ & (\add_instance|carry~7_combout\ & \input_vector[28]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_vector[12]~input_o\,
	datac => \add_instance|carry~7_combout\,
	datad => \input_vector[28]~input_o\,
	combout => \add_instance|ALU_C[11]~25_combout\);

-- Location: IOIBUF_X40_Y0_N1
\input_vector[29]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(29),
	o => \input_vector[29]~input_o\);

-- Location: IOIBUF_X53_Y0_N8
\input_vector[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(13),
	o => \input_vector[13]~input_o\);

-- Location: LCCOMB_X25_Y1_N30
\add_instance|ALU_C[11]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[11]~26_combout\ = (\input_vector[29]~input_o\ & (\input_vector[13]~input_o\ $ (!\input_vector[1]~input_o\))) # (!\input_vector[29]~input_o\ & (\input_vector[13]~input_o\ & !\input_vector[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[29]~input_o\,
	datab => \input_vector[13]~input_o\,
	datac => \input_vector[1]~input_o\,
	combout => \add_instance|ALU_C[11]~26_combout\);

-- Location: LCCOMB_X25_Y1_N24
\add_instance|ALU_C[11]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[11]~27_combout\ = \add_instance|ALU_C[11]~26_combout\ $ (((!\input_vector[0]~input_o\ & ((\input_vector[1]~input_o\) # (\add_instance|ALU_C[11]~25_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[1]~input_o\,
	datab => \add_instance|ALU_C[11]~25_combout\,
	datac => \add_instance|ALU_C[11]~26_combout\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[11]~27_combout\);

-- Location: LCCOMB_X25_Y1_N10
\add_instance|carry~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~8_combout\ = (\input_vector[29]~input_o\ & ((\add_instance|ALU_C[11]~25_combout\) # (\input_vector[13]~input_o\))) # (!\input_vector[29]~input_o\ & (\add_instance|ALU_C[11]~25_combout\ & \input_vector[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[29]~input_o\,
	datab => \add_instance|ALU_C[11]~25_combout\,
	datac => \input_vector[13]~input_o\,
	combout => \add_instance|carry~8_combout\);

-- Location: IOIBUF_X40_Y0_N29
\input_vector[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(14),
	o => \input_vector[14]~input_o\);

-- Location: IOIBUF_X21_Y0_N1
\input_vector[30]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(30),
	o => \input_vector[30]~input_o\);

-- Location: LCCOMB_X25_Y1_N28
\add_instance|ALU_C[12]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[12]~28_combout\ = (\input_vector[1]~input_o\ & (\input_vector[14]~input_o\ & \input_vector[30]~input_o\)) # (!\input_vector[1]~input_o\ & (\input_vector[14]~input_o\ $ (\input_vector[30]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[1]~input_o\,
	datab => \input_vector[14]~input_o\,
	datac => \input_vector[30]~input_o\,
	combout => \add_instance|ALU_C[12]~28_combout\);

-- Location: LCCOMB_X25_Y1_N14
\add_instance|ALU_C[12]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[12]~29_combout\ = \add_instance|ALU_C[12]~28_combout\ $ (((!\input_vector[0]~input_o\ & ((\add_instance|carry~8_combout\) # (\input_vector[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~8_combout\,
	datab => \add_instance|ALU_C[12]~28_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[12]~29_combout\);

-- Location: IOIBUF_X21_Y0_N22
\input_vector[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(15),
	o => \input_vector[15]~input_o\);

-- Location: LCCOMB_X25_Y1_N0
\add_instance|ALU_C~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C~30_combout\ = (\input_vector[14]~input_o\ & \input_vector[30]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_vector[14]~input_o\,
	datac => \input_vector[30]~input_o\,
	combout => \add_instance|ALU_C~30_combout\);

-- Location: LCCOMB_X25_Y1_N26
\add_instance|carry~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~9_combout\ = (\add_instance|carry~8_combout\ & ((\input_vector[14]~input_o\) # (\input_vector[30]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|carry~8_combout\,
	datab => \input_vector[14]~input_o\,
	datac => \input_vector[30]~input_o\,
	combout => \add_instance|carry~9_combout\);

-- Location: LCCOMB_X25_Y1_N4
\add_instance|ALU_C[13]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[13]~31_combout\ = (\input_vector[1]~input_o\ & (((\input_vector[0]~input_o\)))) # (!\input_vector[1]~input_o\ & (!\input_vector[0]~input_o\ & ((\add_instance|ALU_C~30_combout\) # (\add_instance|carry~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[1]~input_o\,
	datab => \add_instance|ALU_C~30_combout\,
	datac => \add_instance|carry~9_combout\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[13]~31_combout\);

-- Location: IOIBUF_X21_Y0_N29
\input_vector[31]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(31),
	o => \input_vector[31]~input_o\);

-- Location: LCCOMB_X25_Y1_N22
\add_instance|ALU_C[13]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[13]~32_combout\ = \add_instance|ALU_C[13]~31_combout\ $ (((\input_vector[15]~input_o\ & ((!\input_vector[31]~input_o\))) # (!\input_vector[15]~input_o\ & ((\input_vector[1]~input_o\) # (\input_vector[31]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[15]~input_o\,
	datab => \add_instance|ALU_C[13]~31_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[31]~input_o\,
	combout => \add_instance|ALU_C[13]~32_combout\);

-- Location: IOIBUF_X36_Y0_N29
\input_vector[16]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(16),
	o => \input_vector[16]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\input_vector[32]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(32),
	o => \input_vector[32]~input_o\);

-- Location: LCCOMB_X25_Y1_N18
\add_instance|ALU_C[14]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[14]~33_combout\ = (\input_vector[1]~input_o\ & (\input_vector[16]~input_o\ & \input_vector[32]~input_o\)) # (!\input_vector[1]~input_o\ & (\input_vector[16]~input_o\ $ (\input_vector[32]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[1]~input_o\,
	datab => \input_vector[16]~input_o\,
	datac => \input_vector[32]~input_o\,
	combout => \add_instance|ALU_C[14]~33_combout\);

-- Location: LCCOMB_X25_Y1_N16
\add_instance|carry~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|carry~10_combout\ = (\input_vector[15]~input_o\ & ((\input_vector[31]~input_o\) # ((\add_instance|carry~9_combout\) # (\add_instance|ALU_C~30_combout\)))) # (!\input_vector[15]~input_o\ & (\input_vector[31]~input_o\ & 
-- ((\add_instance|carry~9_combout\) # (\add_instance|ALU_C~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[15]~input_o\,
	datab => \input_vector[31]~input_o\,
	datac => \add_instance|carry~9_combout\,
	datad => \add_instance|ALU_C~30_combout\,
	combout => \add_instance|carry~10_combout\);

-- Location: LCCOMB_X25_Y1_N12
\add_instance|ALU_C[14]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[14]~34_combout\ = \add_instance|ALU_C[14]~33_combout\ $ (((!\input_vector[0]~input_o\ & ((\add_instance|carry~10_combout\) # (\input_vector[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C[14]~33_combout\,
	datab => \add_instance|carry~10_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[14]~34_combout\);

-- Location: LCCOMB_X25_Y1_N6
\add_instance|ALU_C[15]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[15]~35_combout\ = (\add_instance|carry~10_combout\ & ((\input_vector[32]~input_o\) # (\input_vector[16]~input_o\))) # (!\add_instance|carry~10_combout\ & (\input_vector[32]~input_o\ & \input_vector[16]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \add_instance|carry~10_combout\,
	datac => \input_vector[32]~input_o\,
	datad => \input_vector[16]~input_o\,
	combout => \add_instance|ALU_C[15]~35_combout\);

-- Location: IOIBUF_X14_Y21_N22
\input_vector[17]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(17),
	o => \input_vector[17]~input_o\);

-- Location: IOIBUF_X25_Y27_N22
\input_vector[33]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(33),
	o => \input_vector[33]~input_o\);

-- Location: LCCOMB_X25_Y20_N28
\add_instance|ALU_C[15]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[15]~36_combout\ = (\input_vector[17]~input_o\ & (\input_vector[1]~input_o\ $ (!\input_vector[33]~input_o\))) # (!\input_vector[17]~input_o\ & (!\input_vector[1]~input_o\ & \input_vector[33]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_vector[17]~input_o\,
	datab => \input_vector[1]~input_o\,
	datac => \input_vector[33]~input_o\,
	combout => \add_instance|ALU_C[15]~36_combout\);

-- Location: LCCOMB_X25_Y20_N22
\add_instance|ALU_C[15]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \add_instance|ALU_C[15]~37_combout\ = \add_instance|ALU_C[15]~36_combout\ $ (((!\input_vector[0]~input_o\ & ((\add_instance|ALU_C[15]~35_combout\) # (\input_vector[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \add_instance|ALU_C[15]~35_combout\,
	datab => \add_instance|ALU_C[15]~36_combout\,
	datac => \input_vector[1]~input_o\,
	datad => \input_vector[0]~input_o\,
	combout => \add_instance|ALU_C[15]~37_combout\);

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

ww_output_vector(0) <= \output_vector[0]~output_o\;

ww_output_vector(1) <= \output_vector[1]~output_o\;

ww_output_vector(2) <= \output_vector[2]~output_o\;

ww_output_vector(3) <= \output_vector[3]~output_o\;

ww_output_vector(4) <= \output_vector[4]~output_o\;

ww_output_vector(5) <= \output_vector[5]~output_o\;

ww_output_vector(6) <= \output_vector[6]~output_o\;

ww_output_vector(7) <= \output_vector[7]~output_o\;

ww_output_vector(8) <= \output_vector[8]~output_o\;

ww_output_vector(9) <= \output_vector[9]~output_o\;

ww_output_vector(10) <= \output_vector[10]~output_o\;

ww_output_vector(11) <= \output_vector[11]~output_o\;

ww_output_vector(12) <= \output_vector[12]~output_o\;

ww_output_vector(13) <= \output_vector[13]~output_o\;

ww_output_vector(14) <= \output_vector[14]~output_o\;

ww_output_vector(15) <= \output_vector[15]~output_o\;
END structure;


