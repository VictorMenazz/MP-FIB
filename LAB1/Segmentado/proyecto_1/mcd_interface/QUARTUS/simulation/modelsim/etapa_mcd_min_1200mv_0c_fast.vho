-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "03/12/2023 01:26:05"

-- 
-- Device: Altera EP4CGX30CF23C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	etapa_mcd IS
    PORT (
	reloj : IN std_logic;
	pcero : IN std_logic;
	\pet_dv.val\ : IN std_logic;
	\pet_dv.dat_b\ : IN std_logic_vector(7 DOWNTO 0);
	\pet_dv.dat_a\ : IN std_logic_vector(7 DOWNTO 0);
	\pet_l.listo\ : OUT std_logic;
	\resp_dv.val\ : OUT std_logic;
	\resp_dv.dat\ : OUT std_logic_vector(7 DOWNTO 0);
	\resp_l.listo\ : IN std_logic
	);
END etapa_mcd;

-- Design Ports Information
-- pet_l.listo	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.val	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[0]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[1]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[2]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[4]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[5]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[6]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_dv.dat[7]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- resp_l.listo	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.val	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reloj	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pcero	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[0]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[1]	=>  Location: PIN_A1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[2]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[3]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[4]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[5]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[6]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_a[7]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[7]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[6]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[5]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[4]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[3]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[2]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pet_dv.dat_b[0]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF etapa_mcd IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reloj : std_logic;
SIGNAL ww_pcero : std_logic;
SIGNAL \ww_pet_dv.val\ : std_logic;
SIGNAL \ww_pet_dv.dat_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_pet_dv.dat_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_pet_l.listo\ : std_logic;
SIGNAL \ww_resp_dv.val\ : std_logic;
SIGNAL \ww_resp_dv.dat\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_resp_l.listo\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector7~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reloj~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pcero~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pr_mcd|cam|sub|s[3]~6_combout\ : std_logic;
SIGNAL \pr_mcd|cam|cero|Equal0~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|cero|Equal0~1_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector0~1_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector4~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector2~0_combout\ : std_logic;
SIGNAL \pet_dv.dat_b[7]~input_o\ : std_logic;
SIGNAL \pet_dv.dat_b[6]~input_o\ : std_logic;
SIGNAL \pet_dv.dat_b[5]~input_o\ : std_logic;
SIGNAL \pet_l.listo~output_o\ : std_logic;
SIGNAL \resp_dv.val~output_o\ : std_logic;
SIGNAL \resp_dv.dat[0]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[1]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[2]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[3]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[4]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[5]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[6]~output_o\ : std_logic;
SIGNAL \resp_dv.dat[7]~output_o\ : std_logic;
SIGNAL \reloj~input_o\ : std_logic;
SIGNAL \pet_dv.val~input_o\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector0~2_combout\ : std_logic;
SIGNAL \resp_l.listo~input_o\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector7~0_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector7~1_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector7~1clkctrl_outclk\ : std_logic;
SIGNAL \pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector1~0_combout\ : std_logic;
SIGNAL \pcero~input_o\ : std_logic;
SIGNAL \pcero~inputclkctrl_outclk\ : std_logic;
SIGNAL \pr_mcd|cnt|reg_estado:v_estado.CALC~q\ : std_logic;
SIGNAL \pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector2~0_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|reg_estado:v_estado.HECHO~q\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector0~0_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector0~3_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|reg_estado:v_estado.ESP~q\ : std_logic;
SIGNAL \reloj~inputclkctrl_outclk\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[0]~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector0~0_combout\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector5~2_combout\ : std_logic;
SIGNAL \pet_dv.dat_b[4]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector3~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[3]~3_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[3]~input_o\ : std_logic;
SIGNAL \pr_mcd|cnt|Selector4~1_combout\ : std_logic;
SIGNAL \pet_dv.dat_b[3]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector4~0_combout\ : std_logic;
SIGNAL \pet_dv.dat_b[2]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector5~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[0]~1\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[1]~2_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[1]~1_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[1]~input_o\ : std_logic;
SIGNAL \pet_dv.dat_b[1]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector6~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[1]~3\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[2]~4_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[2]~2_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[2]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[2]~5\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[3]~7\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[4]~8_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[4]~4_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[4]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[4]~9\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[5]~10_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[5]~5_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[5]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[5]~11\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[6]~12_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[6]~6_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[6]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector1~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[6]~13\ : std_logic;
SIGNAL \pr_mcd|cam|sub|s[7]~14_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[7]~7_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[7]~input_o\ : std_logic;
SIGNAL \pet_dv.dat_b[0]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|mx_ini_b|Selector7~0_combout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~1_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~3_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~5_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~7_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~9_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~11_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~13_cout\ : std_logic;
SIGNAL \pr_mcd|cam|men|LessThan0~14_combout\ : std_logic;
SIGNAL \pr_mcd|cam|reg_a|s[0]~0_combout\ : std_logic;
SIGNAL \pet_dv.dat_a[0]~input_o\ : std_logic;
SIGNAL \pr_mcd|cam|reg_b|s\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pr_mcd|cam|reg_a|s\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_pcero~inputclkctrl_outclk\ : std_logic;
SIGNAL \pr_mcd|cnt|ALT_INV_reg_estado:v_estado.ESP~q\ : std_logic;

BEGIN

ww_reloj <= reloj;
ww_pcero <= pcero;
\ww_pet_dv.val\ <= \pet_dv.val\;
\ww_pet_dv.dat_b\ <= \pet_dv.dat_b\;
\ww_pet_dv.dat_a\ <= \pet_dv.dat_a\;
\pet_l.listo\ <= \ww_pet_l.listo\;
\resp_dv.val\ <= \ww_resp_dv.val\;
\resp_dv.dat\ <= \ww_resp_dv.dat\;
\ww_resp_l.listo\ <= \resp_l.listo\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\pr_mcd|cnt|Selector7~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \pr_mcd|cnt|Selector7~1_combout\);

\reloj~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reloj~input_o\);

