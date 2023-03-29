--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package acciones_pkg is

constant puesta_cero: std_logic:= '1';

constant peticion_proc: std_logic:= '1';
constant peticion_proc_ini: std_logic:= '1';
constant no_peticion_proc: std_logic:= '0';

constant resp_cache_listo: std_logic:= '1';
constant resp_cache_ocupado: std_logic:= '0';

constant lectura : std_logic := '0';      
constant escritura : std_logic := '1';
      
constant derechos_acceso_si : std_logic := '1';      
constant derechos_acceso_no : std_logic := '0';

constant acceso_si: std_logic:= '1';
constant acceso_no: std_logic:= '0';
constant escritura_permiso: std_logic:= '1';
constant escritura_no_permiso: std_logic:= '0';

constant peticion_memoria_si : std_logic := '1';      
constant peticion_memoria_no : std_logic := '0';
--constant memoria_lista: std_logic:= '1';

constant contenedor_valido: std_logic := '1';
constant contenedor_no_valido: std_logic := '0';

constant actualizar_campo_datos_desde_proc: std_logic := '0';
constant actualizar_campo_datos_desde_bus: std_logic := '1';
end package acciones_pkg;

