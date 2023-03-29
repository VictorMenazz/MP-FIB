--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.componentes_cache_pkg.all;
use work.cache_pkg.all;
--! @image html cache.png 

entity cache is
port (reloj, pcero: in std_logic;
		peticion: in tp_peticion;
		pet_listo: out st_cache_listo;
		mdato: in st_elem_dat;
		respuesta: out tp_respuesta;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture estruc of cache is


begin 



end;


