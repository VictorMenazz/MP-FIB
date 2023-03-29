--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_mcd_pkg.all;
use work.interface_pkg.all;
--! @image html interface.png 

entity etapa_mcd is
   port (reloj, pcero: std_logic;
	pet_dv: in posterior_2;
	pet_l: out anterior; --atras
	resp_dv: out posterior_1;
	resp_l: in anterior); --atras
end etapa_mcd;

architecture estruc of etapa_mcd is
alias a: st_dat is pet_dv.dat_a;
alias b: st_dat is pet_dv.dat_b;
alias op_dis: std_logic is pet_dv.val;
alias desocupada: std_logic is pet_l.listo;

alias s: st_dat is resp_dv.dat;
alias finalizada: std_logic is resp_dv.val;
alias consumo: std_logic is resp_l.listo;

begin

pr_mcd: mcd port map (reloj => reloj, pcero => pcero, a => a , b => b, op_dis => op_dis, consumo => consumo, 
		finalizada => finalizada, desocupada => desocupada, s => s);

end;

