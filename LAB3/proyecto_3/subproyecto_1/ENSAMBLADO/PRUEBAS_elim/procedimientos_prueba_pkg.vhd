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
use work.acciones_pkg.all;

package procedimientos_prueba_pkg is

function es_pet_lectura (signal peticion: tp_peticion) return boolean;   

procedure consumo_ciclo (cache: integer; ciclod: in integer; consumo: in st_palabra_dat; signal s_peticion: in tp_peticion; fichero_pro_cons: in string);

procedure comprobar_valor_load (signal respuesta: in tp_respuesta; esperado: in st_palabra_dat; fichero_pro_cons: in string);

end package procedimientos_prueba_pkg;

package body procedimientos_prueba_pkg is

function es_pet_lectura (signal peticion: tp_peticion) return boolean is
variable es_lectura: boolean:= FALSE;
begin
	es_lectura := (peticion.acc = '1' and peticion.esc = '0' and peticion.ini = '0'); --(pet.esc = lectura )
return (es_lectura);
end es_pet_lectura;   

procedure consumo_ciclo (cache: integer; ciclod: in integer; consumo: in st_palabra_dat; signal s_peticion: in tp_peticion; fichero_pro_cons: in string) is
file S: text;
variable l : line;
begin
		write(l, ciclod, right, 5);
		write (l, string'("consumo. valor"), right, 20+7); 
		hwrite(l, consumo, right, 6);
		write (l, string'("load  "), right, 8); 
		hwrite(l, s_peticion.dir, right, 6);
		write (l, string'("proc."), right, 7); 
		write (l, integer'(cache), right, 3); 
		file_open(S,fichero_pro_cons,append_mode); 
		writeline (S, l);
		file_close(S);
end procedure; 

procedure comprobar_valor_load (signal respuesta: in tp_respuesta; esperado: in st_palabra_dat; fichero_pro_cons: in string) is
file S: text;
variable Lo, l : line;
begin
	if (respuesta.DL /= esperado) then 
	assert false report "valor no esperado" severity warning;
		write(Lo, string'(", leido:   "));
		write(Lo, respuesta.DL);
		write(Lo, string'(", esperado:   "));
		write(Lo, esperado);
		writeline(output, Lo);

		write(l, string'("valor no esperado "));
		write(l, string'(", leido:   "));
		write(l, respuesta.DL);
		write(l, string'(", esperado:   "));
		write(l, esperado);
		file_open(S,fichero_pro_cons,append_mode); 
		writeline (S, l);
		file_close(S);
	end if;
end procedure; 


end package body procedimientos_prueba_pkg;

