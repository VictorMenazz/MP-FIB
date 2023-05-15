--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.componentes_camino_pkg.all;
use work.camino_dat_pkg.all;
use work.campo_ET_pkg.all;
use work.campo_EST_pkg.all;
use work.campo_DAT_pkg.all;
--! @image html camino_datos.png 
--! @image html componentes_camino.png 

entity camino_datos is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	cami_s: out tp_camino_s);
end camino_datos;

architecture estructural of camino_datos is

signal Etiq_ent: tp_Etiq_e;
signal AF: std_logic;

signal DAT_e: tp_Datos_e; 
signal DL: st_palabra_dat;

signal EST_e: tp_mest_e;
signal EST: st_estado;

begin

-- interconexión
Etiq_ent <= (acc => cami_e.etiq_acc,
			dirB => cami_e.dirB,
			esc => cami_e.etiq_esc);

DAT_e <= (acc => cami_e.dat_acc,
		dir => cami_e.dirB(dir_bloque_bits-etiq_bits-1 downto dir_bloque_bits-etiq_bits-indice_bits), --conjunto
		esc => cami_e.dat_esc, 
		DE => cami_e.dat_DE);

EST_e <= (acc => cami_e.est_acc,
		dir => cami_e.dirB(dir_bloque_bits-etiq_bits-1 downto dir_bloque_bits-etiq_bits-indice_bits), --conjunto
		esc => cami_e.est_esc, 
		DE => cami_e.est_DE);

-- componentes 
etiq: Etiquetas port map(reloj => reloj, Etiq_ent => Etiq_ent, AF => AF);

estado: m_EST port map(reloj => reloj, M_e => EST_e, DL => EST);

datos_ca: datos port map(reloj => reloj, Dat_ent => DAT_e, DL => DL);

-- interconexión
cami_s.cam_AF <= AF; 
cami_s.cam_DL <= DL;
cami_s.cam_EST <= EST;
 
end estructural;
