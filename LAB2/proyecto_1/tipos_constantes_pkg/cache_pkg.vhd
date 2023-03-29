--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package cache_pkg is

type tp_peticion is record
	acc: std_logic;
	dir: st_dir;
    esc : std_logic;
	ini: std_logic;
	DE: st_palabra_dat; 
end record;

type tp_respuesta is record
	DL: st_palabra_dat; 
	val: std_logic;
end record;

subtype st_cache_listo is std_logic;

end package cache_pkg;
 
