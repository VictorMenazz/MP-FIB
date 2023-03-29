--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
--! @image html camino_2.png 

entity camino_mcd is
   port (reloj, pcero, pe_a, pe_b: std_logic;
	ini_a, ini_b: std_logic;
	a, b: in st_dat;
	s: out st_dat;
	ig, meu: out std_logic);
end camino_mcd;

architecture estruc of camino_mcd is
signal mx_a, mx_b, reg_a, reg_b, t_s: st_dat;
signal t_ig, t_meu, t_not_meu: std_logic;

signal mx_ini_a, mx_ini_b: st_dat;

begin
	mxa: mux2 port map(d0 => mx_ini_b, d1 => t_s, SEL => t_not_meu, s => mx_a);
	
	mxini_a: mux2 port map(d0 => reg_a, d1 => a, SEL => ini_a, s => mx_ini_a);
	mxini_b: mux2 port map(d0 => reg_b, d1 => b, SEL => ini_b, s => mx_ini_b);
	
	rega: RD_N_pe port map(reloj => reloj, pcero => pcero, pe => pe_a, e => mx_a, s=> reg_a);
	regb: RD_N_pe port map(reloj => reloj, pcero => pcero, pe => pe_b, e => mx_ini_a, s=> reg_b);
	
	menor: menqu port map(L1 => mx_ini_a, L2 => mx_ini_b, meu => t_meu);
	t_not_meu <= not t_meu;
	
	sub: sumador port map(a=> mx_ini_a, b => mx_ini_b, s => t_s);
	
	igcero: igual_cero port map(L1 => mx_ini_b, ig => t_ig);
	
	--salidas
	s <= mx_ini_a;
	meu <= t_meu;
	ig <= t_ig;

end estruc;
