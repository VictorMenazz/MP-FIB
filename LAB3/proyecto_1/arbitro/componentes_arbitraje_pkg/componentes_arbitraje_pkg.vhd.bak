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

component arbitraje is						
port (arb: st_arb_peticion;	
	peticion: in st_arb_peticion;
	concesion: out st_arb_concesion);
end component;

end package componentes_arbitraje_pkg;
