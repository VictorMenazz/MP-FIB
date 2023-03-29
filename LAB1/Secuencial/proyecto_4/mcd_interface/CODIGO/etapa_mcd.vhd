--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
use work.componentes_mcd_1_pkg.all;
use work.registro_con_guarda_pkg.all;
use work.interface_pkg.all;

entity etapa_mcd is
   port (reloj, pcero: std_logic;
	pet_dv: in posterior_2;
	pet_l: out anterior; --atras
	resp_dv: out posterior_1;
	resp_l: in anterior); --atras
end etapa_mcd;

architecture estruc of etapa_mcd is
signal ent_a, ent_b: posterior_1;
signal rdv_s_a, rdv_s_b: posterior_1;
signal rl_e_a, rl_e_b: anterior;
signal rl_s_a, rl_s_b: anterior;

signal op_dis: std_logic;
signal desocupada: std_logic;

alias a: st_dat is rdv_s_a.dat;
alias reg_val_a: std_logic is rdv_s_a.val;

alias b: st_dat is rdv_s_b.dat;
alias reg_val_b: std_logic is rdv_s_b.val;

alias s: st_dat is resp_dv.dat;
alias finalizada: std_logic is resp_dv.val;
alias consumo: std_logic is resp_l.listo;

signal pe: std_logic;

begin

ent_a <= (pet_dv.dat_a, pet_dv.val);
ent_b <= (pet_dv.dat_b, pet_dv.val);

r_c_gua_a: reg_con_guarda  port map (reloj => reloj, pcero => pcero, rdv_e => ent_a, rl_s => rl_s_a, 
		rdv_s => rdv_s_a, rl_e => rl_e_a);

r_c_gua_b: reg_con_guarda  port map (reloj => reloj, pcero => pcero, rdv_e => ent_b, rl_s => rl_s_b, 
		rdv_s => rdv_s_b, rl_e => rl_e_b);

pet_l.listo <= rl_s_a.listo and rl_s_b.listo;

op_dis <= reg_val_a and reg_val_b;

pr_mcd: mcd port map (reloj => reloj, pcero => pcero, a => a , b => b, op_dis => op_dis, consumo => consumo, 
		finalizada => finalizada, desocupada => desocupada, s => s);

rl_e_a.listo <= desocupada;
rl_e_b.listo <= desocupada;

end;

