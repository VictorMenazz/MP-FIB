--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.interface_cache_bus_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
--! @image html interface_mem_bus_control.png 

entity interface_mem_bus_control is
	port (reloj, pcero	: in  std_logic;
		mpet_cntl_bus: in  tp_peticion_control;
		mpet_cntl_s: out  tp_peticion_control;
		mresp_cntl_e: in tp_respuesta_control;
		mresp_cntl_bus: out tp_respuesta_control);
end interface_mem_bus_control;

architecture estruc of interface_mem_bus_control is

begin
-- interface de peticion: control
reg_mpet_cntl: RC_pet port map(reloj => reloj, pcero => pcero, e => mpet_cntl_bus, s => mpet_cntl_s);

-- interface de respuesta: control
reg_mresp_cntl: RC_resp port map(reloj => reloj, pcero => pcero, e => mresp_cntl_e, s => mresp_cntl_bus);

end;

