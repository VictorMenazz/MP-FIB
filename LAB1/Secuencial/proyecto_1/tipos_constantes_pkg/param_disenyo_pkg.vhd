--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

package param_disenyo_pkg is

-- Camino de datos
constant tam_dat: integer:= 8;
subtype st_dat is std_logic_vector(tam_dat-1 downto 0);

-- otros
constant meuSI: std_logic:= '1';
constant meuNO: std_logic:= '0';

constant igSI: std_logic:= '1';
constant igNO: std_logic:= '0';

constant puesta_cero: std_logic:= '1';

end package param_disenyo_pkg;
