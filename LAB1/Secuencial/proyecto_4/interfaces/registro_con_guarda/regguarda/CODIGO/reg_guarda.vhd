--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
use work.interface_pkg.all;

entity reg_guarda is
	port (reloj, pcero: in std_logic;
		rdv_e: in posterior_1;
		rl_s: out anterior;
		rdv_s: out posterior_1;
		rl_e: in anterior);
end;
  
architecture estruc of reg_guarda is
signal s_guarda_dat: st_dat;
signal s_guarda_val: std_logic;
signal reg_listo, pe_guarda: std_logic;
begin

re_gu_l: RD_1 port map (reloj => reloj, pcero => pcero, e => rl_e.listo, s => reg_listo);
pe_guarda <= reg_listo and (not rl_e.listo);

re_gu_D: RD_N_pe port map (reloj => reloj, pcero => pcero, pe => pe_guarda, e => rdv_e.dat, s => s_guarda_dat);
mx_gu_D: mux2 port map (d0 => s_guarda_dat, d1 => rdv_e.dat, SEL => reg_listo, s => rdv_s.dat);

re_gu_V: RD_1_pe port map (reloj => reloj, pcero => pcero, pe => pe_guarda, e => rdv_e.val, s => s_guarda_val);
mx_gu_V: mux2_1 port map (d0 => s_guarda_val, d1 => rdv_e.val, SEL => reg_listo, s => rdv_s.val);

rl_s.listo <= reg_listo;

end;

