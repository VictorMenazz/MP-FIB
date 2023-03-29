--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.cache_pkg.all;
use work.retardos_otros_pkg.all;

entity mux_pet is      
port (a, b: in  tp_peticion;
	sel: in std_logic;
	s: out tp_peticion);
end mux_pet;

architecture compor of mux_pet is  

begin
 
  s <= a after ret_mux_pet when (sel = '0') else b after ret_mux_pet;
	  
end compor;




