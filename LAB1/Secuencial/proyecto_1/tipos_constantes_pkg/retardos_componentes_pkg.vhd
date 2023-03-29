--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package retardos_componentes_pkg is

constant retMUX2: time := 2 ns;
constant retREGDES: time := 2 ns;
constant retcero: time := 1 ns;
constant retmenor: time := 4 ns;
constant retsumador: time := 4 ns;

constant retardo_estado: time := 1 ns;
constant retardo_logica_estado: time := 1 ns;
constant retardo_logica_salida: time := 1 ns;

end package retardos_componentes_pkg;
