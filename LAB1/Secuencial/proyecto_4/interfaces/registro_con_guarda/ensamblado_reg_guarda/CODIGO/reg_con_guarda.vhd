--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;
use work.componentes_reg_con_guarda_pkg.all;
use work.interface_pkg.all;

entity reg_con_guarda is
	port (reloj, pcero: in std_logic;
		rdv_e: in posterior_1;
		rl_s: out anterior;
		rdv_s: out posterior_1;
		rl_e: in anterior);
end;
  
architecture estruc of reg_con_guarda is
signal guarda_dv_s: posterior_1;
signal cabeza_l_s: anterior;
begin

reg_gua: reg_guarda port map (reloj => reloj, pcero => pcero, rdv_e => rdv_e, rl_s =>  rl_s, rdv_s => guarda_dv_s, rl_e => cabeza_l_s);

reg_cab: reg_cabeza port map (reloj => reloj, pcero => pcero, rdv_e => guarda_dv_s, rl_s => cabeza_l_s , rdv_s => rdv_s, rl_e => rl_e);



end;

