--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.interface_cache_bus_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RC_pet is							-- registro con inicializacion a cero asincrona
port (reloj, pcero: in std_logic;		-- pes: senyal de inicializacion
		e: in tp_peticion_control;
		s: out tp_peticion_control);
end;

architecture comportamiento of RC_pet is
begin
process (reloj, pcero)
begin
	if pcero = '1' then 
		s <= (mpet => '0', mles => '0') after retREGDES;
	elsif rising_edge(reloj) then
		s <= e after retREGDES;
	end if;
end process;
end;

