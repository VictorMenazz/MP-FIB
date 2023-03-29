--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.cache_pkg.all;

package componentes_cache_pkg is

component camino_datos is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	cami_s: out tp_camino_s);
end component;

component controlador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end component;

component mux_dat is      
port (a, b: in  st_palabra_dat;
	sel: in std_logic;
	s: out st_palabra_dat);
end component;

end package componentes_cache_pkg;

