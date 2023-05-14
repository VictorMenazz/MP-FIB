--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.multis_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.bus_multi_pkg.all;
use work.retardos_bus_pkg.all;
--! @image html bus_multi.png 

entity bus_multi is
port (e_info: in tp_bus_info;
	e_cntl: in tp_bus_control;
	s_info: out tp_peticion_info;
	s_cntl: out tp_peticion_control);
end bus_multi;

architecture comportamiento of bus_multi is

signal t_bus_info: tp_bus_info;
signal t_bus_control: tp_bus_control;
begin

-- operacion "or" de las senyales de informacion
t_bus_info(0) <= e_info(0);
or_bus_info: for i in 1  to Nproc-1 generate
begin
	t_bus_info(i).acc <= e_info(i).acc or t_bus_info(i-1).acc after ret_bus;
	t_bus_info(i).dir <= e_info(i).dir or t_bus_info(i-1).dir after ret_bus;
	t_bus_info(i).dato_E <= e_info(i).dato_E or t_bus_info(i-1).dato_E after ret_bus;
end generate;
-- salida senyales de informacion
s_info <= t_bus_info(Nproc-1);

-- operacion "or" de las senyales de control
t_bus_control(0) <= e_cntl(0);
or_bus_cntl: for i in 1  to Nproc-1 generate
begin
	t_bus_control(i).mpet <= e_cntl(i).mpet or t_bus_control(i-1).mpet after ret_bus;
	t_bus_control(i).mles <= e_cntl(i).mles or t_bus_control(i-1).mles after ret_bus;
end generate;
-- salida senyales de control
s_cntl <= t_bus_control(Nproc-1);

end;
