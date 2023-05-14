--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.multis_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RD_arbi is							-- registro con puesta a cero asincrona
  port (reloj, pcero: in std_logic;		
         e: in st_arb_concesiones;
         s: out st_arb_concesiones);
end;

architecture comportamiento of RD_arbi is
  begin
process (reloj, pcero) begin
	if pcero = '1' then
		s <= (others => '0') after retREGDES;
	elsif rising_edge(reloj) then
		s <= e after retREGDES;
	end if;
end process;
end;

