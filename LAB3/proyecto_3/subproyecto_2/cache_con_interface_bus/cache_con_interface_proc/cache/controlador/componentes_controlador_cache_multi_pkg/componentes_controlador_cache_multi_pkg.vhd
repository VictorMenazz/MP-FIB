--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_pkg.all;
use work.controlador_pkg.all;

package componentes_controlador_cache_multi_pkg is

component controlador is
port (reloj, pcero: in std_logic;
		arb_pet: out std_logic;
		arb_conc: in std_logic;
		trans_bus: out std_logic;
		observacion: in std_logic;
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end component;

component observador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_Obs_e;
		s_estado: in tp_contro_cam_estado;
		trans_bus: in std_logic;
		observacion: out std_logic;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_Obs_s);
end component;

end package componentes_controlador_cache_multi_pkg;
