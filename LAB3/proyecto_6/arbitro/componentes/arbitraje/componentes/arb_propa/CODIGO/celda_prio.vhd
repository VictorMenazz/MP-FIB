--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

entity celda_prio is 							
	port(peticion: in std_logic;
		prioridad: in std_logic;
		proconc_e: in std_logic;
		proconc_s: out std_logic;
		concesion: out std_logic);
end celda_prio;

architecture funcional of celda_prio is
begin

proconc_s <= (not peticion) and (proconc_e or prioridad);
concesion <= peticion and (proconc_e or prioridad);

end;
