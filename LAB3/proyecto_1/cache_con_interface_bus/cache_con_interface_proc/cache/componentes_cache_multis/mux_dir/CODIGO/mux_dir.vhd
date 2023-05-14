--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;

entity mux_dir is      
port (a, b: in  st_dir;
	sel: in std_logic;
	s: out st_dir);
end mux_dir;

architecture compor of mux_dir is  

begin
	s <= a when (sel = '0') else b;  
end compor;




