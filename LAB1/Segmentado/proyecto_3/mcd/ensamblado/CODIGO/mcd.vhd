--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
use work.componentes_mcd_pkg.all;

entity mcd is
   port (reloj, pcero: std_logic;
	a, b: in st_dat;
	op_dis: in std_logic;
	consumo: in std_logic;
	finalizada: out std_logic;
	desocupada: out std_logic;
	s: out st_dat);
end mcd;

architecture estruc of mcd is
signal ig, menor: std_logic;
signal ini_a, ini_b, pe_a, pe_b: std_logic;

begin

cam: camino_mcd port map (reloj => reloj, pcero => pcero, pe_a => pe_a, pe_b => pe_b, ini_a => ini_a, ini_b => ini_b, 
						a => a, b => b, s => s, ig => ig, meu => menor); 

cnt: control port map (reloj => reloj, pcero => pcero, op_dis => op_dis, consumo => consumo,
						igualcero => ig, menor => menor, ini_a => ini_a, ini_b => ini_b, pe_a => pe_a, pe_b => pe_b, 
						finalizada => finalizada, desocupada => desocupada);
end;

