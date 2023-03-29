--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;

package componentes_mcd_pkg is

component camino_mcd is
   port (reloj, pcero, pe: std_logic;
	ini: std_logic;
	a, b: in st_dat;
	s: out st_dat;
	ig: out std_logic);
end component;

component control is
port (reloj, pcero: in std_logic;
	op_dis: in std_logic;
	consumo: in std_logic;
	igualcero: in std_logic;
	mxa, pe: out std_logic;
	finalizada: out std_logic;
	desocupada: out std_logic);
end component;

component mcd is
   port (reloj, pcero: std_logic;
	a, b: in st_dat;
	op_dis: in std_logic;
	consumo: in std_logic;
	finalizada: out std_logic;
	desocupada: out std_logic;
	s: out st_dat);
end component;

end package componentes_mcd_pkg;
