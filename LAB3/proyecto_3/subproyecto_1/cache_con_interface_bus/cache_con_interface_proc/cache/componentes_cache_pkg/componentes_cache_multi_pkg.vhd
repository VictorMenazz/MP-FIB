--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.controlador_Obs_pkg.all;
use work.cache_pkg.all;

package componentes_cache_multi_pkg is

component camino_datos is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	dir_proc: in st_dir;
	cami_s: out tp_camino_s);
end component;

component controlador_multi is
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
end component;

component mux_dat is      
port (a, b: in  st_palabra_dat;
	sel: in std_logic;
	s: out st_palabra_dat);
end component;

component mux_dir is      
port (a, b: in  st_dir;
	sel: in std_logic;
	s: out st_dir);
end component;

end package componentes_cache_multi_pkg;

