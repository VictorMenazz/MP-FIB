--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package camino_dat_pkg is

type tp_camino_e is record
	etiq_acc: std_logic;
	dirB: st_dir_bloque;
    etiq_esc : std_logic;

    est_acc: std_logic;
    est_esc: std_logic;
    est_DE: st_estado;

    dat_acc: std_logic;
    dat_esc: std_logic;
    dat_DE: st_palabra_dat;
end record;

type tp_camino_s is record
	cam_DL: st_palabra_dat;
    cam_AF : std_logic;
    cam_EST : st_estado;
end record;

end package camino_dat_pkg;


