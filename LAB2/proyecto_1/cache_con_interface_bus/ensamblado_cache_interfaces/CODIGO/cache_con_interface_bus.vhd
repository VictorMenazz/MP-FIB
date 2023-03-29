--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.cache_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
use work.componentes_cache_con_inter_proc_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.controlador_pkg.all;
use work.cache_con_interface_proc_pkg.all;
--! @image html cache_interfa_bus.png 

entity cache_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_cache: out tp_respuesta;
		mresp_cntl_bus: in tp_respuesta_control;
		mpet_cntl_bus: out tp_peticion_control;
		mresp_info_bus: in tp_respuesta_info;
		mpet_info_bus: out tp_peticion_info);
end cache_con_interface_bus;


architecture estructural of cache_con_interface_bus is

signal mdato: st_elem_dat;
signal resp_m: tp_cntl_memoria_e;

signal pet_m: tp_peticion_mem;
signal mpet_cntl_e: tp_peticion_control;
signal mresp_cntl_s: tp_respuesta_control;
signal mpet_info_e: tp_peticion_info;
signal mresp_info_s: tp_respuesta_info;

begin
-- interconexión
mpet_cntl_e <= (mpet => pet_m.m_pet,
				mles => pet_m.m_esc);

resp_m <= (m_val => mresp_cntl_s.m_val);

mpet_info_e <= (acc => '0',
				dir => pet_m.m_dir,
				dato_E => pet_m.m_DE);

mdato <= mresp_info_s.mdato_bus;

-- cache con interfaces con el procesador 
cach: cache_con_inter_proc port map(reloj => reloj, pcero => pcero, pet_proc => pet_proc, pet_listo => pet_listo,
									mdato => mdato, resp_cache => resp_cache, resp_m => resp_m, pet_m => pet_m); 

-- interface con el bus: informacion
inter_Pr_BUS_IN: interface_cache_bus_info port map (reloj => reloj, pcero => pcero,
												mpet_info_e => mpet_info_e, mpet_info_bus => mpet_info_bus, 
												mresp_info_bus => mresp_info_bus, mresp_info_s => mresp_info_s);

-- interface con el bus: control
inter_Pr_BUS_CON: interface_cache_bus_control port map (reloj => reloj, pcero => pcero, 
												mpet_cntl_e => mpet_cntl_e, mpet_cntl_bus => mpet_cntl_bus, 
												mresp_cntl_bus => mresp_cntl_bus, mresp_cntl_s => mresp_cntl_s);
end;



