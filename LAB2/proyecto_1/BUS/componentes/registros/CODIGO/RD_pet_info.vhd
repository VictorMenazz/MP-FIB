--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.interface_cache_bus_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RD_pet_info is							-- registro con inicializacion a cero asincrona
  port (reloj, pcero: in std_logic;		-- pcero: senyal de inicializacion
         e: in tp_peticion_info;
         s: out tp_peticion_info);
end;

architecture comportamiento of RD_pet_info is
begin
process (reloj, pcero) 
begin
	if pcero = '1' then 
		s <= (acc => '0', dir => (others => '0'), dato_E => (others => '0')) after retREGDES;
	elsif rising_edge(reloj) then
		s <= e after retREGDES;
	end if;
end process;
end;

