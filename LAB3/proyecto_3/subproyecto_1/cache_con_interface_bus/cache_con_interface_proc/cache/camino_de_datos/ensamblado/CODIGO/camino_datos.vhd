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
--! @image html camino_desacoplar.png 

entity camino_datos is 		 
port (reloj: in  std_logic;
	cami_e: in  tp_camino_e;
	dir_proc: in st_dir;
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

-- Desacoplo del acceso a ET y EST de DAT. El acceso a DAT es con la direccion del procesador.
-- La direccion de acceso a ET y EST es funcion de la operacion que se efectua. Servir el acceso del procesador
-- u observacion.
DAT_e <= (acc => cami_e.dat_acc,
		dir => dir_proc(dir_bloque_bits-etiq_bits-1 downto dir_bloque_bits-etiq_bits-indice_bits), 
		esc => cami_e.dat_esc, 
		DE => cami_e.dat_DE);

EST_e <= (acc => cami_e.est_acc,
		dir => cami_e.dirB(dir_bloque_bits-etiq_bits-1 downto dir_bloque_bits-etiq_bits-indice_bits), 
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
