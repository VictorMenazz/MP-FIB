--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.interface_pkg.all;

package componentes_reg_con_guarda_pkg is

component reg_guarda is
	port (reloj, pcero: in std_logic;
		rdv_e: in posterior_1;
		rl_s: out anterior;
		rdv_s: out posterior_1;
		rl_e: in anterior);
end component;

component reg_cabeza is
	port (reloj, pcero: in std_logic;
		rdv_e: in posterior_1;
		rl_s: out anterior;
		rdv_s: out posterior_1;
		rl_e: in anterior);
end component;

end package componentes_reg_con_guarda_pkg;
