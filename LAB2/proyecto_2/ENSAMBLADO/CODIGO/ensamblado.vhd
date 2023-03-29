--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_cache_interface_pkg.all;
use work.componentes_memoria_interface_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_pkg.all;
--! @image html ENSAMBLADO.png 

entity ensamblado is 										
	port(reloj, pcero: in  std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_cache: out tp_respuesta);
end ensamblado;


architecture estructural of ensamblado is

signal mpet_cntl_bus, mpet_cntl_bus_c: tp_peticion_control;
signal mresp_cntl_bus, mresp_cntl_bus_c: tp_respuesta_control;

signal mpet_info_bus, mpet_info_bus_c: tp_peticion_info;
signal mresp_info_bus, mresp_info_bus_c: tp_respuesta_info;

begin

-- cache con interfaces procesador y bus
cache: cache_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										pet_proc => pet_proc, pet_listo => pet_listo, resp_cache => resp_cache, 
										mresp_cntl_bus => mresp_cntl_bus_c, mpet_cntl_bus => mpet_cntl_bus_c,
										mresp_info_bus => mresp_info_bus_c, mpet_info_bus => mpet_info_bus_c);
-- interconexiones
mpet_cntl_bus <= mpet_cntl_bus_c;
mresp_cntl_bus_c <= mresp_cntl_bus;
mpet_info_bus <= mpet_info_bus_c;
mresp_info_bus_c <= mresp_info_bus;

-- memoria con interface al bus
memoria: mem_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										mpet_info_bus => mpet_info_bus, mresp_info_bus => mresp_info_bus, 
										mpet_cntl_bus => mpet_cntl_bus, mresp_cntl_bus => mresp_cntl_bus);
end;
