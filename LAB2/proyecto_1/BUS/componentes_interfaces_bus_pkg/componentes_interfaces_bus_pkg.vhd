--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_pkg.all;

package componentes_interfaces_bus_pkg is

component RC_resp is			
  port (reloj, pcero: in std_logic;	
         e: in tp_respuesta_control;
         s: out tp_respuesta_control);
end component;

component RC_pet is						
  port (reloj, pcero: in std_logic;	
         e: in tp_peticion_control;
         s: out tp_peticion_control);
end component;

component RD_pet_info is	
  port (reloj, pcero: in std_logic;	
         e: in tp_peticion_info;
         s: out tp_peticion_info);
end component;

component RD_resp_info is		
  port (reloj, pcero: in std_logic;
         e: in tp_respuesta_info;
         s: out tp_respuesta_info);
end component;

component interface_cache_bus_info is
	port (reloj, pcero	: in  std_logic;
		mpet_info_e: in  tp_peticion_info;
		mpet_info_bus: out  tp_peticion_info;
		mresp_info_bus: in tp_respuesta_info;
		mresp_info_s: out tp_respuesta_info);
end component;

component interface_cache_bus_control is
	port (reloj, pcero: in  std_logic;
		mpet_cntl_e: in  tp_peticion_control;
		mpet_cntl_bus: out  tp_peticion_control;
		mresp_cntl_bus: in tp_respuesta_control;
		mresp_cntl_s: out tp_respuesta_control);
end component;

component interface_mem_bus_control is
	port (reloj, pcero	: in  std_logic;
		mpet_cntl_bus: in  tp_peticion_control;
		mpet_cntl_s: out  tp_peticion_control;
		mresp_cntl_e: in tp_respuesta_control;
		mresp_cntl_bus: out tp_respuesta_control);
end component;

component interface_mem_bus_info is
	port (reloj, pcero	: in  std_logic;
		mpet_info_bus: in  tp_peticion_info;
		mpet_info_s: out  tp_peticion_info;
		mresp_info_e: in tp_respuesta_info;
		mresp_info_bus: out tp_respuesta_info);
end component;

end package componentes_interfaces_bus_pkg;
