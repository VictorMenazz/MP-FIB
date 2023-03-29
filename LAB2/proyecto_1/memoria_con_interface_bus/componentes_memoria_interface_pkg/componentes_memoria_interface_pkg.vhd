--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.interface_cache_bus_pkg.all;

package componentes_memoria_interface_pkg is

component mem_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		mpet_info_bus: in tp_peticion_info;
		mresp_info_bus: out tp_respuesta_info;
		mpet_cntl_bus: in tp_peticion_control;
		mresp_cntl_bus: out tp_respuesta_control);
end component;

end package componentes_memoria_interface_pkg;
