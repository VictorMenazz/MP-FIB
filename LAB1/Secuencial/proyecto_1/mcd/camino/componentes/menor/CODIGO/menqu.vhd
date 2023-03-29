--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.retardos_componentes_pkg.all;

entity menqu is
port(L1, L2: in st_dat;
	meu: out std_logic);
end menqu;

architecture comport of menqu is
begin
	meu <= meuSI after retmenor when (unsigned(L1) < unsigned(L2)) else meuNO after retmenor;
end;
