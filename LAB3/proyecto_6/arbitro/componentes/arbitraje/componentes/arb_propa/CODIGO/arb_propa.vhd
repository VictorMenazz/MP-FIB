--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.componentes_arb_prio_pkg.all;

entity arb_propa is 	
	generic(n: natural:=4);									
	port(peticiones: in std_logic_vector(n-1 downto 0);
		prioridades: in std_logic_vector(n-1 downto 0);
		concesiones: out std_logic_vector(n-1 downto 0));
end arb_propa;

architecture estructural of arb_propa is
signal propconc: std_logic_vector(n downto 0);
begin


prime:	celda_prio port map(peticion => peticiones(0), prioridad => prioridades(0), proconc_e => propconc(n), proconc_s => propconc(1), concesion => concesiones(0));
genera:	for i in 1 to n-1 generate
ele:		celda_prio port map(peticion => peticiones(i), prioridad => prioridades(i), proconc_e => propconc(i), proconc_s => propconc(i+1), concesion => concesiones(i));
		end generate genera;

end;
