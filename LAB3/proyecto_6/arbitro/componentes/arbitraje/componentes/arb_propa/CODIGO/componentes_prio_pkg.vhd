--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package componentes_arb_prio_pkg is

component celda_prio is 							
	port(peticion: in std_logic;
		prioridad: in std_logic;
		proconc_e: in std_logic;
		proconc_s: out std_logic;
		concesion: out std_logic);
end component;

end package componentes_arb_prio_pkg;
