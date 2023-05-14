--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.param_disenyo_pkg.all;
use work.cache_pkg.all;
use work.multis_pkg.all;

package procedimientos_peticiones_pkg is
  
type v_direccion is array (0 to Nproc-1) of natural range 0 to tam_ELogico;
type v_datos is array (0 to Nproc-1) of natural range 0 to tam_palabra;
subtype st_indice_pet is natural range 0 to Nproc - 1;

procedure interface_productores(signal reloj: in std_logic; signal listo: in tp_cache_listo_multi);
procedure interface_consumidor(signal reloj: in std_logic; signal valido: in std_logic);
procedure interface_productor(signal reloj: in std_logic; signal listo: in std_logic);

procedure cabecera_resumen (fichero: in string);

procedure store_inicio (signal reloj: in std_logic; signal pet: out tp_peticiones_multi;  
					variable v_DIR: v_direccion; variable v_DATO: v_datos);

procedure inicio (signal reloj: in std_logic; signal pet: out tp_peticiones_multi; signal pet_listo: in tp_cache_listo_multi; 
					variable v_DIR: v_direccion; variable v_DATO: v_datos; signal ciclo: integer; fichero: in string);

procedure no_hay_peticion (signal reloj: in std_logic; signal pet: inout tp_peticiones_multi; cache: in natural range 0 to Nproc-1);

procedure store (signal reloj: in std_logic; signal pet: inout tp_peticiones_multi; 
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; variable cache: in natural range 0 to Nproc-1);

procedure Pescritura (signal reloj: in std_logic; signal arb_control: out st_arb_peticiones; signal pet: inout tp_peticiones_multi; signal pet_listos: in tp_cache_listo_multi; 
					variable v_DIR: v_direccion; variable v_DATO: v_datos; variable cache: in natural range 0 to Nproc-1; signal ciclo: integer; fichero: in string);

procedure load (signal reloj: in std_logic; signal pet: inout tp_peticiones_multi; signal esperado: out st_palabra_dat;
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; variable cache: in natural range 0 to Nproc-1);

procedure Plectura (signal reloj: in std_logic; signal arb_control: out st_arb_peticiones; signal pet: inout tp_peticiones_multi; signal pet_listos: in tp_cache_listo_multi; signal respuesta: in tp_respuesta_multi; signal esperado: out st_palabra_dat;
					variable v_DIR: v_direccion; variable v_DATO: v_datos; variable cache: in natural range 0 to Nproc-1; signal ciclo: integer; fichero: in string);

procedure no_hay_peticion_todos (signal reloj: in std_logic; signal pet: out tp_peticiones_multi; signal pet_listo: in tp_cache_listo_multi; signal ciclo: integer; fichero: in string);

procedure  proc_puesta_cero (signal reloj: in std_logic; signal pcero: out std_logic; signal pet: out tp_peticiones_multi; signal pet_listo: in tp_cache_listo_multi; signal ciclo: integer; fichero: in string);

end package procedimientos_peticiones_pkg;

package body procedimientos_peticiones_pkg is
  
constant retardo: time := 3 ns;
constant SI: std_logic:= '1';


