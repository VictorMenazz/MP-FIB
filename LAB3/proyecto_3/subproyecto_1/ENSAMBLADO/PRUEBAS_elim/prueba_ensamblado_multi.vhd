--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use IEEE.std_logic_textio.all;
use std.env.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.controlador_pkg.all;

use work.campo_ET_pkg.all;

use work.controlador_Obs_pkg.all;
use work.multis_pkg.all;

use work.procedimientos_prueba_pkg.all;
use work.procedimientos_peticiones_pkg.all;
use work.tipos_pruebas_pkg.all;

use work.param_memorias_pkg.all;
use work.impri_memoria_pkg.all;
use work.impri_cache_pkg.all;
use work.impri_traza_pkg.all;

entity prueba_ensamblado_multi is
    generic(pasoapaso: integer range 0 to 1:= 0;
			imprimir_traza: integer:= 1;
			imprimir_CACHE: integer:= 1;
			imprimir_MEMORIA: integer:= 1;
			comprobar_load: integer:= 1);
end prueba_ensamblado_multi;
  
architecture prueba of prueba_ensamblado_multi is
constant retardo: time := 2 ns;

component ensamblado_multi is 										
	port(reloj, pcero: in  std_logic;
		arb_control: in st_arb_peticiones;
		pet_proc: in tp_peticiones_multi;
		pet_listo: out tp_cache_listo_multi;
		resp_cache: out tp_respuesta_multi);
end component;

constant std_DIRA: std_logic_vector := x"0000";
constant DIRA: natural range 0 to tam_ELogico := to_integer(unsigned(std_DIRA));
constant std_DIRB: std_logic_vector := x"0010";
constant DIRB: natural range 0 to tam_ELogico := to_integer(unsigned(std_DIRB));
constant std_DIRF: std_logic_vector := x"FFFF";
constant DIRF: natural range 0 to tam_ELogico := to_integer(unsigned(std_DIRF));

signal reloj, pcero: std_logic;

signal arb_control: st_arb_peticiones;

signal peticiones: tp_peticiones_multi;
signal pet_listos: tp_cache_listo_multi;
signal respuestas: tp_respuesta_multi;

signal s_mem_etiq: tp_caches_etiquetas;
signal s_mem_estado: tp_caches_estado;
signal s_mem_datos: tp_caches_datos;
signal s_mem_memoria: RAM_mem;

signal s_derechos_acceso: tp_s_derechos_acceso;
signal s_estado: tp_s_estado;
signal s_pet: tp_s_pet;

signal s_AF: tp_s_AF;
signal s_est: tp_s_est;
signal s_control: tp_s_control;

signal s_peticion, s_reg_pet: tp_peticiones_multi;

signal s_sel_agente: tp_s_sel_agentes;

signal s_estado_obs: tp_s_estado_obs;
signal s_control_obs: tp_s_control;

signal s_dir_cache: tp_dir_cache;

signal s_esperado: tp_esperado_multi; 

signal esperado: tp_esperado_multi; 

signal s_ent_DAT_muli: tp_ent_DAT_multi;

signal s_listo_0, s_listo_1: std_logic;
signal s_val_0, s_val_1: std_logic;

signal parar_0, parar_1: std_logic:= '0';
signal finaltraza: std_logic:= '0';

signal pcero_0, pcero_1: std_logic;

shared variable final : boolean := false;
signal ciclo: integer:= 0;

file S, S_pro_cons: text;

constant fichero: string := "../../../RESULTADOS_elim/resultados_ejecucion.txt";
constant fichero_pro_cons: string := "../../../RESULTADOS_elim/productor_consumidor.txt";

constant fichero_individual: string := "../../../RESULTADOS_elim/resultados_ejecucion_P";
constant fichero_individual_extension: string := ".txt";

shared variable ficheros_nombre_ptr: vector_ficheros;

begin
--instanciacion del multiprocesador
ensa_ca_mem: ensamblado_multi port map (reloj => reloj, pcero => pcero, arb_control => arb_control, pet_proc => peticiones, pet_listo => pet_listos, resp_cache => respuestas); 