\pcero~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \pcero~input_o\);
\ALT_INV_pcero~inputclkctrl_outclk\ <= NOT \pcero~inputclkctrl_outclk\;
\pr_mcd|cnt|ALT_INV_reg_estado:v_estado.ESP~q\ <= NOT \pr_mcd|cnt|reg_estado:v_estado.ESP~q\;

-- Location: LCCOMB_X27_Y52_N10
\pr_mcd|cam|sub|s[3]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[3]~6_combout\ = (\pr_mcd|cam|reg_a|s\(3) & ((\pr_mcd|cam|reg_b|s\(3) & (!\pr_mcd|cam|sub|s[2]~5\)) # (!\pr_mcd|cam|reg_b|s\(3) & (\pr_mcd|cam|sub|s[2]~5\ & VCC)))) # (!\pr_mcd|cam|reg_a|s\(3) & ((\pr_mcd|cam|reg_b|s\(3) & 
-- ((\pr_mcd|cam|sub|s[2]~5\) # (GND))) # (!\pr_mcd|cam|reg_b|s\(3) & (!\pr_mcd|cam|sub|s[2]~5\))))
-- \pr_mcd|cam|sub|s[3]~7\ = CARRY((\pr_mcd|cam|reg_a|s\(3) & (\pr_mcd|cam|reg_b|s\(3) & !\pr_mcd|cam|sub|s[2]~5\)) # (!\pr_mcd|cam|reg_a|s\(3) & ((\pr_mcd|cam|reg_b|s\(3)) # (!\pr_mcd|cam|sub|s[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(3),
	datab => \pr_mcd|cam|reg_b|s\(3),
	datad => VCC,
	cin => \pr_mcd|cam|sub|s[2]~5\,
	combout => \pr_mcd|cam|sub|s[3]~6_combout\,
	cout => \pr_mcd|cam|sub|s[3]~7\);

-- Location: FF_X24_Y52_N15
\pr_mcd|cam|reg_b|s[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector2~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(5));

-- Location: LCCOMB_X24_Y52_N26
\pr_mcd|cam|cero|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|cero|Equal0~0_combout\ = (\pr_mcd|cam|reg_b|s\(7)) # ((\pr_mcd|cam|reg_b|s\(4)) # ((\pr_mcd|cam|reg_b|s\(5)) # (\pr_mcd|cam|reg_b|s\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(7),
	datab => \pr_mcd|cam|reg_b|s\(4),
	datac => \pr_mcd|cam|reg_b|s\(5),
	datad => \pr_mcd|cam|reg_b|s\(6),
	combout => \pr_mcd|cam|cero|Equal0~0_combout\);

-- Location: LCCOMB_X26_Y52_N20
\pr_mcd|cam|cero|Equal0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|cero|Equal0~1_combout\ = (\pr_mcd|cam|reg_b|s\(1)) # ((\pr_mcd|cam|reg_b|s\(3)) # ((\pr_mcd|cam|reg_b|s\(2)) # (\pr_mcd|cam|reg_b|s\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(1),
	datab => \pr_mcd|cam|reg_b|s\(3),
	datac => \pr_mcd|cam|reg_b|s\(2),
	datad => \pr_mcd|cam|reg_b|s\(0),
	combout => \pr_mcd|cam|cero|Equal0~1_combout\);

-- Location: LCCOMB_X26_Y52_N6
\pr_mcd|cnt|Selector0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector0~1_combout\ = (\pr_mcd|cam|cero|Equal0~0_combout\) # ((\pr_mcd|cam|cero|Equal0~1_combout\) # (!\pr_mcd|cnt|reg_estado:v_estado.CALC~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|cero|Equal0~0_combout\,
	datac => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\,
	datad => \pr_mcd|cam|cero|Equal0~1_combout\,
	combout => \pr_mcd|cnt|Selector0~1_combout\);

-- Location: LCCOMB_X26_Y52_N26
\pr_mcd|cnt|Selector4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector4~0_combout\ = (\pr_mcd|cnt|reg_estado:v_estado.CALC~q\ & ((\pr_mcd|cam|cero|Equal0~0_combout\) # (\pr_mcd|cam|cero|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\,
	datac => \pr_mcd|cam|cero|Equal0~0_combout\,
	datad => \pr_mcd|cam|cero|Equal0~1_combout\,
	combout => \pr_mcd|cnt|Selector4~0_combout\);

-- Location: LCCOMB_X24_Y52_N14
\pr_mcd|cam|mx_ini_b|Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector2~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pr_mcd|cam|reg_a|s\(5))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.dat_b[5]~input_o\))))) # (!\pet_dv.val~input_o\ & 
-- (\pr_mcd|cam|reg_a|s\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(5),
	datab => \pet_dv.dat_b[5]~input_o\,
	datac => \pet_dv.val~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cam|mx_ini_b|Selector2~0_combout\);

-- Location: IOIBUF_X24_Y67_N8
\pet_dv.dat_b[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(7),
	o => \pet_dv.dat_b[7]~input_o\);

-- Location: IOIBUF_X19_Y67_N15
\pet_dv.dat_b[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(6),
	o => \pet_dv.dat_b[6]~input_o\);

-- Location: IOIBUF_X19_Y67_N22
\pet_dv.dat_b[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(5),
	o => \pet_dv.dat_b[5]~input_o\);

-- Location: IOOBUF_X24_Y0_N2
\pet_l.listo~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cnt|ALT_INV_reg_estado:v_estado.ESP~q\,
	devoe => ww_devoe,
	o => \pet_l.listo~output_o\);

-- Location: IOOBUF_X26_Y67_N16
\resp_dv.val~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cnt|reg_estado:v_estado.HECHO~q\,
	devoe => ww_devoe,
	o => \resp_dv.val~output_o\);

-- Location: IOOBUF_X33_Y67_N16
\resp_dv.dat[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(0),
	devoe => ww_devoe,
	o => \resp_dv.dat[0]~output_o\);

-- Location: IOOBUF_X29_Y67_N16
\resp_dv.dat[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(1),
	devoe => ww_devoe,
	o => \resp_dv.dat[1]~output_o\);

