--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package param_memorias_pkg is

-- campos cache
subtype st_indice is natural range 0 to num_conjuntos - 1;
type tp_ET_mem is array (st_indice) of st_etiqueta;

type tp_DAT_mem is array (st_indice) of st_elem_dat;

type tp_EST_mem is array (st_indice) of st_estado;

-- memoria
type RAM_mem is array(0 to tam_ELogico - 1) of st_elem_dat; 

end package param_memorias_pkg;

