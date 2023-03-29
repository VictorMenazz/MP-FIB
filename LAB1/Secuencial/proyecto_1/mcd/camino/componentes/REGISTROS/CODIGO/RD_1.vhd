--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;

use work.retardos_componentes_pkg.all;

entity RD_1 is							-- registro con inicializacion a cero asincrona
  port (reloj, pcero: in std_logic;		-- pes: senyal de inicializacion
         e: in std_logic;
         s: out std_logic);
end;

architecture comportamiento of RD_1 is
  begin
     process (reloj, pcero) begin
       if pcero = '1' then s <= '0' after retREGDES;
       elsif rising_edge(reloj) then
              s <= e after retREGDES;
       end if;
     end process;
end;

