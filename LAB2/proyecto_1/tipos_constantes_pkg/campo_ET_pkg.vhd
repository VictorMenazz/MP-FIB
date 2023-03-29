--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package campo_ET_pkg is

type tp_metq_e is record
    acc: std_logic;
    dir: st_dir_conjunto;
    esc: std_logic;
    DE: st_etiqueta;
  end record;

type tp_Etiq_e is record
	acc: std_logic;
	dirB: st_dir_bloque;
    esc : std_logic;
end record;

subtype AF is std_logic;

end package campo_ET_pkg;

