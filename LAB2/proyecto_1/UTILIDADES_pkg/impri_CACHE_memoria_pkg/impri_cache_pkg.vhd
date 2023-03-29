--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use IEEE.std_logic_textio.all;

use work.param_disenyo_pkg.all;
use work.param_memorias_pkg.all;

package impri_cache_pkg is
procedure cabecera_memoria(fichero: in string);
procedure imprimir(i:in integer; etiqLeido: in st_etiqueta; estadoLeido: in st_estado; datoLeido: in st_palabra_dat; fichero: in string);
procedure imprimir_puntos(fichero: in string);
procedure impri_cache(mem_etiq: in tp_ET_mem; mem_estado: in tp_EST_mem; mem_datos: in tp_DAT_mem; fichero: in string);

end package impri_cache_pkg;

package body impri_cache_pkg is

procedure cabecera_memoria(fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
	file_open(S,fichero,append_mode); 
	write (linea_S, string'(LF & CR & " Contenido de la cache. Informacion en hexadecimal o binario" & LF & CR)); 
	writeline (S, linea_S);
	file_close(S);

	write (l, string'(LF & CR & " Contenido de la cache. Informacion en hexadecimal o binario" & LF & CR));
	writeline(output, l);

	write (l, string'("Numero"& LF));
	write (l, string'("Contenedor      Estado"& LF));
	write (l, string'("Etiqueta      Datos"& LF), right, 27);

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure cabecera_memoria;

procedure imprimir(i:in integer; etiqLeido: in st_etiqueta; estadoLeido: in st_estado; datoLeido: in st_palabra_dat; fichero: in string)is
variable dirmod4: integer;
variable dirdiv4: integer;
file S: text;
variable linea_S : line;
variable l : line;
begin
	hwrite(l, std_logic_vector(to_unsigned(i,log_num_conjuntos)), right, 8);
	hwrite(l, etiqLeido, right, 6); 
	write(l, estadoLeido, right, 4);
	hwrite(l, datoLeido, right, 6); 
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir;

procedure imprimir_puntos(fichero: in string)is
file S: text;
variable linea_S : line;
variable l : line;
begin
	write(l, string'(" . . . . . . . . ."));
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir_puntos;

procedure impri_cache (mem_etiq: in tp_ET_mem; mem_estado: in tp_EST_mem; mem_datos: in tp_DAT_mem; fichero: in string) is

variable datoLeido: st_palabra_dat;
variable etiqLeido: st_etiqueta;
variable estadoLeido: st_estado;

begin
	cabecera_memoria(fichero);

	for i in 0 to num_conjuntos-1 loop
		etiqLeido := mem_etiq(i);
		estadoLeido := mem_estado(i);
		datoLeido := mem_datos(i);
		imprimir(i, etiqLeido, estadoLeido, datoLeido, fichero);
	end loop;

end procedure impri_cache;

end package body impri_cache_pkg;

