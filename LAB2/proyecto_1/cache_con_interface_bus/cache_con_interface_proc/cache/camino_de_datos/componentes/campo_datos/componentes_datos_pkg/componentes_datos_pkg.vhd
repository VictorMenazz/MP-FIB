--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;

package componentes_datos_pkg is

component m_DAT is
port (reloj: in  std_logic;
	M_e: in  tp_mdat_e;
	DL: out st_elem_dat);
end component;

end package componentes_datos_pkg;
