--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.retardos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.procedimientos_controlador_pkg.all;
--! @image html controlador.png 

entity controlador is
port (reloj, pcero: in std_logic;
		arb_pet: out std_logic;
		arb_conc: in std_logic;
		trans_bus: out std_logic;
		observacion: in std_logic; --indicacion de que se esta observando una transaccion
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture compor of controlador is

--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE, DESB);
signal estado, prxestado: tipoestado;

signal derechos_acceso: std_logic;
--signal trans_bus: std_logic;

begin
-- determinacion de los derechos de acceso al bloque
derechos_acceso <= '1' when (s_estado.AF and s_estado.EST) = '1' else '0';

-- registro de estado
reg_estado: process (reloj, pcero)
begin
-- 
-- asignacion de variables a las señales, indicando el retardo
end process;    
   
-- logica de proximo estado
prx_esta: process(estado, pet, derechos_acceso, arb_conc, resp_m, observacion, pcero)
begin
-- 
-- asignacion de variables a las señales, indicando el retardo
end process;
   
-- logica de salida
logi_sal: process(estado, pet, derechos_acceso, arb_conc, resp_m, observacion, pcero)
begin
-- 
-- asignacion de variables a las señales, indicando el retardo
end process;

	
end;
