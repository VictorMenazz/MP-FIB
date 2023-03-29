--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;

package interface_pkg is

type posterior_2 is record
	dat_a: st_dat;
	dat_b: st_dat;
	val: std_logic;
end record posterior_2;

type posterior_1 is record
	dat: st_dat;
	val: std_logic;
end record posterior_1;

type anterior is record --atras
	listo: std_logic;
end record anterior;

end package interface_pkg;

