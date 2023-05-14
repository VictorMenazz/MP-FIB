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

package impri_memoria_pkg is
procedure cabecera_memoria(fichero: in string);
procedure imprimir(i:in integer; datoLeido: in st_palabra_dat; fichero: in string);
procedure imprimir_puntos(fichero: in string);
procedure impri_memoria(mem_datos: in RAM_mem; fichero: in string);

end package impri_memoria_pkg;

package body impri_memoria_pkg is

procedure cabecera_memoria(fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
	file_open(S,fichero,append_mode); 
	write (linea_S, string'(LF & CR & " Contenido de la memoria. Informacion en hexadecimal" & LF & CR)); 
	writeline (S, linea_S);
	file_close(S);

	write (l, string'(LF & CR & " Contenido de la memoria. Informacion en hexadecimal" & LF & CR));
	writeline(output, l);
	write (l, string'("direccion   dato"& LF));
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure cabecera_memoria;

procedure imprimir(i:in integer; datoLeido: in st_palabra_dat; fichero: in string)is
variable dirmod4: integer;
variable dirdiv4: integer;
file S: text;
variable linea_S : line;
variable l : line;
begin
	hwrite(l, std_logic_vector(to_unsigned(i,dir_bits)), right, 8);
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
	write(l, string'(" . . . . . . . "));
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);
end procedure imprimir_puntos;

procedure impri_memoria(mem_datos: in RAM_mem; fichero: in string) is

variable datoLeido_local : st_palabra_dat;
variable datoLeido, previo_datoLeido: st_palabra_dat;
variable previo_igual: std_logic;
variable v_imprimir: std_logic;
variable num_iguales:integer;
variable cero: st_palabra_dat:= (others => 'U');
variable dirD_ini: integer;

begin
	cabecera_memoria(fichero);
	previo_igual:= '0';
	v_imprimir:= '1';
	num_iguales:= 0;
	previo_datoLeido:= cero;

	for i in 0 to tam_ELogico-1 loop
--	for i in 0 to 30 - 1 loop
		datoLeido := mem_datos(i);
		if previo_igual = '1' then
			if previo_datoLeido  = datoLeido then
				num_iguales:= num_iguales +1;
			else
				if num_iguales >= 1 then
					imprimir_puntos(fichero);
				end if;
				imprimir(i-1, previo_datoLeido, fichero);
				num_iguales:= 0;
			end if;
		end if;
		if previo_datoLeido  = datoLeido and i /= 0 then
			previo_igual:= '1';
		else
			imprimir(i, datoLeido, fichero);
			previo_igual:= '0';
			previo_datoLeido:= datoLeido;
		end if;	
	end loop;

end procedure impri_memoria;

end package body impri_memoria_pkg;

