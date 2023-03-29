--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_otros_pkg.all;

entity registro_etiq is   
port (reloj, pe: in  std_logic;
	e: in  st_etiqueta;
	s: out st_etiqueta);
end registro_etiq;

architecture compor of registro_etiq is  
begin
process(reloj)
begin
	if (rising_edge(reloj)) then
		if pe = '1' then
	      s <= e after ret_reg_etiq;
		end if;
	end if;
end process;
end compor;


