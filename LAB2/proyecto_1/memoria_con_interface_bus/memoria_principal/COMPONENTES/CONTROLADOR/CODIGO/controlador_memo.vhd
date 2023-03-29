--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.retardos_memorias_pkg.all;

entity controlador_memo is
	port (MPET: in  std_logic;
		MVAL: out std_logic);
end controlador_memo;

architecture compor of controlador_memo is
begin

MVAL <= MPET after retcnt_mem;

end;

