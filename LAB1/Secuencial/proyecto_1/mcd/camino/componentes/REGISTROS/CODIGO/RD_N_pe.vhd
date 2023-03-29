--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;
use work.param_disenyo_pkg.all;
use work.retardos_componentes_pkg.all;

entity RD_N_pe is							-- registro con inicializacion a cero asincrona
  port (reloj, pcero, pe: in std_logic;		-- pcero: senyal de inicializacion
         e: in st_dat;
         s: out st_dat);
end;

architecture comportamiento of RD_N_pe is
begin
	process (reloj, pcero) begin
		if pcero = '1' then 
			s <= (others => '0') after retREGDES;
		elsif rising_edge(reloj) then
			if pe = '1' then
				s <= e after retREGDES;
			end if;
		end if;
end process;

end;


