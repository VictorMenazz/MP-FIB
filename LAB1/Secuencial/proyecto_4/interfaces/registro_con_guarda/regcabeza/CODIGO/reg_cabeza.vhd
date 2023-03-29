--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
use work.interface_pkg.all;

entity reg_cabeza is
	port (reloj, pcero: in std_logic;
		rdv_e: in posterior_1;
		rl_s: out anterior;
		rdv_s: out posterior_1;
		rl_e: in anterior);
end;
  
architecture estruc of reg_cabeza is

begin

re_ca_D: RD_N_pe port map (reloj => reloj, pcero => pcero, pe => rl_e.listo, e => rdv_e.dat, s => rdv_s.dat);

re_ca_V: RD_1_pe port map (reloj => reloj, pcero => pcero, pe => rl_e.listo, e => rdv_e.val, s => rdv_s.val);

rl_s.listo <= rl_e.listo;

end;

