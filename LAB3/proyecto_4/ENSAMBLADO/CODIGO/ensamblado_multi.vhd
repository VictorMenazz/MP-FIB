--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_cache_multi_interface_pkg.all;
use work.componentes_memoria_interface_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.interface_observador_pkg.all;
use work.componentes_arbitro_pkg.all;
use work.multis_pkg.all;
use work.bus_multi_pkg.all;
use work.componentes_bus_multi_pkg.all;
--! @image html ENSAMBLADO.png 

entity ensamblado_multi is 										
	port(reloj, pcero: in  std_logic;
		arb_control: in st_arb_peticiones;
		pet_proc: in tp_peticiones_multi;
		pet_listo: out tp_cache_listo_multi;
		resp_cache: out tp_respuesta_multi);
end ensamblado_multi;


architecture estructural of ensamblado_multi is

signal mpet_cntl_bus: tp_peticion_control;
signal mresp_cntl_bus: tp_respuesta_control;

signal mpet_info_bus: tp_peticion_info;
signal mresp_info_bus: tp_respuesta_info;

signal mpet_cntl_bus_c: tp_bus_control;
signal mpet_info_bus_c: tp_bus_info;

signal arb_peticiones: st_arb_peticiones;
signal arb_concesiones: st_arb_concesiones;

signal obs_bus: tp_observacion;

begin
-- arbitro
arbitraje: arbitro port map (reloj => reloj, pcero => pcero, arb_control => arb_control, fin_trans => mresp_cntl_bus.m_val,
							arb_peticiones => arb_peticiones, arb_concesiones => arb_concesiones);

proc_multi: for i in 0 to Nproc-1 generate
-- cache con interfaces procesador y bus
cache: cache_multi_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										arb_peticion => arb_peticiones(i), arb_concesion => arb_concesiones(i), 
										pet_proc => pet_proc(i), pet_listo => pet_listo(i), 
										obs_bus => obs_bus,
										resp_cache => resp_cache(i), 
										mresp_cntl_bus => mresp_cntl_bus, mpet_cntl_bus => mpet_cntl_bus_c(i),
										mresp_info_bus => mresp_info_bus, mpet_info_bus => mpet_info_bus_c(i));
end generate;

-- interconexiones: bus
bus_mu: bus_multi port map (e_info => mpet_info_bus_c, e_cntl => mpet_cntl_bus_c, s_info => mpet_info_bus, s_cntl => mpet_cntl_bus);

obs_bus.dir <= mpet_info_bus.dir; 
obs_bus.pet <= mpet_cntl_bus.mpet; 
obs_bus.les <= mpet_cntl_bus.mles; 

-- memoria con interface al bus
memoria: mem_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										mpet_info_bus => mpet_info_bus, mresp_info_bus => mresp_info_bus, 
										mpet_cntl_bus => mpet_cntl_bus, mresp_cntl_bus => mresp_cntl_bus);
end;

