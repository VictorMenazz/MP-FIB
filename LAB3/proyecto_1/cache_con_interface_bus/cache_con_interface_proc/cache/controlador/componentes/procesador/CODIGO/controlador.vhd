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
			when DES0 => 
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
				if(hay_concesion(arb_conc)) then
					v_prxestado := ESPL;
				end if;
			when ESPL =>
				if (hay_respuesta_memoria(resp_m)) then
					v_prxestado := ESB;
				end if;
			when ESB =>
				v_prxestado := LEC;
			when PMEA =>
				if(hay_concesion(arb_conc)) then
					v_prxestado := ESPEA;
				end if;
			when ESPEA =>
				if (hay_respuesta_memoria(resp_m)) then
					v_prxestado := ESCP;
				end if;
			when ESCP =>
				v_prxestado := HECHOE;
			when PMEF =>
				if(hay_concesion(arb_conc)) then
					v_prxestado := ESPEF;
				end if;
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
variable v_arb_pet: std_logic;
variable v_trans_bus: std_logic;
begin
	--POR DEFECTO
	por_defecto (v_s_control, v_pet_m, v_resp, v_arb_pet, v_trans_bus);

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
				
			when ESCINI => 
				interfaces_en_CURSO(v_resp);
				actualizar_etiqueta (v_s_control);
				actualizar_estado (v_s_control, contenedor_valido);				
				actualizar_dato (v_s_control);
				
			when CMPETIQ =>
				interfaces_en_CURSO(v_resp);
				if (es_acierto_lectura(pet, derechos_acceso)) then
				else peticion_arbitraje(v_arb_pet);
				end if;

			when LEC =>
				interfaces_en_CURSO(v_resp);
				lectura_datos(v_s_control);
				
			when PML =>
				interfaces_en_CURSO(v_resp);
				if(hay_concesion(arb_conc)) then
					peticion_memoria_lectura(v_pet_m);
					arbitraje_concedido(v_arb_pet);
					transaccion_bus(v_trans_bus);
				else
					peticion_arbitraje(v_arb_pet);
				end if;
				
				
			when ESPL =>
				interfaces_en_CURSO(v_resp);
				transaccion_bus(v_trans_bus);
				
			when ESB =>
				interfaces_en_CURSO(v_resp);
				actualizar_etiqueta (v_s_control);
				actualizar_estado (v_s_control, contenedor_valido);				
				actualizar_dato (v_s_control);
				actu_datos_desde_bus(v_s_control);
				
			when PMEA =>
				interfaces_en_CURSO(v_resp);
				if(hay_concesion(arb_conc)) then
					peticion_memoria_escritura(v_pet_m);
					arbitraje_concedido(v_arb_pet);
					transaccion_bus(v_trans_bus);
				else
					peticion_arbitraje(v_arb_pet);
				end if;
				
			when ESPEA =>
				interfaces_en_CURSO(v_resp);
				transaccion_bus(v_trans_bus);
				
			when ESCP =>
				interfaces_en_CURSO(v_resp);
				actualizar_dato (v_s_control);
				
			when PMEF =>
				interfaces_en_CURSO(v_resp);
				if(hay_concesion(arb_conc)) then
					peticion_memoria_escritura(v_pet_m);
					arbitraje_concedido(v_arb_pet);
					transaccion_bus(v_trans_bus);
				else
					peticion_arbitraje(v_arb_pet);
				end if;
				
			when ESPEF =>
				interfaces_en_CURSO(v_resp);
				transaccion_bus(v_trans_bus);

			when HECHOL =>
				interfaces_HECHOL(v_resp);
			when HECHOE =>
				interfaces_HECHOE(v_resp);
		end case;
	end if;


s_control <= v_s_control after retardo_logica_salida;
resp <= v_resp after retardo_logica_salida;
pet_m <= v_pet_m after retardo_logica_salida;
arb_pet <= v_arb_pet after retardo_logica_salida;
trans_bus <= v_trans_bus after retardo_logica_salida;
end process;
	
end;
