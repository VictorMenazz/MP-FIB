--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
--! @image html camino_1.png 

entity camino_mcd is
   port (reloj, pcero, pe_a, pe_b: std_logic;
	ini: std_logic;
	a, b: in st_dat;
	s: out st_dat;
	ig, meu: out std_logic);
end camino_mcd;

architecture estruc of camino_mcd is
	signal subTOmx_a  : st_dat; -- Entradas de mx_a
	signal NOTaMENb, aMENb : std_logic;
	signal mx_aTOmx_ini_a, mx_ini_aTO : st_dat; -- Entradas mx_ini_a
	signal mx_ini_aTOreg_a, mx_ini_bTOreg_b : st_dat; -- Signals entre mx y reg
	signal reg_aTO, reg_bTO : st_dat; --Salidas registros/entradas restador
begin
	mx_a: mux2 port map (d0 => reg_bTO, d1 => subTOmx_a, SEL => NOTaMENb, s => mx_aTOmx_ini_a);
	
	mx_ini_a : mux2 port map (d0 => mx_aTOmx_ini_a, d1 => a, SEL => ini, s => mx_ini_aTOreg_a); 
	mx_ini_b : mux2 port map (d0 => reg_aTO, d1 => b, SEL => ini, s => mx_ini_bTOreg_b);
	
	reg_a: RD_N_pe port map (reloj => reloj, pcero => pcero, pe => pe_a, e => mx_ini_aTOreg_a, s => reg_aTO);
	reg_b: RD_N_pe port map (reloj => reloj, pcero => pcero, pe => pe_b, e => mx_ini_bTOreg_b, s => reg_bTO);
	
	men: menqu port map (L1 => reg_aTO, L2 => reg_bTO, meu => aMENb);
	NOTaMENb <= not aMENb;
	
	sub: sumador port map (a => reg_aTO, b => reg_bTO, s => subTOmx_a);
	
	s <= reg_aTO;
	meu <= aMENb;
	cero: igual_cero port map (L1 => reg_bTO, ig => ig);
	
end estruc;
