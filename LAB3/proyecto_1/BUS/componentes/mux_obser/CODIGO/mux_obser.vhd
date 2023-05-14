--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_observador_pkg.all;
use work.retardos_observador_pkg.all;

entity mux_obser is      
port (a, b: in  tp_observacion;
	sel: in std_logic;
	s: out tp_observacion);
end mux_obser;

architecture compor of mux_obser is  

begin
	s <= a after ret_mux_obs when (sel = '0') else b after ret_mux_obs;  
end compor;




