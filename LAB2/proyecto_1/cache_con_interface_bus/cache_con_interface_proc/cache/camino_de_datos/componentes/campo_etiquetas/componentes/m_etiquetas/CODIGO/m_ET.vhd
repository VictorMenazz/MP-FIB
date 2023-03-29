--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.param_memorias_pkg.all;
use work.retardos_memorias_pkg.all;
use work.campo_ET_pkg.all;
--! @image html m_ET.png 

entity m_ET is
port (reloj: in std_logic;
	M_e: in  tp_metq_e;
	DL: out st_etiqueta);
end m_ET;

architecture compor of m_ET is
signal  t_indice : st_indice;
signal  ET_mem: tp_ET_mem;

begin

t_indice <= to_integer(unsigned(M_e.dir)) after ret_deco_etiq;

process(reloj)
begin
	if (rising_edge(reloj)) then
		if(M_e.acc = '1') then 
			if (M_e.esc = '1') then
				ET_mem(t_indice) <= M_e.DE after ret_etiq_esc;
			end if;
			DL <= ET_mem(t_indice) after ret_etiq_leer;
		end if;
	end if;
end process;
end compor;


