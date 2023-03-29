--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;

package componentes_etiq_pkg is

component m_ET is
port (reloj: in std_logic;
	M_e: in  tp_metq_e;
	DL: out st_etiqueta);
end component;

component registro_etiq is   
port (reloj, pe: in  std_logic;
	e: in  st_etiqueta;
	s: out st_etiqueta);
end component;

end package componentes_etiq_pkg;
