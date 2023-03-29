--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_componentes_pkg.all;

entity igual_cero is
port(L1: in  st_dat;
	ig:	out std_logic );
end igual_cero;

architecture comport of igual_cero is
constant cero: st_dat:= (others => '0');
begin
	ig <= igSI after retcero when (L1 = cero) else igNO after retcero;
end;