-- Location: IOOBUF_X19_Y67_N9
\resp_dv.dat[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(2),
	devoe => ww_devoe,
	o => \resp_dv.dat[2]~output_o\);

-- Location: IOOBUF_X29_Y67_N23
\resp_dv.dat[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(3),
	devoe => ww_devoe,
	o => \resp_dv.dat[3]~output_o\);

-- Location: IOOBUF_X22_Y67_N9
\resp_dv.dat[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(4),
	devoe => ww_devoe,
	o => \resp_dv.dat[4]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\resp_dv.dat[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(5),
	devoe => ww_devoe,
	o => \resp_dv.dat[5]~output_o\);

-- Location: IOOBUF_X19_Y67_N2
\resp_dv.dat[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(6),
	devoe => ww_devoe,
	o => \resp_dv.dat[6]~output_o\);

-- Location: IOOBUF_X22_Y67_N2
\resp_dv.dat[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pr_mcd|cam|reg_a|s\(7),
	devoe => ww_devoe,
	o => \resp_dv.dat[7]~output_o\);

-- Location: IOIBUF_X38_Y0_N15
\reloj~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reloj,
	o => \reloj~input_o\);

-- Location: IOIBUF_X26_Y67_N22
\pet_dv.val~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.val\,
	o => \pet_dv.val~input_o\);

-- Location: LCCOMB_X26_Y52_N22
\pr_mcd|cnt|Selector0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector0~2_combout\ = (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & \pet_dv.val~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	datad => \pet_dv.val~input_o\,
	combout => \pr_mcd|cnt|Selector0~2_combout\);

-- Location: IOIBUF_X26_Y67_N1
\resp_l.listo~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_resp_l.listo\,
	o => \resp_l.listo~input_o\);

-- Location: LCCOMB_X26_Y52_N4
\pr_mcd|cnt|Selector7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector7~0_combout\ = (\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\resp_l.listo~input_o\ & (!\pr_mcd|cnt|reg_estado:v_estado.CALC~q\))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (((\pet_dv.val~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	datab => \resp_l.listo~input_o\,
	datac => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\,
	datad => \pet_dv.val~input_o\,
	combout => \pr_mcd|cnt|Selector7~0_combout\);

-- Location: LCCOMB_X26_Y52_N28
\pr_mcd|cnt|Selector7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector7~1_combout\ = (\pr_mcd|cnt|Selector7~0_combout\) # ((!\pr_mcd|cnt|Selector0~1_combout\ & \pr_mcd|cnt|reg_estado:v_estado.ESP~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|Selector0~1_combout\,
	datac => \pr_mcd|cnt|Selector7~0_combout\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cnt|Selector7~1_combout\);

-- Location: CLKCTRL_G23
\pr_mcd|cnt|Selector7~1clkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \pr_mcd|cnt|Selector7~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \pr_mcd|cnt|Selector7~1clkctrl_outclk\);

-- Location: LCCOMB_X26_Y52_N10
\pr_mcd|cnt|prx_esta:v_prxestado.CALC_109\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\ = (GLOBAL(\pr_mcd|cnt|Selector7~1clkctrl_outclk\) & ((!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\))) # (!GLOBAL(\pr_mcd|cnt|Selector7~1clkctrl_outclk\) & (\pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\,
	datac => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	datad => \pr_mcd|cnt|Selector7~1clkctrl_outclk\,
	combout => \pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\);

-- Location: LCCOMB_X26_Y52_N30
\pr_mcd|cnt|Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector1~0_combout\ = (\pr_mcd|cnt|Selector0~1_combout\ & ((\pr_mcd|cnt|Selector0~2_combout\ & ((\pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\) # (!\pr_mcd|cnt|Selector0~0_combout\))) # (!\pr_mcd|cnt|Selector0~2_combout\ & 
-- (!\pr_mcd|cnt|Selector0~0_combout\ & \pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\)))) # (!\pr_mcd|cnt|Selector0~1_combout\ & (\pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\ & (\pr_mcd|cnt|Selector0~2_combout\ $ 
-- (\pr_mcd|cnt|Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|Selector0~1_combout\,
	datab => \pr_mcd|cnt|Selector0~2_combout\,
	datac => \pr_mcd|cnt|Selector0~0_combout\,
	datad => \pr_mcd|cnt|prx_esta:v_prxestado.CALC_109~combout\,
	combout => \pr_mcd|cnt|Selector1~0_combout\);

-- Location: IOIBUF_X38_Y0_N22
\pcero~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pcero,
	o => \pcero~input_o\);

-- Location: CLKCTRL_G28
\pcero~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \pcero~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \pcero~inputclkctrl_outclk\);

-- Location: FF_X26_Y52_N31
\pr_mcd|cnt|reg_estado:v_estado.CALC\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cnt|Selector1~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\);

-- Location: LCCOMB_X26_Y52_N2
\pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\ = (GLOBAL(\pr_mcd|cnt|Selector7~1clkctrl_outclk\) & ((\pr_mcd|cnt|reg_estado:v_estado.CALC~q\))) # (!GLOBAL(\pr_mcd|cnt|Selector7~1clkctrl_outclk\) & (\pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\,
	datac => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\,
	datad => \pr_mcd|cnt|Selector7~1clkctrl_outclk\,
	combout => \pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\);

-- Location: LCCOMB_X26_Y52_N14
\pr_mcd|cnt|Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector2~0_combout\ = (\pr_mcd|cnt|Selector0~1_combout\ & (\pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\ & (\pr_mcd|cnt|Selector0~2_combout\ $ (!\pr_mcd|cnt|Selector0~0_combout\)))) # (!\pr_mcd|cnt|Selector0~1_combout\ & 
-- ((\pr_mcd|cnt|Selector0~2_combout\ & (!\pr_mcd|cnt|Selector0~0_combout\ & \pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\)) # (!\pr_mcd|cnt|Selector0~2_combout\ & ((\pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\) # 
-- (!\pr_mcd|cnt|Selector0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|Selector0~1_combout\,
	datab => \pr_mcd|cnt|Selector0~2_combout\,
	datac => \pr_mcd|cnt|Selector0~0_combout\,
	datad => \pr_mcd|cnt|prx_esta:v_prxestado.HECHO_98~combout\,
	combout => \pr_mcd|cnt|Selector2~0_combout\);

-- Location: FF_X26_Y52_N15
\pr_mcd|cnt|reg_estado:v_estado.HECHO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cnt|Selector2~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cnt|reg_estado:v_estado.HECHO~q\);

