--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_mcd_pkg.all;
--! @image html camino_auto.png 

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
signal ig: std_logic;
signal ini, pe: std_logic;

begin

cam: camino_mcd port map (reloj => reloj, pcero => pcero, pe => pe, ini => ini,
						a => a, b => b, s => s, ig => ig);
cnt: control port map (reloj => reloj, pcero => pcero, op_dis => op_dis, consumo => consumo,
						igualcero => ig, mxa => ini, pe => pe, finalizada => finalizada,
						desocupada => desocupada);

end;