--captura de señales internas del multiprocesador
--campos de cache
ge_campos: for i in 0 to Nproc-1 generate
	s_mem_etiq(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.camino.etiq.ET_Mem.ET_mem: tp_ET_mem >>;
	s_mem_estado(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.camino.estado.EST_mem: tp_EST_mem >>;
	s_mem_datos(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.camino.datos_ca.DAT_Mem.DAT_mem: tp_DAT_mem >>;
end generate;

-- memoria
	s_mem_memoria <= << signal .prueba_ensamblado_multi.ensa_ca_mem.memoria.memoria.mem.mem: RAM_mem >>;

--peticion, derechos
ge_contr_proc: for i in 0 to Nproc-1 generate
	s_derechos_acceso(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.contro_proc.derechos_acceso: std_logic >>;
	s_estado(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.contro_proc.estado: tipoestado >>;
	s_pet(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.contro_proc.pet: tp_contro_e >>;
end generate;

-- senyales de control
ge_AF_proc: for i in 0 to Nproc-1 generate
	s_AF(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.camino.etiq.AF: std_logic >>;
	s_est(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.camino.estado.DL: std_logic >>;
	s_control(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.contro_proc.s_control: tp_contro_cam_cntl >>;
end generate;

--interface proc/cache
ge_petic_proc: for i in 0 to Nproc-1 generate
	s_peticion(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.peticion: tp_peticion >>;
	s_reg_pet(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.inter_Pr_ca.reg_pet: tp_peticion >>;
end generate;

--agente observador
ge_proc_obs: for i in 0 to Nproc-1 generate
	s_sel_agente(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.cntl: std_logic >>;
	s_estado_obs(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.contro_obser.estado: tipoestado_O >>;
	s_control_obs(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.contro.contro_obser.s_control: tp_contro_cam_cntl >>;
end generate;

--direcciones de acceso a la cache
ge_dir_cache: for i in 0 to Nproc-1 generate
	s_dir_cache(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.dir_cache: st_dir >>;
	s_ent_DAT_muli(i) <= << signal .prueba_ensamblado_multi.ensa_ca_mem.proc_multi(i).cache.cach.cache_sin.camino.dir_proc: st_dir >>;
end generate;

-- senyales listo y val individualizadas de cada cache
s_listo_0 <= pet_listos(0);
s_listo_1 <= pet_listos(1);
s_val_0 <= respuestas(0).val;
s_val_1 <= respuestas(1).val;


-- inicializacion y arbitraje
inicializar: process 
begin
-- fichero resumen
 	file_open(S_pro_cons,fichero_pro_cons,write_mode); 
	cabecera_resumen (fichero_pro_cons);
	file_close(S_pro_cons);

-- ficheros de traza     
	if (imprimir_traza = 1) then
		file_open(S,fichero,write_mode); 
		file_close(S);
	end if;

	for i in 0 to Nproc-1 loop
		ficheros_nombre_ptr(i):= new string'(fichero_individual & integer'image(i) & fichero_individual_extension); 
	end loop;

	for i in 0 to Nproc-1 loop
	 	file_open(S_pro_cons,ficheros_nombre_ptr(i).all,write_mode); 
		file_close(S_pro_cons);
	end loop;

	if imprimir_traza = 1 then
		cabecera_traza (fichero, ficheros_nombre_ptr);
	end if;

-- arbitraje, puesta a cero
	arb_control <= (others => '0');     
	pcero <= '1';
	wait until rising_edge(reloj);
	pcero <= '0';

--arbitraje
	arb_control(0) <= '0'; 
	arb_control(1) <= '1'; 
	wait until (pcero_0 = '1' and pcero_1 = '1');
--arbitraje
	wait until ciclo = 49; 
	arb_control(0) <= '1'; 
	arb_control(1) <= '0'; 

	wait;
end process;


--productor. En un instante de tiempo se genera una peticion para un procesador 
-- "cache_ID": identifica el procesador para el que se genera una peticion
productor_0: process 
variable v_DIR: natural range 0 to tam_ELogico;
variable v_DATO: natural range 0 to tam_palabra ;
variable cache: natural range 0 to Nproc-1;  


constant cache_ID: integer:= 0;
alias peticion:  tp_peticion is peticiones(0);
alias respuesta: tp_respuesta is respuestas(0);
alias pet_listo: st_cache_listo is pet_listos(0);
alias a_s_esperado: st_palabra_dat is s_esperado(0);
begin
	pcero_0 <= '0';
	wait until pcero = '1';
-- no peticion
	no_hay_peticion (reloj, peticion, pet_listo, cache_ID, ciclo, fichero_pro_cons);
	wait until pcero = '0';
	wait until rising_edge(reloj);
	pcero_0 <= '1';
-- interface productor
	interface_productor(reloj, pet_listo);

	v_DIR := 0; 
	v_DATO := 4;
	inicio (reloj, peticion, pet_listo, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);

	v_DIR := 1; 
	v_DATO := 17;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);

	no_hay_peticion (reloj, peticion, pet_listo, cache_ID, ciclo, fichero_pro_cons);
	no_hay_peticion (reloj, peticion, pet_listo, cache_ID, ciclo, fichero_pro_cons);

	interface_productor(reloj, pet_listo);

	report "prueba finalizada";

	parar_0 <= '1';
	wait;       

end process;

--productor. En un instante de tiempo se genera una peticion para un procesador 
-- "cache_ID": identifica el procesador para el que se genera una peticion
productor_1: process 
variable v_DIR: natural range 0 to tam_ELogico;
variable v_DATO: natural range 0 to tam_palabra ;
variable cache: natural range 0 to Nproc-1;  

constant cache_ID: integer:= 1;
alias peticion:  tp_peticion is peticiones(1);
alias respuesta: tp_respuesta is respuestas(1);
alias pet_listo: st_cache_listo is pet_listos(1);
alias a_s_esperado: st_palabra_dat is s_esperado(1);
begin
	pcero_1 <= '0';
	wait until pcero = '1';
-- no peticion
	no_hay_peticion (reloj, peticion, pet_listo, cache_ID, ciclo, fichero_pro_cons);
	wait until pcero = '0';
	wait until rising_edge(reloj);
	pcero_1 <= '1';
-- interface productor
	interface_productor(reloj, pet_listo);

	v_DIR := 1; 
	v_DATO := 5;
	inicio (reloj, peticion, pet_listo, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);

	v_DIR := 2; 
	v_DATO := 8;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);
	v_DIR := 3; 
	v_DATO := 18;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);
	v_DIR := 2; 
	v_DATO := 8;
	Plectura (reloj, peticion, pet_listo, respuesta, a_s_esperado, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);
	v_DIR := 3; 
	v_DATO := 18;
	Plectura (reloj, peticion, pet_listo, respuesta, a_s_esperado, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);
	v_DIR := 2; 
	v_DATO := 8;
	Plectura (reloj, peticion, pet_listo, respuesta, a_s_esperado, v_DIR, v_DATO, cache_ID, ciclo, fichero_pro_cons);

	no_hay_peticion (reloj, peticion, pet_listo, cache_ID, ciclo, fichero_pro_cons);
	no_hay_peticion (reloj, peticion, pet_listo, cache_ID, ciclo, fichero_pro_cons);
	interface_productor(reloj, pet_listo);
	report "prueba finalizada";

	parar_1 <= '1';
	wait;       

end process;

--consumidor de la cache C0
consumidor_0: process is
variable v_s_peticion: tp_peticion;
variable esperado, consumo: st_palabra_dat;
variable ciclod:integer;
file S_pro_cons: text;
variable Lo, l : line;

constant cache: integer := 0;
alias peticion:  tp_peticion is s_peticion(0);
alias respuesta: tp_respuesta is respuestas(0);
alias a_s_esperado: st_palabra_dat is s_esperado(0); 
begin
--	capturar valor esperado en una instruccion load (s_esperado)
	interface_productor(reloj, s_listo_0);
	if es_pet_lectura (peticion) then
		esperado := a_s_esperado;
		interface_consumidor(reloj, s_val_0);
		consumo := respuesta.DL;

-- Actualizar fichero. Instante en el cual se consume el valor del load 
		ciclod:= ciclo'delayed(0 fs);
		consumo_ciclo (cache, ciclod, consumo, peticion, fichero_pro_cons);

-- comprobacion del valor leido con el esperado
		if comprobar_load = 1 then
			comprobar_valor_load (respuesta, esperado, fichero_pro_cons);
		end if;
	end if;
end process;

--consumidor de la cache C1
consumidor_1: process is
variable v_s_peticion: tp_peticion;
variable esperado, consumo: st_palabra_dat;
variable ciclod:integer;
file S_pro_cons: text;
variable Lo, l : line;

constant cache: integer := 1;
alias peticion:  tp_peticion is s_peticion(1);
alias respuesta: tp_respuesta is respuestas(1);
alias a_s_esperado: st_palabra_dat is s_esperado(1); 
begin
--	capturar valor esperado en una instruccion load (s_esperado)
	interface_productor(reloj, s_listo_1);
	if es_pet_lectura (peticion) then
		esperado := a_s_esperado;
		interface_consumidor(reloj, s_val_1);
		consumo := respuesta.DL;

-- Actualizar fichero. Instante en el cual se consume el valor del load 
		ciclod:= ciclo'delayed(0 fs);
		consumo_ciclo (cache, ciclod, consumo, peticion, fichero_pro_cons);

-- comprobacion del valor leido con el esperado
		if comprobar_load = 1 then
			comprobar_valor_load (respuesta, esperado, fichero_pro_cons);
		end if;
	end if;
end process;

traza: if imprimir_traza = 1 generate
impri_accesos: process

variable v_peticion: tp_peticiones_multi;
variable v_pet_listo: tp_cache_listo_multi;

variable v_derechos_acceso: tp_s_derechos_acceso;
variable v_estado: tp_s_estado;
variable v_pet: tp_s_pet;

variable v_AF: tp_s_AF;
variable v_est: tp_s_est;
variable v_control, v_control_actuacion: tp_s_control;

variable v_s_peticion: tp_peticiones_multi;

variable v_s_sel_agente: tp_s_sel_agentes;

variable v_estado_obs: tp_s_estado_obs;
variable v_control_obs, v_control_actuacion_obs: tp_s_control;

variable v_dir_cache: tp_dir_cache;
variable v_ent_DAT_muli: tp_ent_DAT_multi;

variable ciclod:integer;
variable cnt, cnt_sigue: integer := 0;

begin

	wait until rising_edge(reloj);
	v_pet_listo:= pet_listos'delayed(0 fs); -- listo, listos
	if ciclo >= 5 and finaltraza = '0' then
-- valor de las senyales en el instante previo al flanco ascendente
		v_peticion:= peticiones'delayed(0 fs); --peticion peticiones
		v_estado:= s_estado'delayed(0 fs);
		v_pet:= s_pet'delayed(0 fs);
		v_AF:= s_AF'delayed(0 fs);

		v_est:= s_est'delayed(0 fs);

		v_control:= s_control'delayed(0 fs);
		v_s_peticion := s_peticion'delayed(0 fs);

		v_s_sel_agente:= s_sel_agente'delayed(0 fs);
		v_estado_obs:= s_estado_obs'delayed(0 fs);
		v_control_obs:= s_control_obs'delayed(0 fs);

		v_dir_cache:= s_dir_cache'delayed(0 fs);
		v_ent_DAT_muli:= s_ent_DAT_muli'delayed(0 fs);

		ciclod:= ciclo'delayed(0 fs);

-- como los campos de cache y memoria no se actualizan en cada ciclo no es necesario "delayed"
		impri_traza (v_pet_listo, v_s_peticion, v_peticion, v_AF, v_est, v_estado,
					s_mem_etiq, s_mem_estado, s_mem_datos, s_mem_memoria,
					v_control_actuacion,
					v_s_sel_agente, v_estado_obs, v_control_actuacion_obs,
					v_dir_cache, v_ent_DAT_muli, ficheros_nombre_ptr,
 					ciclod, cnt, cnt_sigue, fichero);
		v_control_actuacion := v_control;
		v_control_actuacion_obs := v_control_obs;
	end if;

	if parar_0 = '1' and parar_1 = '1' then
		finaltraza <= '1';
	end if;

end process;
end generate traza;



finalizar: process is
begin
	wait until parar_0 = '1' and parar_1 = '1';
	final := true;
	if imprimir_cache = 1 then
		for i in 0 to Nproc-1 loop
			impri_cache(i, s_mem_etiq(i), s_mem_estado(i), s_mem_datos(i), fichero_pro_cons);
		end loop;
	end if;
	if imprimir_memoria = 1 then
		impri_memoria(s_mem_memoria, fichero_pro_cons);
	end if;
end process;


relojciclo: process  is
begin
  if final = false then
	reloj <= '0';
	wait for 40 ns;
	ciclo <= ciclo +1;
	reloj <= '1';
	wait for 40 ns;
	if pasoapaso = 1 then
		stop(0);
	end if;
  else
	wait;
  end if;
end process relojciclo;

end;