-- Location: LCCOMB_X26_Y52_N18
\pr_mcd|cnt|Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector0~0_combout\ = (\resp_l.listo~input_o\ & \pr_mcd|cnt|reg_estado:v_estado.HECHO~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \resp_l.listo~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.HECHO~q\,
	combout => \pr_mcd|cnt|Selector0~0_combout\);

-- Location: LCCOMB_X26_Y52_N16
\pr_mcd|cnt|prx_esta:v_prxestado.ESP_120\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\ = (GLOBAL(\pr_mcd|cnt|Selector7~1clkctrl_outclk\) & ((\pr_mcd|cnt|reg_estado:v_estado.HECHO~q\))) # (!GLOBAL(\pr_mcd|cnt|Selector7~1clkctrl_outclk\) & (\pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\,
	datac => \pr_mcd|cnt|reg_estado:v_estado.HECHO~q\,
	datad => \pr_mcd|cnt|Selector7~1clkctrl_outclk\,
	combout => \pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\);

-- Location: LCCOMB_X26_Y52_N12
\pr_mcd|cnt|Selector0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector0~3_combout\ = (\pr_mcd|cnt|Selector0~0_combout\ & (!\pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\ & (\pr_mcd|cnt|Selector0~1_combout\ $ (!\pr_mcd|cnt|Selector0~2_combout\)))) # (!\pr_mcd|cnt|Selector0~0_combout\ & 
-- ((\pr_mcd|cnt|Selector0~1_combout\ $ (!\pr_mcd|cnt|Selector0~2_combout\)) # (!\pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|Selector0~1_combout\,
	datab => \pr_mcd|cnt|Selector0~2_combout\,
	datac => \pr_mcd|cnt|Selector0~0_combout\,
	datad => \pr_mcd|cnt|prx_esta:v_prxestado.ESP_120~combout\,
	combout => \pr_mcd|cnt|Selector0~3_combout\);

-- Location: FF_X26_Y52_N13
\pr_mcd|cnt|reg_estado:v_estado.ESP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cnt|Selector0~3_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\);

-- Location: CLKCTRL_G29
\reloj~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reloj~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reloj~inputclkctrl_outclk\);

-- Location: LCCOMB_X27_Y52_N4
\pr_mcd|cam|sub|s[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[0]~0_combout\ = (\pr_mcd|cam|reg_b|s\(0) & (\pr_mcd|cam|reg_a|s\(0) $ (VCC))) # (!\pr_mcd|cam|reg_b|s\(0) & ((\pr_mcd|cam|reg_a|s\(0)) # (GND)))
-- \pr_mcd|cam|sub|s[0]~1\ = CARRY((\pr_mcd|cam|reg_a|s\(0)) # (!\pr_mcd|cam|reg_b|s\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(0),
	datab => \pr_mcd|cam|reg_a|s\(0),
	datad => VCC,
	combout => \pr_mcd|cam|sub|s[0]~0_combout\,
	cout => \pr_mcd|cam|sub|s[0]~1\);

-- Location: LCCOMB_X24_Y52_N30
\pr_mcd|cam|mx_ini_b|Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector0~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pr_mcd|cam|reg_a|s\(7)))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pet_dv.dat_b[7]~input_o\)))) # (!\pet_dv.val~input_o\ & 
-- (((\pr_mcd|cam|reg_a|s\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pet_dv.dat_b[7]~input_o\,
	datab => \pr_mcd|cam|reg_a|s\(7),
	datac => \pet_dv.val~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cam|mx_ini_b|Selector0~0_combout\);

-- Location: LCCOMB_X25_Y52_N0
\pr_mcd|cnt|Selector5~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector5~2_combout\ = (\pr_mcd|cnt|reg_estado:v_estado.CALC~q\ & ((\pr_mcd|cam|men|LessThan0~14_combout\) # ((!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & \pet_dv.val~input_o\)))) # (!\pr_mcd|cnt|reg_estado:v_estado.CALC~q\ & 
-- (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.val~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\,
	datab => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	datac => \pr_mcd|cam|men|LessThan0~14_combout\,
	datad => \pet_dv.val~input_o\,
	combout => \pr_mcd|cnt|Selector5~2_combout\);

-- Location: FF_X24_Y52_N31
\pr_mcd|cam|reg_b|s[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector0~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(7));

-- Location: IOIBUF_X24_Y67_N1
\pet_dv.dat_b[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(4),
	o => \pet_dv.dat_b[4]~input_o\);

-- Location: LCCOMB_X24_Y52_N16
\pr_mcd|cam|mx_ini_b|Selector3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector3~0_combout\ = (\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pr_mcd|cam|reg_a|s\(4))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.val~input_o\ & ((\pet_dv.dat_b[4]~input_o\))) # (!\pet_dv.val~input_o\ & 
-- (\pr_mcd|cam|reg_a|s\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(4),
	datab => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	datac => \pet_dv.val~input_o\,
	datad => \pet_dv.dat_b[4]~input_o\,
	combout => \pr_mcd|cam|mx_ini_b|Selector3~0_combout\);

-- Location: FF_X24_Y52_N17
\pr_mcd|cam|reg_b|s[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector3~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(4));

-- Location: LCCOMB_X27_Y52_N22
\pr_mcd|cam|reg_a|s[3]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[3]~3_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|reg_b|s\(3)))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|sub|s[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|sub|s[3]~6_combout\,
	datab => \pr_mcd|cam|reg_b|s\(3),
	datad => \pr_mcd|cam|men|LessThan0~14_combout\,
	combout => \pr_mcd|cam|reg_a|s[3]~3_combout\);

-- Location: IOIBUF_X33_Y67_N22
\pet_dv.dat_a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(3),
	o => \pet_dv.dat_a[3]~input_o\);

