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

use work.procedimientos_peticiones_pkg.all;

use work.param_memorias_pkg.all;
use work.impri_memoria_pkg.all;
use work.impri_cache_pkg.all;
use work.impri_traza_pkg.all;

entity prueba_ensamblado is
    generic(pasoapaso: integer range 0 to 1:= 0;
			imprimir_traza: integer:= 1;
			imprimir_CACHE: integer:= 1;
			imprimir_MEMORIA: integer:= 1;
			comprobar_load: integer:= 1);
end prueba_ensamblado;
  
architecture prueba of prueba_ensamblado is

component ensamblado is 										
	port(reloj, pcero: in  std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_cache: out tp_respuesta);
end component;

constant std_DIRA: std_logic_vector := x"0000";
constant DIRA: natural range 0 to tam_ELogico := to_integer(unsigned(std_DIRA));
constant std_DIRB: std_logic_vector := x"0010";
constant DIRB: natural range 0 to tam_ELogico := to_integer(unsigned(std_DIRB));
constant std_DIRF: std_logic_vector := x"FFFF";
constant DIRF: natural range 0 to tam_ELogico := to_integer(unsigned(std_DIRF));

type buf is array (0 to 1) of st_palabra_dat;

signal reloj, pcero: std_logic;

signal peticion: tp_peticion;
signal respuesta: tp_respuesta;
signal pet_listo: st_cache_listo;

signal s_mem_etiq: tp_ET_mem;
signal s_mem_estado: tp_EST_mem;
signal s_mem_datos: tp_DAT_mem;
signal s_mem_memoria: RAM_mem;

signal s_derechos_acceso: std_logic;
signal s_estado: tipoestado;
signal s_pet: tp_contro_e;

signal s_AF: std_logic;
signal s_est: std_logic;
signal s_control: tp_contro_cam_cntl;

signal s_peticion, s_reg_pet: tp_peticion;

signal s_esperado: st_palabra_dat;
signal s_consumidor_esperado: buf;

signal parar: std_logic;
signal finaltraza: std_logic:= '0';

shared variable final : boolean := false;
signal ciclo: integer:= 0;

file S, S_pro_cons: text;

constant fichero: string := "../../../RESULTADOS/resultados_ejecucion.txt";
constant fichero_pro_cons: string := "../../../RESULTADOS/productor_consumidor.txt";

begin

ensa_ca_mem: ensamblado port map (reloj => reloj, pcero => pcero, pet_proc => peticion, pet_listo => pet_listo, resp_cache => respuesta); 

-- captura de senyales internas al disenyo
-- cache: campos etqiuetas, estado y datos
	s_mem_etiq <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.camino.etiq.ET_Mem.ET_mem: tp_ET_mem >>;
	s_mem_estado <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.camino.estado.EST_mem: tp_EST_mem >>;
	s_mem_datos <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.camino.datos_ca.DAT_Mem.DAT_mem: tp_DAT_mem >>;
-- memoria
	s_mem_memoria <= << signal .prueba_ensamblado.ensa_ca_mem.memoria.memoria.mem.mem: RAM_mem >>;
-- controlador de cache: derechos de acceso, estado y peticion que se procesa
	s_derechos_acceso <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.contro.derechos_acceso: std_logic >>;
	s_estado <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.contro.estado: tipoestado >>;
	s_pet <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.contro.pet: tp_contro_e >>;
-- controlador de cache: senyales de entrada acierto/fallo, estado del bloque accedido
	s_AF <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.camino.etiq.AF: std_logic >>;
	s_est <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.camino.estado.DL: std_logic >>;
-- controlador de cache: senyales de control
	s_control <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.contro.s_control: tp_contro_cam_cntl >>;
-- cache: peticion que procesa la cache
	s_peticion <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.cache_sin.peticion: tp_peticion >>;
-- peticion en la interface procesador-cache
	s_reg_pet <= << signal .prueba_ensamblado.ensa_ca_mem.cache.cach.inter_Pr_ca.reg_pet: tp_peticion >>;


productor: process 
variable v_DIR: natural range 0 to tam_ELogico;
variable v_DATO: natural range 0 to tam_palabra ;
begin

-- fichero resumen
 	file_open(S_pro_cons,fichero_pro_cons,write_mode); 
	cabecera_resumen (fichero_pro_cons);
	file_close(S_pro_cons);

-- fichero de traza
	if imprimir_traza = 1 then
		file_open(S,fichero,write_mode); 
		cabecera_traza (fichero);
		file_close(S);
	end if;

-- puesta a cero     
	proc_puesta_cero (reloj, pcero, peticion, pet_listo, ciclo, fichero_pro_cons);

-- inicio de peticiones
	-- 
	v_DIR := DIRA; 
	v_DATO := 1;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	-- 
	v_DIR := DIRA;
	v_DATO := 1; --0
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	--
	v_DIR := DIRA; 
	v_DATO := 3;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	--encert lectura
	v_DIR := DIRA; 
	v_DATO := 3;
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

 	-- 
	v_DIR := DIRB; 
	v_DATO := 5;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	--
	v_DIR := DIRB; 
	v_DATO := 5;
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

