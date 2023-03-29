--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.campo_ET_pkg.all;
use work.componentes_etiq_pkg.all;
--! @image html ET.png 

entity etiquetas is
port (reloj: in std_logic;
	Etiq_ent: in tp_Etiq_e;
	AF: out std_logic);
end etiquetas;

architecture estruc of etiquetas is  
signal M_e: tp_metq_e;
signal DL: st_etiqueta;
signal etiqueta_val: st_etiqueta;
signal conjunto: st_dir_conjunto;
  
begin

etiqueta_val <= Etiq_ent.dirB(bitMAS_et-1 downto bitMEN_et);
conjunto <= Etiq_ent.dirB(bitMAS_cj-1 downto bitMEN_cj);

--interconexion
M_e <= (acc => Etiq_ent.acc, dir => conjunto,
                esc => Etiq_ent.esc, DE => etiqueta_val);

--campo etiquetas
ET_Mem : m_ET port map(reloj => reloj, M_e => M_e, DL => DL);

-- comparacion de etiquetas
AF <= '1' when (DL = etiqueta_val) else '0'; 
end estruc;




