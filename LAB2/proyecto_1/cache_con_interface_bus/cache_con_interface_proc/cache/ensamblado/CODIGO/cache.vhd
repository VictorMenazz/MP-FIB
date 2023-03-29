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

signal cami_e : tp_camino_e;
signal cami_s : tp_camino_s;

signal pet: tp_contro_e;
signal s_estado: tp_contro_cam_estado;
signal s_control: tp_contro_cam_cntl;
signal resp: tp_contro_s;

signal mx_DAT: st_palabra_dat;

begin 
-- interconexión
cami_e <= (etiq_acc => s_control.ET_acc, 
			dirB => peticion.dir,
			etiq_esc => s_control.ET_esc,
			est_acc => s_control.EST_acc,
			est_esc => s_control.EST_esc,
			est_DE => s_control.EST_DE,
			dat_acc => s_control.DAT_acc,
			dat_esc => s_control.DAT_esc,
			dat_DE => mx_DAT);

-- conexion con datos del bus: captura del bloque (muxE)
mx: mux_dat port map (a => peticion.DE, b => mdato, sel => s_control.muxE, s => mx_DAT); 
-- camino de datos: ET, EST, DAT
camino: camino_datos port map (reloj => reloj, cami_e => cami_e, cami_s => cami_s);

-- interconexión
s_estado <= (AF => cami_s.cam_AF,
			EST => cami_s.cam_EST);
pet <= (acc => peticion.acc, 
		esc => peticion.esc,
		ini => peticion.ini);

-- controlador de cache
contro: controlador port map(reloj => reloj, pcero => pcero, pet => pet, s_estado => s_estado, s_control => s_control, resp => resp,
							resp_m => resp_m, pet_m => pet_m); 

-- interconexión
respuesta <= (DL => cami_s.cam_DL,
			val => resp.finalizada);

pet_listo <= resp.listo;

end;


