--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.multis_pkg.all;
use work.componentes_arbitraje_pkg.all;
--! @image html arbitro.png 

entity arbitro is 										
	port(reloj, pcero: in  std_logic;
		arb_control: in st_arb_peticion;
		fin_trans: std_logic;
		arb_peticion: in st_arb_peticion;
		arb_concesion: out st_arb_concesion);
end arbitro;

architecture estructural of arbitro is
signal t_arb_concesion: std_logic;
signal reg_fin_trans: std_logic;
signal t_arb_conc_and: st_arb_concesion;
signal prx_estado, estado: std_logic;
begin

-- interface con el bus. Senyal de finalizacion de transaccion
reg_mval: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => fin_trans, s => reg_fin_trans);

-- arbitraje
arbi: arbitraje port map (arb => arb_control, peticion => arb_peticion, concesion => t_arb_concesion);

-- estado del arbitro
prx_estado <=((not reg_fin_trans) and estado) or ((not estado) and t_arb_concesion);
arb_est: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => prx_estado, s => estado);

--logica de salida. Interface con el CC
t_arb_conc_and <= t_arb_concesion and (not estado);
reg_conc: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => t_arb_conc_and, s => arb_concesion);


end;
