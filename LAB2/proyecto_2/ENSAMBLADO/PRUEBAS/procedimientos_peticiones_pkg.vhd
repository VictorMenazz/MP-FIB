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

package procedimientos_peticiones_pkg is

procedure cabecera_resumen (fichero: in string);

procedure store_inicio (signal reloj: in std_logic; signal pet: out tp_peticion;  
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra);
procedure inicio (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; 
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; signal ciclo: integer; fichero: in string);

procedure interface_productor(signal reloj: in std_logic; signal listo: in std_logic);
procedure interface_consumidor(signal reloj: in std_logic; signal valido: in std_logic);

procedure load (signal reloj: in std_logic; signal pet: out tp_peticion; signal esperado: out st_palabra_dat;
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra);
procedure Plectura (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; signal respuesta: in tp_respuesta; signal esperado: out st_palabra_dat;
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; signal ciclo: integer; fichero: in string);

procedure store (signal reloj: in std_logic; signal pet: out tp_peticion;  
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra);
procedure Pescritura (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; 
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; signal ciclo: integer; fichero: in string);

procedure no_hay_peticion (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; signal ciclo: integer; fichero: in string);

procedure proc_puesta_cero (signal reloj: in std_logic; signal pcero: out std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; signal ciclo: integer; fichero: in string);

end package procedimientos_peticiones_pkg;

package body procedimientos_peticiones_pkg is
  
constant retardo: time := 3 ns;
constant SI: std_logic:= '1';

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

procedure interface_productor(signal reloj: in std_logic; signal listo: in std_logic) is
begin
	wait until rising_edge(reloj) and listo = SI;
end procedure;

procedure interface_consumidor(signal reloj: in std_logic; signal valido: in std_logic) is
begin
	wait until rising_edge(reloj) and valido = SI;
end procedure;

procedure store_inicio (signal reloj: in std_logic; signal pet: out tp_peticion;  
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra) is
variable dir: st_dir;
variable valor: st_elem_dat;
begin
-- Nueva peticion generada
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	pet.acc <= '1' after retardo;
	pet.ini <= '1' after retardo;
 	pet.esc <= '0' after retardo;
	pet.dir <= dir after retardo;
	pet.DE <= valor after retardo;
end procedure; 

procedure inicio (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; 
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; signal ciclo: integer; fichero: in string) is
variable dir: st_dir;
variable valor: st_elem_dat;
file S: text;
variable l : line;
begin
-- Peticion  
	store_inicio (reloj, pet, v_DIR, v_DATO);
-- Actualizar fichero. Instante de generacion de la peticion
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	write(l, ciclo, right, 5);
	write (l, string'("peticion de inicio"), right, 20); 
	hwrite(l, dir, right, 6);
	hwrite(l, valor, right, 6);
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);

	interface_productor(reloj, pet_listo);
end procedure; 

procedure load (signal reloj: in std_logic; signal pet: out tp_peticion; signal esperado: out st_palabra_dat;
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra) is
variable dir: st_dir;
variable valor: st_palabra_dat; -- st_elem_dat

begin
-- Generando nueva peticion. Valores indeterminados
	pet.acc <= '0' after retardo;
	pet.ini <= '0' after retardo;
 	pet.esc <= '0' after retardo;
	pet.dir <= (others => '0') after retardo; 
	pet.DE <= (others => 'U') after retardo;
	wait until falling_edge(reloj);
-- Nueva peticion generada
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	esperado <= valor;
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
 	pet.esc <= '0' after retardo;
	pet.dir <= dir after retardo;
	pet.DE <= (others => 'U') after retardo; --U    

end procedure;

procedure Plectura (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; signal respuesta: in tp_respuesta; signal esperado: out st_palabra_dat;
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; signal ciclo: integer; fichero: in string) is
variable dir: st_dir;
variable l: line;
file S: text;
begin
-- Peticion   
	load (reloj, pet, esperado, v_DIR, v_DATO);
