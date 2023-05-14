--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package interface_observador_pkg is

type tp_observacion is record
	dir: st_dir;
	pet: std_logic;
	les: std_logic;
end record;

end package interface_observador_pkg;
