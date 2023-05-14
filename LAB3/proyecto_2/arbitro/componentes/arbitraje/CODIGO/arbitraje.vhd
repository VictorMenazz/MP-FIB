--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.multis_pkg.all;
use work.retardos_arbitro_pkg.all;
--! @image html arbitraje.png 

entity arbitraje is						
port (arb: st_arb_peticiones;	
	peticiones: in st_arb_peticiones;
	concesiones: out st_arb_concesiones);
end arbitraje;

architecture estruc of arbitraje is
begin
g_arb: for i in 0 to Nproc-1 generate
begin
   concesiones(i) <= peticiones(i) and arb(i) after ret_arb;
end generate;

end;