procedure interface_productores(signal reloj: in std_logic; signal listo: in tp_cache_listo_multi) is
begin
	wait until rising_edge(reloj) and listo = (listo'range => '1'); 
end procedure;

procedure interface_consumidor(signal reloj: in std_logic; signal valido: in std_logic) is
begin
	wait until rising_edge(reloj) and valido = SI;
end procedure;

procedure interface_productor(signal reloj: in std_logic; signal listo: in std_logic) is
begin
	wait until rising_edge(reloj) and listo = SI;
end procedure;

procedure cabecera_resumen (fichero: in string) is
file S: text;
variable l : line;
begin
	write (l, string'("prod. store xxxx yy: productor emite store; direccion: xxxx; valor: yy" &CR & LF), right, 80); 
	write (l, string'("prod. load xxxx: productor emite load; direccion: xxxx"&CR & LF), right, 64); 
	write (l, string'("store cache xxxx yy: cache inicia procesado de store; direccion: xxxx; valor: yy" &CR & LF), right, 90); 
	write (l, string'("load cache xxxx: cache inicia procesado de load; direccion: xxxx" &CR & LF), right, 74); 
	write (l, string'("consumo. valor    yy  load    xxxx: consumidor captura el valor; direccion: xxxx; valor: yy" &CR & LF), right, 101); 

	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);

	write (l, string'("ciclo"), right, 5); 
	write (l, string'("accion"), right, 12); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);
end procedure;

procedure store_inicio (signal reloj: in std_logic; signal pet: out tp_peticiones_multi;  
					variable v_DIR: v_direccion; variable v_DATO: v_datos) is
variable dir: st_dir;
variable valor: st_elem_dat;
begin
-- Nueva peticion generada
for i in 0 to Nproc-1 loop
	pet(i).acc <= '1' after retardo;
	pet(i).ini <= '1' after retardo;
 	pet(i).esc <= '0' after retardo;
	pet(i).dir <= std_logic_vector(to_unsigned(v_DIR(i), st_dir'length)) after retardo;
	pet(i).DE <= std_logic_vector(to_unsigned(v_DATO(i), st_elem_dat'length)) after retardo;
end loop;   

end procedure; 

procedure inicio (signal reloj: in std_logic; signal pet: out tp_peticiones_multi; signal pet_listo: in tp_cache_listo_multi; 
					variable v_DIR: v_direccion; variable v_DATO: v_datos; signal ciclo: integer; fichero: in string) is
variable dir: st_dir;
variable valor: st_elem_dat;
file S: text;
variable l : line;
begin
-- Peticion  
	store_inicio (reloj, pet, v_DIR, v_DATO);
-- Actualizar fichero. Instante de generacion de la peticion
	for i in 0 to Nproc-1 loop
		dir:= std_logic_vector(to_unsigned(v_DIR(i), st_dir'length));
		valor:= std_logic_vector(to_unsigned(v_DATO(i), st_elem_dat'length));
		write(l, ciclo, right, 5);
		write (l, string'("peticion de inicio"), right, 20); 
		hwrite(l, dir, right, 6);
		hwrite(l, valor, right, 6);
		write (l, string'("proc."), right, 7); 
		write (l, integer'(i), right, 3); 
		file_open(S,fichero,append_mode); 
		writeline (S, l);
		file_close(S);
	end loop; 
	interface_productores(reloj, pet_listo);
end procedure; 

procedure no_hay_peticion (signal reloj: in std_logic; signal pet: inout tp_peticiones_multi; cache: in natural range 0 to Nproc-1) is
file S: text;
variable l : line;
begin
-- Peticion 
	pet(cache).acc <= '0' after retardo;
	pet(cache).ini <= '0' after retardo;
 	pet(cache).esc <= '0' after retardo;
	pet(cache).dir <= (others=>'0') after retardo; --U 
	pet(cache).DE <= (others => 'U') after retardo; --U  


--	interface_productores(reloj, pet_listo);
end procedure;

procedure store (signal reloj: in std_logic; signal pet: inout tp_peticiones_multi; 
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; variable cache: in natural range 0 to Nproc-1) is
variable dir: st_dir;
variable valor: st_palabra_dat; -- st_elem_dat

begin
-- Generando nueva peticion. Valores indeterminados
	pet(cache).acc <= '0' after retardo;
	pet(cache).ini <= '0' after retardo;
 	pet(cache).esc <= '0' after retardo;
	pet(cache).dir <= (others => '0') after retardo; 
	pet(cache).DE <= (others => 'U') after retardo;
	wait until falling_edge(reloj);
-- Nueva peticion generada
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	pet(cache).acc <= '1' after retardo;
	pet(cache).ini <= '0' after retardo;
 	pet(cache).esc <= '1' after retardo;
	pet(cache).dir <= dir after retardo;
	pet(cache).DE <= valor after retardo; --U    

end procedure;

procedure Pescritura (signal reloj: in std_logic; signal arb_control: out st_arb_peticiones; signal pet: inout tp_peticiones_multi; signal pet_listos: in tp_cache_listo_multi; 
					variable v_DIR: v_direccion; variable v_DATO: v_datos; variable cache: in natural range 0 to Nproc-1; signal ciclo: integer; fichero: in string) is
variable dir: st_dir;
variable valor: st_elem_dat;
variable l: line;
file S: text;
begin
for i in 0 to Nproc-1 loop --pet'range loop --0 to Nproc-1 loop
	if cache = i then
-- Peticion 
		arb_control(i) <= '1';
		store (reloj, pet, v_DIR(i), v_DATO(i), cache);
-- Actualizar fichero. Instante de generacion de la peticion
		dir:= std_logic_vector(to_unsigned(v_DIR(i), st_dir'length));
		valor:= std_logic_vector(to_unsigned(v_DATO(cache), st_elem_dat'length));
		write(l, ciclo, right, 5);
		write (l, string'("prod. store"), right, 20); 
		hwrite(l, dir, right, 6);
		hwrite(l, valor, right, 6);
		write (l, string'("proc"), right, 6); 
		write (l, integer'(i), right, 3); 
		file_open(S,fichero,append_mode); 
		writeline (S, l);
		file_close(S);
	else
		arb_control(i) <= '0';
		no_hay_peticion (reloj, pet,i);
-- Actualizar fichero. Instante de generacion de la peticion
		write(l, ciclo, right, 5);
		write (l, string'("no hay peticion"), right, 20); 
		write (l, string'("proc"), right, 6); 
		write (l, integer'(i), right, 3); 
		file_open(S,fichero,append_mode); 
		writeline (S, l);
		file_close(S);  
	end if;
end loop;

	interface_productores(reloj, pet_listos);
-- Actualizar fichero. Instante en el cual se inicia el procesado por la cache 
	write(l, ciclo-1, right, 5);
	write (l, string'("store cache"), right, 20); 
	hwrite(l, dir, right, 6);
	write (l, string'("proc"), right, 6); 
	write (l, integer'(cache), right, 3); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);

	no_hay_peticion (reloj, pet,cache);
	wait until rising_edge(reloj) and pet_listos(cache) = '1'; 
end procedure;

procedure load (signal reloj: in std_logic; signal pet: inout tp_peticiones_multi; signal esperado: out st_palabra_dat;
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; variable cache: in natural range 0 to Nproc-1) is
variable dir: st_dir;
variable valor: st_palabra_dat; -- st_elem_dat

begin
-- Generando nueva peticion. Valores indeterminados
	pet(cache).acc <= '0' after retardo;
	pet(cache).ini <= '0' after retardo;
 	pet(cache).esc <= '0' after retardo;
	pet(cache).dir <= (others => '0') after retardo; 
	pet(cache).DE <= (others => 'U') after retardo;
	wait until falling_edge(reloj);
-- Nueva peticion generada
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	esperado <= valor;
	pet(cache).acc <= '1' after retardo;
	pet(cache).ini <= '0' after retardo;
 	pet(cache).esc <= '0' after retardo;
	pet(cache).dir <= dir after retardo;
	pet(cache).DE <= (others => 'U') after retardo; --U    

end procedure;

procedure Plectura (signal reloj: in std_logic; signal arb_control: out st_arb_peticiones; signal pet: inout tp_peticiones_multi; signal pet_listos: in tp_cache_listo_multi; signal respuesta: in tp_respuesta_multi; signal esperado: out st_palabra_dat;
					variable v_DIR: v_direccion; variable v_DATO: v_datos; variable cache: in natural range 0 to Nproc-1; signal ciclo: integer; fichero: in string) is
variable dir: st_dir;
variable l: line;
file S: text;
begin

for i in 0 to Nproc-1 loop 
	if cache = i then
-- Peticion 
		arb_control(i) <= '1';
		load (reloj, pet, esperado, v_DIR(i), v_DATO(i), cache);
-- Actualizar fichero. Instante de generacion de la peticion
		dir:= std_logic_vector(to_unsigned(v_DIR(i), st_dir'length));
		write(l, ciclo, right, 5);
		write (l, string'("prod. load"), right, 20); 
		hwrite(l, dir, right, 6);
		write (l, string'("proc"), right, 6); 
		write (l, integer'(i), right, 3); 
		file_open(S,fichero,append_mode); 
		writeline (S, l);
		file_close(S);
	else
		arb_control(i) <= '0';
		no_hay_peticion (reloj, pet,i);
-- Actualizar fichero. Instante de generacion de la peticion
		write(l, ciclo, right, 5);
		write (l, string'("no hay peticion"), right, 20); 
		write (l, string'("proc"), right, 6); 
		write (l, integer'(i), right, 3); 
		file_open(S,fichero,append_mode); 
		writeline (S, l);
		file_close(S);  
	end if;
end loop;

	interface_productores(reloj, pet_listos);
-- Actualizar fichero. Instante en el cual se inicia el procesado por la cache 
	write(l, ciclo-1, right, 5);
	write (l, string'("load cache"), right, 20); 
	hwrite(l, dir, right, 6);
	write (l, string'("proc"), right, 6); 
	write (l, integer'(cache), right, 3); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);

	no_hay_peticion (reloj, pet,cache);
	wait until rising_edge(reloj) and pet_listos(cache) = '1'; 
end procedure;

procedure no_hay_peticion_todos (signal reloj: in std_logic; signal pet: out tp_peticiones_multi; signal pet_listo: in tp_cache_listo_multi; signal ciclo: integer; fichero: in string) is
file S: text;
variable l : line;
begin
-- Peticion 
for i in 0 to Nproc-1 loop
	pet(i).acc <= '0' after retardo;
	pet(i).ini <= '0' after retardo;
 	pet(i).esc <= '0' after retardo;
	pet(i).dir <= (others=>'0') after retardo; --U 
	pet(i).DE <= (others => 'U') after retardo; --U 
end loop;   
-- Actualizar fichero. Instante de generacion de la peticion
	write(l, ciclo, right, 5);
	write (l, string'("no hay peticion"), right, 20); 
	write (l, string'("todos"), right, 7); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);  

	interface_productores(reloj, pet_listo);
end procedure;

procedure  proc_puesta_cero (signal reloj: in std_logic; signal pcero: out std_logic; signal pet: out tp_peticiones_multi; signal pet_listo: in tp_cache_listo_multi; signal ciclo: integer; fichero: in string) is
file S: text;
variable l : line;
begin
	pcero <= '1'; 
	no_hay_peticion_todos (reloj, pet, pet_listo, ciclo, fichero);
	wait until rising_edge(reloj);
	pcero <= '0' ; 

	wait until rising_edge(reloj);
	interface_productores(reloj, pet_listo);
-- Actualizar fichero. Instante de finalizacion de la puesta a cero
	write(l, ciclo, right, 5);
	write (l, string'("final de puesta a cero"), right, 26); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);
end procedure;

end package body procedimientos_peticiones_pkg;