-- Location: LCCOMB_X26_Y52_N24
\pr_mcd|cnt|Selector4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cnt|Selector4~1_combout\ = (\pr_mcd|cnt|Selector4~0_combout\) # ((\pr_mcd|cnt|Selector0~2_combout\) # ((\pr_mcd|cnt|reg_estado:v_estado.CALC~q\ & \pr_mcd|cam|men|LessThan0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cnt|Selector4~0_combout\,
	datab => \pr_mcd|cnt|reg_estado:v_estado.CALC~q\,
	datac => \pr_mcd|cnt|Selector0~2_combout\,
	datad => \pr_mcd|cam|men|LessThan0~14_combout\,
	combout => \pr_mcd|cnt|Selector4~1_combout\);

-- Location: FF_X27_Y52_N23
\pr_mcd|cam|reg_a|s[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[3]~3_combout\,
	asdata => \pet_dv.dat_a[3]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(3));

-- Location: IOIBUF_X29_Y67_N1
\pet_dv.dat_b[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(3),
	o => \pet_dv.dat_b[3]~input_o\);

-- Location: LCCOMB_X25_Y52_N6
\pr_mcd|cam|mx_ini_b|Selector4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector4~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pr_mcd|cam|reg_a|s\(3))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.dat_b[3]~input_o\))))) # (!\pet_dv.val~input_o\ & 
-- (((\pr_mcd|cam|reg_a|s\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pet_dv.val~input_o\,
	datab => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	datac => \pr_mcd|cam|reg_a|s\(3),
	datad => \pet_dv.dat_b[3]~input_o\,
	combout => \pr_mcd|cam|mx_ini_b|Selector4~0_combout\);

-- Location: FF_X25_Y52_N7
\pr_mcd|cam|reg_b|s[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector4~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(3));

-- Location: IOIBUF_X17_Y67_N15
\pet_dv.dat_b[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(2),
	o => \pet_dv.dat_b[2]~input_o\);

-- Location: LCCOMB_X25_Y52_N26
\pr_mcd|cam|mx_ini_b|Selector5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector5~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pr_mcd|cam|reg_a|s\(2))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.dat_b[2]~input_o\))))) # (!\pet_dv.val~input_o\ & 
-- (\pr_mcd|cam|reg_a|s\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pet_dv.val~input_o\,
	datab => \pr_mcd|cam|reg_a|s\(2),
	datac => \pet_dv.dat_b[2]~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cam|mx_ini_b|Selector5~0_combout\);

-- Location: FF_X25_Y52_N27
\pr_mcd|cam|reg_b|s[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector5~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(2));

-- Location: LCCOMB_X27_Y52_N6
\pr_mcd|cam|sub|s[1]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[1]~2_combout\ = (\pr_mcd|cam|reg_a|s\(1) & ((\pr_mcd|cam|reg_b|s\(1) & (!\pr_mcd|cam|sub|s[0]~1\)) # (!\pr_mcd|cam|reg_b|s\(1) & (\pr_mcd|cam|sub|s[0]~1\ & VCC)))) # (!\pr_mcd|cam|reg_a|s\(1) & ((\pr_mcd|cam|reg_b|s\(1) & 
-- ((\pr_mcd|cam|sub|s[0]~1\) # (GND))) # (!\pr_mcd|cam|reg_b|s\(1) & (!\pr_mcd|cam|sub|s[0]~1\))))
-- \pr_mcd|cam|sub|s[1]~3\ = CARRY((\pr_mcd|cam|reg_a|s\(1) & (\pr_mcd|cam|reg_b|s\(1) & !\pr_mcd|cam|sub|s[0]~1\)) # (!\pr_mcd|cam|reg_a|s\(1) & ((\pr_mcd|cam|reg_b|s\(1)) # (!\pr_mcd|cam|sub|s[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(1),
	datab => \pr_mcd|cam|reg_b|s\(1),
	datad => VCC,
	cin => \pr_mcd|cam|sub|s[0]~1\,
	combout => \pr_mcd|cam|sub|s[1]~2_combout\,
	cout => \pr_mcd|cam|sub|s[1]~3\);

-- Location: LCCOMB_X25_Y52_N4
\pr_mcd|cam|reg_a|s[1]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[1]~1_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(1))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|men|LessThan0~14_combout\,
	datab => \pr_mcd|cam|reg_b|s\(1),
	datad => \pr_mcd|cam|sub|s[1]~2_combout\,
	combout => \pr_mcd|cam|reg_a|s[1]~1_combout\);

-- Location: IOIBUF_X26_Y67_N8
\pet_dv.dat_a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(1),
	o => \pet_dv.dat_a[1]~input_o\);

-- Location: FF_X25_Y52_N5
\pr_mcd|cam|reg_a|s[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[1]~1_combout\,
	asdata => \pet_dv.dat_a[1]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(1));

-- Location: IOIBUF_X29_Y67_N8
\pet_dv.dat_b[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(1),
	o => \pet_dv.dat_b[1]~input_o\);

-- Location: LCCOMB_X25_Y52_N30
\pr_mcd|cam|mx_ini_b|Selector6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector6~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pr_mcd|cam|reg_a|s\(1))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.dat_b[1]~input_o\))))) # (!\pet_dv.val~input_o\ & 
-- (\pr_mcd|cam|reg_a|s\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pet_dv.val~input_o\,
	datab => \pr_mcd|cam|reg_a|s\(1),
	datac => \pet_dv.dat_b[1]~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cam|mx_ini_b|Selector6~0_combout\);

-- Location: FF_X25_Y52_N31
\pr_mcd|cam|reg_b|s[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector6~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(1));

