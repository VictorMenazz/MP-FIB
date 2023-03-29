--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;

package componentes_camino_pkg is

component etiquetas is
port (reloj: in std_logic;
	Etiq_ent: in tp_Etiq_e;
	AF: out std_logic);
end component;

component m_EST is
port (reloj: in std_logic;
	M_e: in  tp_mest_e;
	DL: out st_estado);
end component;

component datos is
port (reloj: in  std_logic;
	Dat_ent: in  tp_Datos_e;
	DL: out st_palabra_dat);
end component;

end package componentes_camino_pkg;

