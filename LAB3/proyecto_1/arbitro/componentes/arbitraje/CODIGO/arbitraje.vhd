--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.multis_pkg.all;
use work.retardos_arbitro_pkg.all;

entity arbitraje is						
port (arb: st_arb_peticion;	
	peticion: in st_arb_peticion;
	concesion: out st_arb_concesion);
end arbitraje;

architecture estruc of arbitraje is
begin

concesion <= peticion and arb after ret_arb;


end;
