--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;
use work.componentes_pkg.all;
--! @image html camino.png 

entity camino_mcd is
   port (reloj, pcero, pe: std_logic;
	ini: std_logic;
	a, b: in st_dat;
	s: out st_dat;
	ig: out std_logic);
end camino_mcd;

architecture estruc of camino_mcd is
signal a_reg, b_reg, reg_a, reg_b, mux_a, mux_b, t_s: st_dat;
signal t_ig, meu: std_logic;

begin

muxa_ent: mux2 port map (d0 => t_s, d1 => a, SEL => ini, s => a_reg);
muxb_ent: mux2 port map (d0 => mux_b, d1 => b, SEL => ini, s => b_reg);

rega: RD_N_pe port map (reloj => reloj, pcero => pcero, pe => pe, e => a_reg, s => reg_a);
regb: RD_N_pe port map (reloj => reloj, pcero => pcero, pe => pe, e => b_reg, s => reg_b);

menor: menqu port map (L1 => reg_a, L2 => reg_b, meu => meu);

muxa: mux2 port map (d0 => reg_a, d1 => reg_b, SEL => meu, s => mux_a);
muxb: mux2 port map (d0 => reg_b, d1 => reg_a, SEL => meu, s => mux_b);
resta: sumador port map (a => mux_a, b => mux_b, s => t_s);

ig_cero: igual_cero port map (L1 => mux_b, ig => t_ig);

s <= mux_a;
ig <= t_ig;

end estruc;
