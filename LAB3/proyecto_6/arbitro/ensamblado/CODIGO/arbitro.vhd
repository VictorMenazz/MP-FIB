--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.multis_pkg.all;
use work.componentes_arbitraje_pkg.all;
use work.retardos_arbitro_pkg.all;
--! @image html arbitro_multi.png 

entity arbitro is 										
	port(reloj, pcero: in  std_logic;
		fin_trans: std_logic;
		arb_peticiones: in st_arb_peticiones;
		arb_concesiones: out st_arb_concesiones);
end arbitro;

architecture estructural of arbitro is
signal t_arb_concesiones: st_arb_concesiones;
signal reg_fin_trans: std_logic;
signal or_concesiones: st_arb_concesiones;
signal or_conce: std_logic;
signal t_arb_conc_and: st_arb_concesiones;
signal prx_estado, estado: std_logic;
begin

-- interface con el bus. Senyal de finalizacion de transaccion
reg_mval: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => fin_trans, s => reg_fin_trans);

-- arbitraje
--arbi: arbitraje port map (arb => arb_control, peticiones => arb_peticiones, concesiones => t_arb_concesiones);
arbi: arbitraje port map (reloj => reloj, pcero => pcero, peticiones => arb_peticiones, concesiones => t_arb_concesiones);

--hay concesion
or_concesiones(0) <= t_arb_concesiones(0); 
or_con: for i in 1 to Nproc-1 generate
	or_concesiones(i) <= t_arb_concesiones(i) or or_concesiones(i-1);
end generate;
or_conce <= or_concesiones(Nproc-1) after ret_or_conc;

-- estado del arbitro
prx_estado <=((not reg_fin_trans) and estado) or ((not estado) and or_conce);
arb_est: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => prx_estado, s => estado);

--logica de salida. Interface con el CC
coc_and: for i in 0 to Nproc-1 generate
	t_arb_conc_and(i) <= t_arb_concesiones(i) and (not estado);
end generate;
reg_conc: RD_arbi port map (reloj => reloj, pcero => pcero, e => t_arb_conc_and, s => arb_concesiones);

end;
