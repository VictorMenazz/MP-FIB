--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package componentes_arb_circular_pkg is

component arb_propa is 	
	generic(n: natural:=4);									
	port(peticiones: in std_logic_vector(n-1 downto 0);
		prioridades: in std_logic_vector(n-1 downto 0);
		concesiones: out std_logic_vector(n-1 downto 0));
end component;

component RD_arbi_0 is							-- registro con puesta a cero asincrona
  port (reloj, pini, pe: in std_logic;		-- pini: senyal de puesta a cero
         e: in std_logic;
         s: out std_logic);
end component;

component RD_arbi_1 is							-- registro con puesta a uno asincrona
  port (reloj, pini, pe: in std_logic;		-- pini: senyal de puesta a uno
         e: in std_logic;
         s: out std_logic);
end component;

end package componentes_arb_circular_pkg;
