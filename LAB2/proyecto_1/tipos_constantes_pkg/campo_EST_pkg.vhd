--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package campo_EST_pkg is

type tp_mest_e is record
    acc: std_logic;
    dir: st_dir_conjunto;
    esc: std_logic;
    DE: st_estado;
end record;

end package campo_EST_pkg;