-- Location: LCCOMB_X27_Y52_N8
\pr_mcd|cam|sub|s[2]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[2]~4_combout\ = ((\pr_mcd|cam|reg_b|s\(2) $ (\pr_mcd|cam|reg_a|s\(2) $ (\pr_mcd|cam|sub|s[1]~3\)))) # (GND)
-- \pr_mcd|cam|sub|s[2]~5\ = CARRY((\pr_mcd|cam|reg_b|s\(2) & (\pr_mcd|cam|reg_a|s\(2) & !\pr_mcd|cam|sub|s[1]~3\)) # (!\pr_mcd|cam|reg_b|s\(2) & ((\pr_mcd|cam|reg_a|s\(2)) # (!\pr_mcd|cam|sub|s[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(2),
	datab => \pr_mcd|cam|reg_a|s\(2),
	datad => VCC,
	cin => \pr_mcd|cam|sub|s[1]~3\,
	combout => \pr_mcd|cam|sub|s[2]~4_combout\,
	cout => \pr_mcd|cam|sub|s[2]~5\);

-- Location: LCCOMB_X25_Y52_N2
\pr_mcd|cam|reg_a|s[2]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[2]~2_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(2))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|men|LessThan0~14_combout\,
	datab => \pr_mcd|cam|reg_b|s\(2),
	datad => \pr_mcd|cam|sub|s[2]~4_combout\,
	combout => \pr_mcd|cam|reg_a|s[2]~2_combout\);

-- Location: IOIBUF_X24_Y67_N22
\pet_dv.dat_a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(2),
	o => \pet_dv.dat_a[2]~input_o\);

-- Location: FF_X25_Y52_N3
\pr_mcd|cam|reg_a|s[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[2]~2_combout\,
	asdata => \pet_dv.dat_a[2]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(2));

-- Location: LCCOMB_X27_Y52_N12
\pr_mcd|cam|sub|s[4]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[4]~8_combout\ = ((\pr_mcd|cam|reg_b|s\(4) $ (\pr_mcd|cam|reg_a|s\(4) $ (\pr_mcd|cam|sub|s[3]~7\)))) # (GND)
-- \pr_mcd|cam|sub|s[4]~9\ = CARRY((\pr_mcd|cam|reg_b|s\(4) & (\pr_mcd|cam|reg_a|s\(4) & !\pr_mcd|cam|sub|s[3]~7\)) # (!\pr_mcd|cam|reg_b|s\(4) & ((\pr_mcd|cam|reg_a|s\(4)) # (!\pr_mcd|cam|sub|s[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(4),
	datab => \pr_mcd|cam|reg_a|s\(4),
	datad => VCC,
	cin => \pr_mcd|cam|sub|s[3]~7\,
	combout => \pr_mcd|cam|sub|s[4]~8_combout\,
	cout => \pr_mcd|cam|sub|s[4]~9\);

-- Location: LCCOMB_X25_Y52_N24
\pr_mcd|cam|reg_a|s[4]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[4]~4_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(4))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[4]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|men|LessThan0~14_combout\,
	datab => \pr_mcd|cam|reg_b|s\(4),
	datad => \pr_mcd|cam|sub|s[4]~8_combout\,
	combout => \pr_mcd|cam|reg_a|s[4]~4_combout\);

-- Location: IOIBUF_X33_Y67_N8
\pet_dv.dat_a[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(4),
	o => \pet_dv.dat_a[4]~input_o\);

-- Location: FF_X25_Y52_N25
\pr_mcd|cam|reg_a|s[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[4]~4_combout\,
	asdata => \pet_dv.dat_a[4]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(4));

