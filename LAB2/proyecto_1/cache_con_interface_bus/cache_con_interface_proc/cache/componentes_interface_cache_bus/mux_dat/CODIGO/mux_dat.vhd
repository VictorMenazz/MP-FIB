--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;

entity mux_dat is      
port (a, b: in  st_palabra_dat;
	sel: in std_logic;
	s: out st_palabra_dat);
end mux_dat;

architecture compor of mux_dat is  

begin
 
  s <= a when (sel = '0') else b;
	  
end compor;




