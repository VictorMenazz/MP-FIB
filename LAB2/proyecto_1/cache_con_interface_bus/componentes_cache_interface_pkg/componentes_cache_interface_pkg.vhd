--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_pkg.all;

package componentes_cache_interface_pkg is

component cache_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_cache: out tp_respuesta;
		mresp_cntl_bus: in tp_respuesta_control;
		mpet_cntl_bus: out tp_peticion_control;
		mresp_info_bus: in tp_respuesta_info;
		mpet_info_bus: out tp_peticion_info);
end component;


end package componentes_cache_interface_pkg;
