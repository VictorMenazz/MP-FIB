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
use work.campo_DAT_pkg.all;
--! @image html m_DAT.png 

entity m_DAT is
port (reloj: in  std_logic;
	M_e: in  tp_mdat_e;
	DL: out st_elem_dat);
end m_DAT;

architecture compor of m_DAT is
signal  t_indice : st_indice;
signal DAT_mem : tp_DAT_mem;

begin
t_indice <= to_integer(unsigned(M_e.dir)) after ret_deco_dat;

process(reloj)
begin
	if (rising_edge(reloj)) then
		if(M_e.acc = '1') then 
			if (M_e.esc = '1') then
				DAT_mem(t_indice) <= M_e.DE after ret_dat_esc;
			end if;
			DL <= DAT_mem(t_indice) after ret_dat_leer;
		end if;
	end if;
end process;
end compor;


