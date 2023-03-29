--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
use work.componentes_memoria_pkg.all;
--! @image html mem_inter_bus.png 

entity mem_con_interface_bus is 										
	port(reloj, pcero: in  std_logic;
		mpet_info_bus: in tp_peticion_info;
		mresp_info_bus: out tp_respuesta_info;
		mpet_cntl_bus: in tp_peticion_control;
		mresp_cntl_bus: out tp_respuesta_control);
end mem_con_interface_bus;


architecture estructural of mem_con_interface_bus is

signal mpet_info_s: tp_peticion_info;
signal mresp_info_e: tp_respuesta_info;
signal mpet_cntl_s: tp_peticion_control;
signal mresp_cntl_e: tp_respuesta_control;

signal LD, ED_mem: st_elem_dat;
signal dir_mem: st_dir;
signal MVAL_mem, MPET_mem, MLES_mem: std_logic;

begin
-- interface con el bus: informacion
inter_Mem_BUS_IN: interface_mem_bus_info port map(reloj => reloj, pcero => pcero, 
												mpet_info_bus => mpet_info_bus, mpet_info_s => mpet_info_s, 
												mresp_info_e => mresp_info_e, mresp_info_bus => mresp_info_bus);
-- interconexiones
dir_mem <= mpet_info_s.dir;
ED_mem <= mpet_info_s.dato_E;
mresp_info_e.mdato_bus <= LD;

-- interface con el bus: informacion
inter_Mem_BUS_CON: interface_mem_bus_control port map (reloj => reloj, pcero => pcero, 
												mpet_cntl_bus => mpet_cntl_bus, mpet_cntl_s => mpet_cntl_s, 
												mresp_cntl_e => mresp_cntl_e, mresp_cntl_bus => mresp_cntl_bus);
-- interconexiones
MPET_mem <= mpet_cntl_s.mpet;
MLES_mem <= mpet_cntl_s.mles;
mresp_cntl_e.m_val <= MVAL_mem;

-- memoria
memoria: ensamblado_memoria port map (reloj => reloj, ED => ED_mem, dir => dir_mem, MPET => MPET_mem, MLES => MLES_mem, MVAL => MVAL_mem, LD => LD);

end;

