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
--! @image html controlador_procesador.png 

entity controlador is
port (reloj, pcero: in std_logic;
		arb_pet: out std_logic; -- peticion
		arb_conc: in std_logic; -- concesion
		trans_bus: out std_logic; -- utilizando el bus
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture compor of controlador is

--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
signal estado, prxestado: tipoestado;

signal derechos_acceso: std_logic;

begin
-- determinacion de los derechos de acceso al bloque
derechos_acceso <= '1' when (s_estado.AF and s_estado.EST) = '1' else '0';

-- registro de estado
reg_estado: process (reloj, pcero)
variable v_estado: tipoestado;
begin
	if pcero = '1' then
		v_estado := DES0;
	elsif rising_edge(reloj) then
		v_estado := prxestado;										
	end if;
	estado <= v_estado after retardo_estado;
end process;    
   
-- logica de proximo estado
prx_esta: process(estado, pet, derechos_acceso, arb_conc, resp_m, pcero)
variable v_prxestado: tipoestado;
begin
	v_prxestado := estado;
	if (pcero /= '1') then
		case estado is
			when DES0 => -- posible error
				if (hay_peticion_ini_procesador(pet)) then
					v_prxestado := INI;
				elsif (hay_peticion_procesador(pet)) then
					v_prxestado := CMPETIQ;
				end if;
			when DES => 
				if(hay_peticion_procesador(pet)) then
					v_prxestado := CMPETIQ;
				end if;
			when INI =>
				v_prxestado := ESCINI;
			when ESCINI =>
				v_prxestado := HECHOE;
			when CMPETIQ =>
				if (es_acierto_lectura(pet, derechos_acceso)) then
					v_prxestado := LEC;
				elsif (es_fallo_lectura(pet, derechos_acceso)) then
					v_prxestado := PML;
				elsif (es_acierto_escritura(pet, derechos_acceso)) then
					v_prxestado := PMEA;
				elsif (es_fallo_escritura(pet, derechos_acceso)) then
					v_prxestado := PMEF;
				end if;
			when LEC =>
				v_prxestado := HECHOL;
			when PML =>
				v_prxestado := ESPL;
			when ESPL =>
				if (hay_respuesta_memoria(resp_m)) then
					v_prxestado := ESB;
				end if;
			when ESB =>
				v_prxestado := LEC;
			when PMEA =>
				v_prxestado := ESPEA;
			when ESPEA =>
				if (hay_respuesta_memoria(resp_m)) then
					v_prxestado := ESCP;
				end if;
			when ESCP =>
				v_prxestado := HECHOE;
			when PMEF =>
				v_prxestado := ESPEF;
			when ESPEF =>
				if (hay_respuesta_memoria(resp_m)) then
					v_prxestado := HECHOE;
				end if;
			when HECHOL =>
				v_prxestado := DES;
			when HECHOE =>
				v_prxestado := DES;
		end case;
	else 
		v_prxestado := DES0;
	end if;

	prxestado <= v_prxestado after retardo_logica_prx_estado;
end process;
   
-- logica de salida
logi_sal: process(estado, pet, derechos_acceso, arb_conc, resp_m, pcero)
variable v_s_control: tp_contro_cam_cntl;
variable v_resp: tp_contro_s;
variable v_pet_m: tp_cntl_memoria_s;

begin
	--POR DEFECTO
	por_defecto (v_s_control, v_pet_m, v_resp);

	if (pcero /= '1') then
		case estado is
			when DES0 => 
				interfaces_DES(v_resp);
				lectura_etiq_estado(v_s_control);

			when DES => 
				interfaces_DES(v_resp);
				lectura_etiq_estado(v_s_control);

			when INI =>
				interfaces_en_CURSO(v_resp);
				
			when ESCINI => --Actualizar contenedor
				interfaces_en_CURSO(v_resp);
				actualizar_etiqueta (v_s_control);
				actualizar_estado (v_s_control, contenedor_valido);				
				actualizar_dato (v_s_control);
				
			when CMPETIQ =>
				interfaces_en_CURSO(v_resp);
				
				
			when LEC =>
				interfaces_en_CURSO(v_resp);
				lectura_datos(v_s_control);
				
			when PML =>
				interfaces_en_CURSO(v_resp);
				peticion_memoria_lectura(v_pet_m);
				
			when ESPL =>
				interfaces_en_CURSO(v_resp);
				
			when ESB =>
				interfaces_en_CURSO(v_resp);
				actualizar_etiqueta (v_s_control);
				actualizar_estado (v_s_control, contenedor_valido);				
				actualizar_dato (v_s_control);
				actu_datos_desde_bus(v_s_control);
				
			when PMEA =>
				interfaces_en_CURSO(v_resp);
				peticion_memoria_escritura(v_pet_m);
				
			when ESPEA =>
				interfaces_en_CURSO(v_resp);
				
			when ESCP =>
				interfaces_en_CURSO(v_resp);
				actualizar_dato (v_s_control);
				
			when PMEF =>
				interfaces_en_CURSO(v_resp);
				peticion_memoria_escritura(v_pet_m);
				
			when ESPEF =>
				interfaces_en_CURSO(v_resp);

			when HECHOL =>
				interfaces_HECHOL(v_resp);
			when HECHOE =>
				interfaces_HECHOE(v_resp);
		end case;
	end if;


s_control <= v_s_control after retardo_logica_salida;
resp <= v_resp after retardo_logica_salida;
pet_m <= v_pet_m after retardo_logica_salida;

end process;
	
end;
