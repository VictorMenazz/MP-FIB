--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.componentes_arb_circular_pkg.all;

entity arbitraje is 	
	generic(n: natural:=2);									
	port(reloj, pcero: std_logic;
		peticiones: in std_logic_vector(n-1 downto 0);
		concesiones: out std_logic_vector(n-1 downto 0));
end arbitraje;

architecture estructural of arbitraje is
signal prioridades: std_logic_vector(n-1 downto 0);
signal t_concesiones: std_logic_vector(n-1 downto 0);
signal or_reduce: std_logic_vector(n-1 downto 0);
signal or_reduc: std_logic;
begin
or_reduce <= (or_reduce(n-2 downto 0) & '0') or peticiones;
or_reduc <= or_reduce(n-1);

pri: RD_arbi_1 port map (reloj => reloj, pini => pcero, pe => or_reduc, e => t_concesiones(n-1), s => prioridades(0));
rest:	for i in 1 to n-1 generate
ele:		RD_arbi_0 port map  (reloj => reloj, pini => pcero, pe => or_reduc, e => t_concesiones(i-1), s => prioridades(i));
		end generate rest;

arbi:	arb_propa generic map (n => n)
				port map (peticiones => peticiones, prioridades => prioridades, concesiones => t_concesiones);

concesiones <= t_concesiones;
end;
