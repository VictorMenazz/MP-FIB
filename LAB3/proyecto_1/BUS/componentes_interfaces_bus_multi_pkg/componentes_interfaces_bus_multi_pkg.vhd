--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_pkg.all;
use work.interface_observador_pkg.all;

package componentes_interfaces_bus_multi_pkg is

component and_pet_control is 
port(conc: in	std_logic;
	en: in	tp_peticion_control;
	sal: out	tp_peticion_control);
end component;

component and_pet_info is 
port(conc: in	std_logic;			
	en	: in	tp_peticion_info;
	sal	: out	tp_peticion_info);
end component;

component interface_cache_bus_info is
port (reloj, pcero	: in  std_logic;
	arb_conc: std_logic;
	mpet_info_e: in  tp_peticion_info;
	mpet_info_bus: out  tp_peticion_info;
	mresp_info_bus: in tp_respuesta_info;
	mresp_info_s: out tp_respuesta_info);
end component;

component interface_cache_bus_control is
port (reloj, pcero: in  std_logic;
	arb_conc: std_logic;
	mpet_cntl_e: in  tp_peticion_control;
	mpet_cntl_bus: out  tp_peticion_control;
	mresp_cntl_bus: in tp_respuesta_control;
	mresp_cntl_s: out tp_respuesta_control);
end component;

component RD_observacion is
  port (reloj, pcero: in std_logic;	
         e: in tp_observacion;
         s: out tp_observacion);
end component;

component RD_pe_obser is	
  port (reloj, pcero, pe: in std_logic;	
         e: in tp_observacion;
         s: out tp_observacion);
end component;

component mux_obser is      
port (a, b: in  tp_observacion;
	sel: in std_logic;
	s: out tp_observacion);
end component;

component interface_observador is
	port (reloj, pcero	: in  std_logic;
		O_listo: in std_logic;
		pet_observacion_bus: in  tp_observacion;
		pet_observacion_s: out  tp_observacion);
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

end package componentes_interfaces_bus_multi_pkg;
