--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.retardos_componentes_pkg.all;

entity mux2_1 is
   port (d0, d1: in std_logic;
	SEL: in std_logic;
	s: out std_logic);
end mux2_1;

architecture comportamiento of mux2_1 is
begin
	with SEL select
		s <= d0 after retMUX2 when '0',
			d1 after retMUX2 when '1',
			'-' when others; 
end comportamiento;
