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
--! @image html sistema_unipro_observacion.png 

entity ensamblado_multi is 										
	port(reloj, pcero: in  std_logic;
		arb_control: in std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_cache: out tp_respuesta);
end ensamblado_multi;


architecture estructural of ensamblado_multi is

signal mpet_cntl_bus, mpet_cntl_bus_c: tp_peticion_control;
signal mresp_cntl_bus, mresp_cntl_bus_c: tp_respuesta_control;

signal mpet_info_bus, mpet_info_bus_c: tp_peticion_info;
signal mresp_info_bus, mresp_info_bus_c: tp_respuesta_info;

signal arb_peticion: std_logic;
signal arb_concesion: std_logic;
signal obs_bus: tp_observacion;


begin
--arbitro
arbitraje: arbitro port map (reloj => reloj, pcero => pcero, arb_control => arb_control, fin_trans => mresp_cntl_bus.m_val,
							arb_peticion => arb_peticion, arb_concesion => arb_concesion);

-- cache con interfaces procesador y bus
cache: cache_multi_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										arb_peticion => arb_peticion, arb_concesion => arb_concesion, 
										pet_proc => pet_proc, pet_listo => pet_listo, 
										obs_bus => obs_bus,
										resp_cache => resp_cache, 
										mresp_cntl_bus => mresp_cntl_bus_c, mpet_cntl_bus => mpet_cntl_bus_c,
										mresp_info_bus => mresp_info_bus_c, mpet_info_bus => mpet_info_bus_c);
-- interconexiones (bus)
mpet_cntl_bus <= mpet_cntl_bus_c;
mresp_cntl_bus_c <= mresp_cntl_bus;
mpet_info_bus <= mpet_info_bus_c;
mresp_info_bus_c <= mresp_info_bus;

obs_bus.dir <= mpet_info_bus.dir; 
obs_bus.pet <= mpet_cntl_bus.mpet; 
obs_bus.les <= mpet_cntl_bus.mles; 

-- memoria con interface al bus
memoria: mem_con_interface_bus port map (reloj => reloj, pcero => pcero, 
										mpet_info_bus => mpet_info_bus, mresp_info_bus => mresp_info_bus, 
										mpet_cntl_bus => mpet_cntl_bus, mresp_cntl_bus => mresp_cntl_bus);
end;
