--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_memorias_pkg.all;
use work.param_memorias_pkg.all;

entity memoria_mem is
	port (reloj	: in  std_logic;
		MPET: in std_logic;
		ED		: in  st_elem_dat;
		dir	: in  st_dir;
		pe		: in  std_logic;
		LD		: out st_elem_dat);
end memoria_mem;

architecture compor of memoria_mem is
signal  t_indice : integer;
signal mem : RAM_mem;

begin
t_indice <= to_integer(unsigned(dir)) after ret_deco_mem;

process (reloj)
begin
	if (rising_edge(reloj)) then
		if MPET = '1' then
			if (pe = '1') then
				mem(t_indice) <= ED after ret_mem;
			end if;
			LD <= mem(t_indice) after ret_mem;
		end if;
	end if;
end process;
end compor;
