--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_Obs_pkg.all;
use work.controlador_pkg.all;
use work.acciones_pkg.all;

package procedimientos_observador_pkg is

-- comprobacion de condiciones
function hay_peticion_escritura_bus (signal pet: tp_contro_Obs_e) return boolean;  

function es_acierto (signal derechos_acceso: std_logic) return boolean;   

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_Obs_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_Obs_s);


procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl; variable v_resp: out tp_contro_Obs_s;
						variable v_observacion: out std_logic);

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl);

procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: std_logic);

procedure observando (variable v_observacion: out std_logic);

end package procedimientos_observador_pkg;

package body procedimientos_observador_pkg is

-- comprobacion de condiciones
function hay_peticion_escritura_bus (signal pet: tp_contro_Obs_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.acc = '1' and pet.esc = '1');
return (hay_peticion);
end hay_peticion_escritura_bus;   

function es_acierto (signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (derechos_acceso = derechos_acceso_si);
return (es_acierto);
end es_acierto;   

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_Obs_s) is
begin
	v_resp.listo := resp_cache_listo;
end procedure;

procedure interfaces_en_CURSO(variable v_resp: out tp_contro_Obs_s) is
begin
	v_resp.listo := resp_cache_ocupado;
end procedure;


procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl; variable v_resp: out tp_contro_Obs_s;
						variable v_observacion: out std_logic) is
begin
	interfaces_DES(v_resp);
	v_s_control:= (DAT_acc => acceso_no,
				DAT_esc => escritura_no_permiso,
				ET_acc => acceso_no,
				ET_esc => escritura_no_permiso,
				EST_acc => acceso_no,
				EST_esc => escritura_no_permiso,
				EST_DE => contenedor_no_valido,
				muxE => '0');
	v_observacion:= '0';
end procedure;

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
end procedure;


procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: std_logic) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure observando (variable v_observacion: out std_logic) is
begin
	v_observacion:= '1';
end procedure;

end package body procedimientos_observador_pkg;

