--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_pkg.all;
use work.controlador_pkg.all;
use work.componentes_controlador_cache_multi_pkg.all;
--! @image html control_desacoplar.png 

entity controlador_multi is
port (reloj, pcero: in std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		pet: in tp_contro_e;
		pet_bus: in tp_contro_Obs_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		mxO: out std_logic;
		resp: out tp_contro_s;
		resp_O: out tp_contro_Obs_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;

architecture estruc of controlador_multi is
signal cntl: std_logic;
signal s_control_P, s_control_O: tp_contro_cam_cntl;
signal t_resp_O: tp_contro_Obs_s;

signal observacion:std_logic;

signal trans_bus: std_logic;
begin





end;

