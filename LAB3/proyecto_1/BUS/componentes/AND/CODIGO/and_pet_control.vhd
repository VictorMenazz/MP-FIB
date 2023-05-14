--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_pkg.all;
use work.retardos_inter_proc_cache_pkg.all;

entity and_pet_control is 
port(conc: in	std_logic;   -- concesion
	en: in tp_peticion_control;
	sal: out tp_peticion_control);
end and_pet_control;

architecture compor of and_pet_control is

begin
	sal.mpet <= en.mpet after retAND when conc = '1' else '0' after retAND;
	sal.mles <= en.mles after retAND when conc = '1' else '0' after retAND;
end compor;
