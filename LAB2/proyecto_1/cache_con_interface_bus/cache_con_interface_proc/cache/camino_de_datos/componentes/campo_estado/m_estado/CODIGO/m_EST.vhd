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
use work.campo_EST_pkg.all;
--! @image html m_EST.png 

entity m_EST is
port (reloj: in std_logic;
	M_e: in  tp_mest_e;
	DL: out st_estado);
end m_EST;

architecture compor of m_EST is
signal  t_indice : st_indice;
signal  EST_mem: tp_EST_mem;

begin

t_indice <= to_integer(unsigned(M_e.dir)) after ret_deco_estado;

process(reloj)
begin
	if (rising_edge(reloj)) then
		if(M_e.acc = '1') then 
			if (M_e.esc = '1') then
				EST_mem(t_indice) <= M_e.DE after ret_estado_esc;
			end if;
			DL <= EST_mem(t_indice) after ret_estado_leer;
		end if;
	end if;
end process;
end compor;


