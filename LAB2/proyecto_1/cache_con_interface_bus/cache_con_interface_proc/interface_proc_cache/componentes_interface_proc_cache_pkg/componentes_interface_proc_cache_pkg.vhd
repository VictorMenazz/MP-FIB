--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.cache_pkg.all;

package componentes_interface_proc_cache_pkg is

component mux_pet is      
port (a, b: in  tp_peticion;
	sel: in std_logic;
	s: out tp_peticion);
end component;

component registro_pet is   
port (reloj, pe: in  std_logic;
	e: in  tp_peticion;
	s: out tp_peticion);
end component;


end package componentes_interface_proc_cache_pkg;

