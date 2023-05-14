--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.interface_cache_bus_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
--! @image html interface_mem_bus_info.png 

entity interface_mem_bus_info is
	port (reloj, pcero	: in  std_logic;
		mpet_info_bus: in  tp_peticion_info;
		mpet_info_s: out  tp_peticion_info;
		mresp_info_e: in tp_respuesta_info;
		mresp_info_bus: out tp_respuesta_info);
end interface_mem_bus_info;

architecture estruc of interface_mem_bus_info is

begin
-- interface de peticion: informacion
reg_mpet_info: RD_pet_info port map(reloj => reloj, pcero => pcero, e => mpet_info_bus, s => mpet_info_s);

-- interface de respuesta: informacion
reg_mresp_mdato: RD_resp_info port map(reloj => reloj, pcero => pcero, e => mresp_info_e, s => mresp_info_bus);

end;