-- Actualizar fichero. Instante de generacion de la peticion
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	write(l, ciclo, right, 5);
	write (l, string'("prod. load"), right, 20); 
	hwrite(l, dir, right, 6);
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);

	interface_productor(reloj, pet_listo);
-- Actualizar fichero. Instante en el cual se inicia el procesado por la cache 
	write(l, ciclo-1, right, 5);
	write (l, string'("load cache"), right, 20); 
	hwrite(l, dir, right, 6);
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);
end procedure;

procedure store (signal reloj: in std_logic; signal pet: out tp_peticion;  
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra) is
variable dir: st_dir;
variable valor: st_elem_dat;
begin
-- Generando nueva peticion. Valores indeterminados
	pet.acc <= '0' after retardo;
	pet.ini <= '0' after retardo;
 	pet.esc <= '0' after retardo;
	pet.dir <= (others => '0') after retardo; 
	pet.DE <= (others => 'U') after retardo;
	wait until falling_edge(reloj);
-- Nueva peticion generada
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	pet.acc <= '1' after retardo;
	pet.ini <= '0' after retardo;
 	pet.esc <= '1' after retardo;
	pet.dir <= dir after retardo;
	pet.DE <= valor after retardo;

end procedure;

procedure Pescritura (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; 
					variable v_DIR: in natural range 0 to tam_ELogico; variable v_DATO: in natural range 0 to tam_palabra; signal ciclo: integer; fichero: in string) is
variable dir: st_dir;
variable valor: st_elem_dat;
file S: text;
variable l : line;
begin
-- Peticion 
	store (reloj, pet, v_DIR, v_DATO);
-- Actualizar fichero. Instante de generacion de la peticion
	dir:= std_logic_vector(to_unsigned(v_DIR, st_dir'length));
	valor:= std_logic_vector(to_unsigned(v_DATO, st_elem_dat'length));
	write(l, ciclo, right, 5);
	write (l, string'("prod. store"), right, 20); 
	hwrite(l, dir, right, 6);
	hwrite(l, valor, right, 6);
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);

	interface_productor(reloj, pet_listo);
-- Actualizar fichero. Instante en el cual se inicia el procesado por la cache 
	write(l, ciclo-1, right, 5);
	write (l, string'("store cache"), right, 20); 
	hwrite(l, dir, right, 6);
	hwrite(l, valor, right, 6);
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);
end procedure;

procedure no_hay_peticion (signal reloj: in std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; signal ciclo: integer; fichero: in string) is
file S: text;
variable l : line;
begin
-- Peticion 
	pet.acc <= '0' after retardo;
	pet.ini <= '0' after retardo;
 	pet.esc <= '0' after retardo;
	pet.dir <= (others => '0') after retardo; --U 
	pet.DE <= (others => 'U') after retardo; --U    
-- Actualizar fichero. Instante de generacion de la peticion
	write(l, ciclo, right, 5);
	write (l, string'("no hay peticion"), right, 20); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);  

	interface_productor(reloj, pet_listo);
end procedure;

procedure  proc_puesta_cero (signal reloj: in std_logic; signal pcero: out std_logic; signal pet: out tp_peticion; signal pet_listo: in st_cache_listo; signal ciclo: integer; fichero: in string) is
file S: text;
variable l : line;
begin
	pcero <= '1'; 
	no_hay_peticion (reloj, pet, pet_listo, ciclo, fichero);
	wait until rising_edge(reloj);
	pcero <= '0' ; 

	wait until rising_edge(reloj);
	interface_productor(reloj, pet_listo);
-- Actualizar fichero. Instante de finalizacion de la puesta a cero
	write(l, ciclo, right, 5);
	write (l, string'("final de puesta a cero"), right, 26); 
	file_open(S,fichero,append_mode); 
	writeline (S, l);
	file_close(S);
end procedure;

end package body procedimientos_peticiones_pkg;
