--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.multis_pkg.all;

package componentes_arbitraje_pkg is

component RD_1_arbi is							-- registro con puesta a cero asincrona
  port (reloj, pcero: in std_logic;		-- pcero: senyal de puesta a cero
         e: in std_logic;
         s: out std_logic);
end component;

component RD_arbi is							-- registro con puesta a cero asincrona
  port (reloj, pcero: in std_logic;		
         e: in st_arb_concesiones;
         s: out st_arb_concesiones);
end component;

component arbitraje is						
port (reloj, pcero: std_logic;
--arb: st_arb_peticiones;	
	peticiones: in st_arb_peticiones;
	concesiones: out st_arb_concesiones);
end component;

end package componentes_arbitraje_pkg;
