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

component modulo is 
	port(reloj, pini, u, c: in std_logic; sal: out std_logic);
end component;

type t_mat_ors is array (0 to n-1) of std_logic_vector(0 to n - 2);
type t_mat is array (0 to n-1) of std_logic_vector(0 to n-1)
signal ors_data: t_mat := (other => (others => '0'));
signal tempsalidas: std_logic_vector(0 to n-1);
signal ors: t_mat_ors;

begin

mods_outer: for i in 0 to n-1 generate
	signal tmpor: std_logic_vector(n-1 downto 0);
begin
	mods_salidas: for j in i+1 to n-1 generate
		signal tmp: std_logic;
	begin
		mymod: modulo port map(reloj => reloj, pini => pcero, u => tempsalidas(i), c => tempsalidas(j), sal => tmp);
		ors_data(i)(j) <= tmp and peticiones(j);
		ors_data(j)(i) <= (not tmp) and peticiones(j);
	end generate;
	tmpor(0) <= ors_data(i)(0);
	or_gen: for k in 1 to n-1 generate begin
		tmpor(k) <= tmpor(k-1) or ors_data(i)(k);
	end generate;
	tempsalidas(i) <= peticiones(i) and not tmpor(n-1);
	t_concesiones(i) <= tempsalidas(i) after ret_arb;
end generate;
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
