--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.componentes_memoria_pkg.all;
--! @image html mem_mas_contro.png 

entity ensamblado_memoria is
	port (reloj: in  std_logic;
		ED: in  st_elem_dat;
		dir: in  st_dir;
		MPET, MLES: in  std_logic;
		MVAL: out std_logic;
		LD: out st_elem_dat);
end ensamblado_memoria;

architecture estruc of ensamblado_memoria is
signal PEM: std_logic;
signal reg_MPET: std_logic;
begin

-- registro asociado al controlador de memoria
regMPET: RC_1 port map (reloj => reloj, e => MPET , s => reg_MPET);
--controlador de memoria
contro: controlador_memo port map(MPET => reg_MPET, MVAL => MVAL);

--memoria
mem: memoria_mem port map (reloj => reloj, MPET => MPET, ED => ED, dir => dir, pe => MLES, LD => LD);

end;


