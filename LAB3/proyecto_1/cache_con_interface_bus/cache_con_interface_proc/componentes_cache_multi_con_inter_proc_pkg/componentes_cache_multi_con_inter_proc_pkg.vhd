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
use work.interface_observador_pkg.all;
use work.cache_pkg.all;

package componentes_cache_multi_con_inter_proc_pkg is

component interface_proc_cache is
	port (reloj, pcero	: in  std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		peticion: out tp_peticion;
		pet_cache_listo: in st_cache_listo);
end component;

component interface_cache_proc is
	port (respuesta: in tp_respuesta;
		resp_cache: out tp_respuesta);
end component;

component cache_multi is
port (reloj, pcero: in std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		peticion: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_O: out tp_contro_Obs_s;
		mdato: in st_elem_dat;
		obs_bus: in tp_observacion;
		respuesta: out tp_respuesta;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end component;

end package componentes_cache_multi_con_inter_proc_pkg;

