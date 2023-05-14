--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.cache_pkg.all;

package multis_pkg is

-- Numero de procesadores
constant Nproc: natural:= 2;

subtype st_arb_peticion is std_logic;
subtype st_arb_concesion is std_logic;

subtype st_arb_peticiones is std_logic_vector(0 to Nproc-1); 
subtype st_arb_concesiones is std_logic_vector(0 to Nproc-1); 

subtype st_indice is natural range 0 to Nproc - 1;

type tp_peticiones_multi is array (st_indice) of tp_peticion;
type tp_respuesta_multi is array (st_indice) of tp_respuesta;

type tp_cache_listo_multi is array (st_indice) of st_cache_listo;

end package multis_pkg;
