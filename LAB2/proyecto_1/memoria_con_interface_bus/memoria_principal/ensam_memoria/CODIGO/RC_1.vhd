--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;
--use ieee.numeric_std.all;

use work.interface_cache_bus_pkg.all;
use work.retardos_RegDes_pkg.all;

entity RC_1 is				
  port (reloj: in std_logic;	
         e: in std_logic;
         s: out std_logic);
end;

architecture comportamiento of RC_1 is
  begin
     process (reloj) begin
--       if pcero = '1' then e <= '0' after retREGDES;
       if reloj'event and reloj = '1' then
              s <= e after retREGDES;
       end if;
     end process;
end;