-- Location: LCCOMB_X27_Y52_N14
\pr_mcd|cam|sub|s[5]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[5]~10_combout\ = (\pr_mcd|cam|reg_b|s\(5) & ((\pr_mcd|cam|reg_a|s\(5) & (!\pr_mcd|cam|sub|s[4]~9\)) # (!\pr_mcd|cam|reg_a|s\(5) & ((\pr_mcd|cam|sub|s[4]~9\) # (GND))))) # (!\pr_mcd|cam|reg_b|s\(5) & ((\pr_mcd|cam|reg_a|s\(5) & 
-- (\pr_mcd|cam|sub|s[4]~9\ & VCC)) # (!\pr_mcd|cam|reg_a|s\(5) & (!\pr_mcd|cam|sub|s[4]~9\))))
-- \pr_mcd|cam|sub|s[5]~11\ = CARRY((\pr_mcd|cam|reg_b|s\(5) & ((!\pr_mcd|cam|sub|s[4]~9\) # (!\pr_mcd|cam|reg_a|s\(5)))) # (!\pr_mcd|cam|reg_b|s\(5) & (!\pr_mcd|cam|reg_a|s\(5) & !\pr_mcd|cam|sub|s[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(5),
	datab => \pr_mcd|cam|reg_a|s\(5),
	datad => VCC,
	cin => \pr_mcd|cam|sub|s[4]~9\,
	combout => \pr_mcd|cam|sub|s[5]~10_combout\,
	cout => \pr_mcd|cam|sub|s[5]~11\);

-- Location: LCCOMB_X27_Y52_N24
\pr_mcd|cam|reg_a|s[5]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[5]~5_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(5))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[5]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(5),
	datab => \pr_mcd|cam|sub|s[5]~10_combout\,
	datad => \pr_mcd|cam|men|LessThan0~14_combout\,
	combout => \pr_mcd|cam|reg_a|s[5]~5_combout\);

-- Location: IOIBUF_X31_Y67_N22
\pet_dv.dat_a[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(5),
	o => \pet_dv.dat_a[5]~input_o\);

-- Location: FF_X27_Y52_N25
\pr_mcd|cam|reg_a|s[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[5]~5_combout\,
	asdata => \pet_dv.dat_a[5]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(5));

-- Location: LCCOMB_X27_Y52_N16
\pr_mcd|cam|sub|s[6]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[6]~12_combout\ = ((\pr_mcd|cam|reg_a|s\(6) $ (\pr_mcd|cam|reg_b|s\(6) $ (\pr_mcd|cam|sub|s[5]~11\)))) # (GND)
-- \pr_mcd|cam|sub|s[6]~13\ = CARRY((\pr_mcd|cam|reg_a|s\(6) & ((!\pr_mcd|cam|sub|s[5]~11\) # (!\pr_mcd|cam|reg_b|s\(6)))) # (!\pr_mcd|cam|reg_a|s\(6) & (!\pr_mcd|cam|reg_b|s\(6) & !\pr_mcd|cam|sub|s[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(6),
	datab => \pr_mcd|cam|reg_b|s\(6),
	datad => VCC,
	cin => \pr_mcd|cam|sub|s[5]~11\,
	combout => \pr_mcd|cam|sub|s[6]~12_combout\,
	cout => \pr_mcd|cam|sub|s[6]~13\);

-- Location: LCCOMB_X27_Y52_N26
\pr_mcd|cam|reg_a|s[6]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[6]~6_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(6))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[6]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(6),
	datab => \pr_mcd|cam|men|LessThan0~14_combout\,
	datad => \pr_mcd|cam|sub|s[6]~12_combout\,
	combout => \pr_mcd|cam|reg_a|s[6]~6_combout\);

-- Location: IOIBUF_X31_Y67_N15
\pet_dv.dat_a[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(6),
	o => \pet_dv.dat_a[6]~input_o\);

-- Location: FF_X27_Y52_N27
\pr_mcd|cam|reg_a|s[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[6]~6_combout\,
	asdata => \pet_dv.dat_a[6]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(6));

-- Location: LCCOMB_X24_Y52_N6
\pr_mcd|cam|mx_ini_b|Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector1~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pr_mcd|cam|reg_a|s\(6)))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pet_dv.dat_b[6]~input_o\)))) # (!\pet_dv.val~input_o\ & 
-- (((\pr_mcd|cam|reg_a|s\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pet_dv.dat_b[6]~input_o\,
	datab => \pr_mcd|cam|reg_a|s\(6),
	datac => \pet_dv.val~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cam|mx_ini_b|Selector1~0_combout\);

-- Location: FF_X24_Y52_N7
\pr_mcd|cam|reg_b|s[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector1~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(6));

-- Location: LCCOMB_X27_Y52_N18
\pr_mcd|cam|sub|s[7]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|sub|s[7]~14_combout\ = \pr_mcd|cam|reg_a|s\(7) $ (\pr_mcd|cam|sub|s[6]~13\ $ (!\pr_mcd|cam|reg_b|s\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pr_mcd|cam|reg_a|s\(7),
	datad => \pr_mcd|cam|reg_b|s\(7),
	cin => \pr_mcd|cam|sub|s[6]~13\,
	combout => \pr_mcd|cam|sub|s[7]~14_combout\);

-- Location: LCCOMB_X27_Y52_N20
\pr_mcd|cam|reg_a|s[7]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[7]~7_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(7))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[7]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(7),
	datab => \pr_mcd|cam|men|LessThan0~14_combout\,
	datad => \pr_mcd|cam|sub|s[7]~14_combout\,
	combout => \pr_mcd|cam|reg_a|s[7]~7_combout\);

-- Location: IOIBUF_X31_Y67_N8
\pet_dv.dat_a[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(7),
	o => \pet_dv.dat_a[7]~input_o\);

-- Location: FF_X27_Y52_N21
\pr_mcd|cam|reg_a|s[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[7]~7_combout\,
	asdata => \pet_dv.dat_a[7]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(7));

-- Location: IOIBUF_X24_Y67_N15
\pet_dv.dat_b[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_b\(0),
	o => \pet_dv.dat_b[0]~input_o\);

-- Location: LCCOMB_X25_Y52_N28
\pr_mcd|cam|mx_ini_b|Selector7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|mx_ini_b|Selector7~0_combout\ = (\pet_dv.val~input_o\ & ((\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & (\pr_mcd|cam|reg_a|s\(0))) # (!\pr_mcd|cnt|reg_estado:v_estado.ESP~q\ & ((\pet_dv.dat_b[0]~input_o\))))) # (!\pet_dv.val~input_o\ & 
-- (\pr_mcd|cam|reg_a|s\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pet_dv.val~input_o\,
	datab => \pr_mcd|cam|reg_a|s\(0),
	datac => \pet_dv.dat_b[0]~input_o\,
	datad => \pr_mcd|cnt|reg_estado:v_estado.ESP~q\,
	combout => \pr_mcd|cam|mx_ini_b|Selector7~0_combout\);

-- Location: FF_X25_Y52_N29
\pr_mcd|cam|reg_b|s[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~input_o\,
	d => \pr_mcd|cam|mx_ini_b|Selector7~0_combout\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	ena => \pr_mcd|cnt|Selector5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_b|s\(0));

-- Location: LCCOMB_X25_Y52_N8
\pr_mcd|cam|men|LessThan0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~1_cout\ = CARRY((!\pr_mcd|cam|reg_a|s\(0) & \pr_mcd|cam|reg_b|s\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(0),
	datab => \pr_mcd|cam|reg_b|s\(0),
	datad => VCC,
	cout => \pr_mcd|cam|men|LessThan0~1_cout\);

-- Location: LCCOMB_X25_Y52_N10
\pr_mcd|cam|men|LessThan0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~3_cout\ = CARRY((\pr_mcd|cam|reg_b|s\(1) & (\pr_mcd|cam|reg_a|s\(1) & !\pr_mcd|cam|men|LessThan0~1_cout\)) # (!\pr_mcd|cam|reg_b|s\(1) & ((\pr_mcd|cam|reg_a|s\(1)) # (!\pr_mcd|cam|men|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(1),
	datab => \pr_mcd|cam|reg_a|s\(1),
	datad => VCC,
	cin => \pr_mcd|cam|men|LessThan0~1_cout\,
	cout => \pr_mcd|cam|men|LessThan0~3_cout\);

-- Location: LCCOMB_X25_Y52_N12
\pr_mcd|cam|men|LessThan0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~5_cout\ = CARRY((\pr_mcd|cam|reg_b|s\(2) & ((!\pr_mcd|cam|men|LessThan0~3_cout\) # (!\pr_mcd|cam|reg_a|s\(2)))) # (!\pr_mcd|cam|reg_b|s\(2) & (!\pr_mcd|cam|reg_a|s\(2) & !\pr_mcd|cam|men|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(2),
	datab => \pr_mcd|cam|reg_a|s\(2),
	datad => VCC,
	cin => \pr_mcd|cam|men|LessThan0~3_cout\,
	cout => \pr_mcd|cam|men|LessThan0~5_cout\);

-- Location: LCCOMB_X25_Y52_N14
\pr_mcd|cam|men|LessThan0~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~7_cout\ = CARRY((\pr_mcd|cam|reg_b|s\(3) & (\pr_mcd|cam|reg_a|s\(3) & !\pr_mcd|cam|men|LessThan0~5_cout\)) # (!\pr_mcd|cam|reg_b|s\(3) & ((\pr_mcd|cam|reg_a|s\(3)) # (!\pr_mcd|cam|men|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(3),
	datab => \pr_mcd|cam|reg_a|s\(3),
	datad => VCC,
	cin => \pr_mcd|cam|men|LessThan0~5_cout\,
	cout => \pr_mcd|cam|men|LessThan0~7_cout\);

-- Location: LCCOMB_X25_Y52_N16
\pr_mcd|cam|men|LessThan0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~9_cout\ = CARRY((\pr_mcd|cam|reg_b|s\(4) & ((!\pr_mcd|cam|men|LessThan0~7_cout\) # (!\pr_mcd|cam|reg_a|s\(4)))) # (!\pr_mcd|cam|reg_b|s\(4) & (!\pr_mcd|cam|reg_a|s\(4) & !\pr_mcd|cam|men|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(4),
	datab => \pr_mcd|cam|reg_a|s\(4),
	datad => VCC,
	cin => \pr_mcd|cam|men|LessThan0~7_cout\,
	cout => \pr_mcd|cam|men|LessThan0~9_cout\);

-- Location: LCCOMB_X25_Y52_N18
\pr_mcd|cam|men|LessThan0~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~11_cout\ = CARRY((\pr_mcd|cam|reg_b|s\(5) & (\pr_mcd|cam|reg_a|s\(5) & !\pr_mcd|cam|men|LessThan0~9_cout\)) # (!\pr_mcd|cam|reg_b|s\(5) & ((\pr_mcd|cam|reg_a|s\(5)) # (!\pr_mcd|cam|men|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(5),
	datab => \pr_mcd|cam|reg_a|s\(5),
	datad => VCC,
	cin => \pr_mcd|cam|men|LessThan0~9_cout\,
	cout => \pr_mcd|cam|men|LessThan0~11_cout\);

-- Location: LCCOMB_X25_Y52_N20
\pr_mcd|cam|men|LessThan0~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~13_cout\ = CARRY((\pr_mcd|cam|reg_a|s\(6) & (\pr_mcd|cam|reg_b|s\(6) & !\pr_mcd|cam|men|LessThan0~11_cout\)) # (!\pr_mcd|cam|reg_a|s\(6) & ((\pr_mcd|cam|reg_b|s\(6)) # (!\pr_mcd|cam|men|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_a|s\(6),
	datab => \pr_mcd|cam|reg_b|s\(6),
	datad => VCC,
	cin => \pr_mcd|cam|men|LessThan0~11_cout\,
	cout => \pr_mcd|cam|men|LessThan0~13_cout\);

-- Location: LCCOMB_X25_Y52_N22
\pr_mcd|cam|men|LessThan0~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|men|LessThan0~14_combout\ = (\pr_mcd|cam|reg_a|s\(7) & (\pr_mcd|cam|men|LessThan0~13_cout\ & \pr_mcd|cam|reg_b|s\(7))) # (!\pr_mcd|cam|reg_a|s\(7) & ((\pr_mcd|cam|men|LessThan0~13_cout\) # (\pr_mcd|cam|reg_b|s\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pr_mcd|cam|reg_a|s\(7),
	datad => \pr_mcd|cam|reg_b|s\(7),
	cin => \pr_mcd|cam|men|LessThan0~13_cout\,
	combout => \pr_mcd|cam|men|LessThan0~14_combout\);

-- Location: LCCOMB_X27_Y52_N28
\pr_mcd|cam|reg_a|s[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \pr_mcd|cam|reg_a|s[0]~0_combout\ = (\pr_mcd|cam|men|LessThan0~14_combout\ & (\pr_mcd|cam|reg_b|s\(0))) # (!\pr_mcd|cam|men|LessThan0~14_combout\ & ((\pr_mcd|cam|sub|s[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pr_mcd|cam|reg_b|s\(0),
	datab => \pr_mcd|cam|sub|s[0]~0_combout\,
	datad => \pr_mcd|cam|men|LessThan0~14_combout\,
	combout => \pr_mcd|cam|reg_a|s[0]~0_combout\);

-- Location: IOIBUF_X31_Y67_N1
\pet_dv.dat_a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_pet_dv.dat_a\(0),
	o => \pet_dv.dat_a[0]~input_o\);

-- Location: FF_X27_Y52_N29
\pr_mcd|cam|reg_a|s[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reloj~inputclkctrl_outclk\,
	d => \pr_mcd|cam|reg_a|s[0]~0_combout\,
	asdata => \pet_dv.dat_a[0]~input_o\,
	clrn => \ALT_INV_pcero~inputclkctrl_outclk\,
	sload => \pr_mcd|cnt|Selector0~2_combout\,
	ena => \pr_mcd|cnt|Selector4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pr_mcd|cam|reg_a|s\(0));

\ww_pet_l.listo\ <= \pet_l.listo~output_o\;

\ww_resp_dv.val\ <= \resp_dv.val~output_o\;

\ww_resp_dv.dat\(0) <= \resp_dv.dat[0]~output_o\;

\ww_resp_dv.dat\(1) <= \resp_dv.dat[1]~output_o\;

\ww_resp_dv.dat\(2) <= \resp_dv.dat[2]~output_o\;

\ww_resp_dv.dat\(3) <= \resp_dv.dat[3]~output_o\;

\ww_resp_dv.dat\(4) <= \resp_dv.dat[4]~output_o\;

\ww_resp_dv.dat\(5) <= \resp_dv.dat[5]~output_o\;

\ww_resp_dv.dat\(6) <= \resp_dv.dat[6]~output_o\;

\ww_resp_dv.dat\(7) <= \resp_dv.dat[7]~output_o\;
END structure;


