--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package retardos_memorias_pkg is

constant ret_etiq_esc: time := 2 ns;
constant ret_etiq_leer: time := 3 ns;
constant ret_deco_etiq: time := 2 ns;

constant ret_dat_esc: time := 2 ns;
constant ret_dat_leer: time := 3 ns;
constant ret_deco_dat: time := 2 ns;

constant ret_estado_esc: time := 1 ns;
constant ret_estado_leer: time := 1 ns;
constant ret_deco_estado: time := 1 ns;

constant ret_mem: time := 8 ns;
constant ret_deco_mem: time := 3 ns;
constant retcnt_mem: time := 1 ns;

end package retardos_memorias_pkg;