-----

 	-- 
	v_DIR := DIRF; 
	v_DATO := 7;
	Pescritura (reloj, peticion, pet_listo, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	-- 
	v_DIR := DIRF;
	v_DATO := 7; 
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	--
	v_DIR := DIRB; 
	v_DATO := 5;
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

	--
	v_DIR := DIRF; 
	v_DATO := 7;
	Plectura (reloj, peticion, pet_listo, respuesta, s_esperado, v_DIR, v_DATO, ciclo, fichero_pro_cons);

-----
	no_hay_peticion (reloj, peticion, pet_listo, ciclo, fichero_pro_cons);
	no_hay_peticion (reloj, peticion, pet_listo, ciclo, fichero_pro_cons);

	interface_productor(reloj, pet_listo);

	report "prueba finalizada";

	parar <= '1';
	wait;       
        
end process;

consumidor: process is
variable consumo: st_palabra_dat;
variable ind: integer range 0 to 1:= 0;
variable ciclod:integer;
file S_pro_cons: text;
variable Lo, l : line;
begin

	interface_consumidor(reloj, respuesta.val);
	consumo := respuesta.DL;
	ciclod:= ciclo'delayed(0 fs);
	write(l, ciclod, right, 5);
	write (l, string'("consumo"), right, 20); 
	hwrite(l, consumo, right, 6);
	write (l, string'("load  "), right, 8); 
	hwrite(l, s_reg_pet.dir, right, 6);
	file_open(S_pro_cons,fichero_pro_cons,append_mode); 
	writeline (S_pro_cons, l);
	file_close(S_pro_cons);

	if comprobar_load = 1 then
-- comprobacion del valor leido con el esperado
		if (respuesta.DL /= s_consumidor_esperado(ind)) then 
			assert false report "valor no esperado" severity warning;
			write(Lo, string'(", leido:   "));
			write(Lo, respuesta.DL);
			write(Lo, string'(", esperado:   "));
			write(Lo, s_consumidor_esperado(ind));
			writeline(output, Lo);

			write(l, string'("valor no esperado "));
			write(l, string'(", leido:   "));
			write(l, respuesta.DL);
			write(l, string'(", esperado:   "));
			write(l, s_consumidor_esperado(ind));
			file_open(S_pro_cons,fichero_pro_cons,append_mode); 
			writeline (S_pro_cons, l);
			file_close(S_pro_cons);
		end if;
		ind := (ind +1)mod 2;
	end if;

---
--	end if;

end process;

captura: process is
variable v_s_peticion: tp_peticion;
variable esperado, consumo: st_palabra_dat;
variable ind: integer range 0 to 1:= 0;
variable ciclod:integer;
file S_pro_cons: text;
variable Lo, l : line;
begin
--	capturar valor esperado en una instruccion load (s_esperado)
	interface_productor(reloj, pet_listo);
	if peticion.acc = '1' and peticion.esc = '0' and peticion.ini = '0' then
		esperado := s_esperado; --ver
		s_consumidor_esperado(ind) <= esperado;
		ind := (ind +1)mod 2;
	end if;

end process;


traza: if imprimir_traza = 1 generate
impri_accesos: process(reloj) is
variable l : line;
variable linea_S : line;

variable v_peticion: tp_peticion;
variable v_respuesta: tp_respuesta;
variable v_pet_listo: st_cache_listo;

variable v_derechos_acceso: std_logic;
variable v_estado: tipoestado;
variable v_pet: tp_contro_e;

variable v_AF: std_logic;
variable v_est: std_logic;
variable v_control, v_control_actuacion: tp_contro_cam_cntl;

variable v_s_peticion, v_s_reg_pet: tp_peticion;

variable v_LISTO_previo: std_logic;

variable ciclod:integer;
variable cnt, cnt_sigue: integer := 0;

begin
	if reloj'event and reloj ='1' then
		v_pet_listo:= pet_listo'delayed(0 fs);
		if ciclo >= 5 and finaltraza = '0' then
			v_peticion:= peticion'delayed(0 fs);
			v_respuesta:= respuesta'delayed(0 fs);
			v_estado:= s_estado'delayed(0 fs);
			v_pet:= s_pet'delayed(0 fs);
			v_AF:= s_AF'delayed(0 fs);

			v_est:= s_est'delayed(0 fs);
			v_control:= s_control'delayed(0 fs);
			v_s_peticion := s_peticion'delayed(0 fs);
			v_s_reg_pet := s_reg_pet'delayed(0 fs);
			v_s_peticion.dir := v_s_reg_pet.dir;

			ciclod:= ciclo'delayed(0 fs);

			impri_traza (v_pet_listo, v_s_peticion, v_peticion, v_AF, v_est, v_estado,
					s_mem_etiq, s_mem_estado, s_mem_datos, s_mem_memoria,
					v_control_actuacion,
 					ciclod, cnt, cnt_sigue, fichero);
-------
		v_control_actuacion := v_control;
		end if;

		if parar = '1' then
			finaltraza <= '1';
		end if;
	end if;

end process;
end generate traza;



finalizar: process is
begin
	wait until parar = '1';
	final := true;
	if imprimir_cache = 1 then
		impri_cache(s_mem_etiq, s_mem_estado, s_mem_datos, fichero_pro_cons);
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
