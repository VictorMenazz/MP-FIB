--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_componentes_pkg.all;

entity sumador is
port (a: in  st_dat;
	b: in  st_dat;
	s: out st_dat);
end sumador;

architecture compor of sumador is
begin 

resta: process(a,b)
variable ua, ub: unsigned(tam_dat-1 downto 0);
begin
	ua := unsigned(a);
	ub := unsigned(b);
	s <= std_logic_vector(ua - ub) after retsumador;
end process;

end;
