--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.acciones_pkg.all;

package procedimientos_controlador_pkg is

-- comprobacion de condiciones
function hay_peticion_procesador (signal pet: tp_contro_e) return boolean;  
function hay_peticion_ini_procesador (signal pet: tp_contro_e) return boolean;  

function es_acierto_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;   
function es_fallo_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;   
function es_acierto_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;
function es_fallo_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean;

function hay_concesion (signal arb_conc: std_logic) return boolean;

function hay_observacion(signal observacion: std_logic) return boolean;

-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s);
procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOL(variable v_resp: out tp_contro_s);
procedure interfaces_HECHOE(variable v_resp: out tp_contro_s);

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl);

procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl; variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s; v_arb_pet: out std_logic; variable v_trans_bus: out std_logic);

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl);
procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl);

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_cntl);
procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: std_logic);
procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_cntl);

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s);
procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s);

procedure peticion_arbitraje (variable v_arb_pet: out std_logic);

procedure arbitraje_concedido (variable v_arb_pet: out std_logic);

procedure transaccion_bus (variable v_trans_bus: out std_logic);

end package procedimientos_controlador_pkg;

package body procedimientos_controlador_pkg is

-- comprobacion de condiciones
function hay_peticion_procesador (signal pet: tp_contro_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.acc = peticion_proc);
return (hay_peticion);
end hay_peticion_procesador;   

function hay_peticion_ini_procesador (signal pet: tp_contro_e) return boolean is
variable hay_peticion: boolean:= FALSE;
begin
	hay_peticion := (pet.ini = peticion_proc_ini);
return (hay_peticion);
end hay_peticion_ini_procesador;   

function es_acierto_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = lectura and derechos_acceso = derechos_acceso_si);
return (es_acierto);
end es_acierto_lectura;   

function es_fallo_lectura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_fallo: boolean:= FALSE;
begin
	es_fallo := (pet.esc = lectura and derechos_acceso = derechos_acceso_no);
return (es_fallo);
end es_fallo_lectura;  

function es_acierto_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = escritura and derechos_acceso = derechos_acceso_si);
return (es_acierto);
end es_acierto_escritura;

function es_fallo_escritura (signal pet: tp_contro_e; signal derechos_acceso: std_logic) return boolean is
variable es_acierto: boolean:= FALSE;
begin
	es_acierto := (pet.esc = escritura and derechos_acceso = derechos_acceso_no);
return (es_acierto);
end es_fallo_escritura;

function hay_respuesta_memoria (signal resp_m: tp_cntl_memoria_e) return boolean is
variable hay_resp: boolean:= FALSE;
begin
	hay_resp := (resp_m.m_val = '1');
return (hay_resp);
end hay_respuesta_memoria;

function hay_concesion (signal arb_conc: std_logic) return boolean is
variable hay_conc: boolean:= FALSE;
begin
	hay_conc := (arb_conc = '1');
return (hay_conc);
end hay_concesion;

function hay_observacion (signal observacion: std_logic) return boolean is
variable hay_obs: boolean:= FALSE;
begin
	hay_obs := (observacion = '1');
return (hay_obs);
end hay_observacion;


-- realizacion de acciones
procedure interfaces_DES(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '0';
	v_resp.listo := resp_cache_listo;
end procedure;

procedure interfaces_en_CURSO(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '0';
	v_resp.listo := resp_cache_ocupado;
end procedure;

procedure interfaces_HECHOL(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '1';
	v_resp.listo := resp_cache_ocupado;
end procedure;

procedure interfaces_HECHOE(variable v_resp: out tp_contro_s) is
begin
	v_resp.finalizada := '0';
	v_resp.listo := resp_cache_ocupado;
end procedure;

procedure actu_datos_desde_bus (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.muxE := actualizar_campo_datos_desde_bus;
end procedure;

procedure por_defecto (variable v_s_control: inout tp_contro_cam_cntl; variable v_pet_m: out tp_cntl_memoria_s; variable v_resp: out tp_contro_s; v_arb_pet: out std_logic; variable v_trans_bus: out std_logic) is
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
	v_pet_m:= (m_acc => acceso_no,
				m_pet => peticion_memoria_no,
				m_esc => escritura_no_permiso);
	v_arb_pet:= '0';
	v_trans_bus:= '0';
end procedure;

procedure lectura_etiq_estado (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.EST_acc := acceso_si;
end procedure;

procedure lectura_datos (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
end procedure;

procedure actualizar_etiqueta (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.ET_acc := acceso_si;
	v_s_control.ET_esc := escritura_permiso;
end procedure;

procedure actualizar_estado (variable v_s_control: inout tp_contro_cam_cntl; estado_conte: std_logic) is
begin
	v_s_control.EST_acc := acceso_si;
	v_s_control.EST_esc := escritura_permiso;
	v_s_control.EST_DE := estado_conte;
end procedure;

procedure actualizar_dato (variable v_s_control: inout tp_contro_cam_cntl) is
begin
	v_s_control.DAT_acc := acceso_si;
	v_s_control.DAT_esc := escritura_permiso;
end procedure;

procedure peticion_memoria_lectura (variable v_pet_m: out tp_cntl_memoria_s) is
begin
	v_pet_m:= (m_acc => '1',
			m_pet => peticion_memoria_si,
			m_esc => escritura_no_permiso);
end procedure;

procedure peticion_memoria_escritura (variable v_pet_m: out tp_cntl_memoria_s) is
begin
	v_pet_m:= (m_acc => '1',
			m_pet => peticion_memoria_si,
			m_esc => escritura_permiso);
end procedure;

procedure peticion_arbitraje (variable v_arb_pet: out std_logic) is
begin
	v_arb_pet:= '1';
end procedure;

procedure arbitraje_concedido (variable v_arb_pet: out std_logic) is
begin
	v_arb_pet:= '0';
end procedure;

procedure transaccion_bus (variable v_trans_bus: out std_logic) is
begin
	v_trans_bus:= '1';
end procedure;

end package body procedimientos_controlador_pkg;

