--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.retardos_RegDes_pkg.all;

entity RD_1_arbi is							-- registro con puesta a cero asincrona
  port (reloj, pcero: in std_logic;		-- pcero: senyal de puesta a cero
         e: in std_logic;
         s: out std_logic);
end;

architecture comportamiento of RD_1_arbi is
  begin
process (reloj, pcero) begin
	if pcero = '1' then
		s <= '0' after retREGDES;
	elsif rising_edge(reloj) then
		s <= e after retREGDES;
	end if;
end process;
end;

