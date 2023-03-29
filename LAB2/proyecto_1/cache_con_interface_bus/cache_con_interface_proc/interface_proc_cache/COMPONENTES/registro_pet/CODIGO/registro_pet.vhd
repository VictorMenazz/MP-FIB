--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cache_pkg.all;
use work.retardos_otros_pkg.all;

entity registro_pet is   
port (reloj, pe: in  std_logic;
	e: in  tp_peticion;
	s: out tp_peticion);
end registro_pet;

architecture compor of registro_pet is  
begin

process(reloj)
begin
	if (rising_edge(reloj)) then
		if pe = '1' then
			s <= e after ret_reg_pet;
		end if;
	end if;
end process;
end compor;


