--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_pkg.all;
use work.controlador_pkg.all;
use work.retardos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.procedimientos_observador_pkg.all;
--! @image html observador.png 

entity observador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_Obs_e;
		s_estado: in tp_contro_cam_estado;
		observacion: out std_logic;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_Obs_s);
end;
  
architecture compor of observador is

--type tipoestado_O is (DESO, CMPETO, EEST);
signal estado, prxestado: tipoestado_O;

signal derechos_acceso: std_logic;

begin
-- determinacion de los derechos de acceso al bloque
derechos_acceso <= '1' when (s_estado.AF and s_estado.EST) = '1' else '0';

-- registro de estado
reg_estado: process (reloj, pcero)
begin
-- 
-- asignacion de variables a las señales, indicando el retardo, mismo retardo que el agente procesador
end process;    
   
-- logica de proximo estado
prx_esta: process(estado, pet, derechos_acceso, pcero)
begin
-- 
-- asignacion de variables a las señales, indicando el retardo, mismo retardo que el agente procesador
end process;
   
-- logica de salida
logi_sal: process(estado, pet, derechos_acceso, pcero)
begin
--
-- asignacion de variables a las señales, indicando el retardo, mismo retardo que el agente procesador

end process;

	
end;
