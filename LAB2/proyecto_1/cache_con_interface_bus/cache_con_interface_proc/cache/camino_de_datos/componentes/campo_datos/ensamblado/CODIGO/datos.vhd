--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;
use work.componentes_datos_pkg.all;
--! @image html DAT.png 

entity datos is
port (reloj: in  std_logic;
	Dat_ent: in  tp_Datos_e;
	DL: out st_palabra_dat);
end datos;

architecture estruc of datos is
signal M_e: tp_mdat_e;

begin
--interconexion
M_e <= (acc => Dat_ent.acc, dir => Dat_ent.dir,
                esc => Dat_ent.esc, DE => Dat_ent.DE);
--campo datos
DAT_Mem : m_DAT port map(reloj => reloj, M_e => M_e, DL => DL);

end estruc;


