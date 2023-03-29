--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;		
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;

package componentes_pkg is

component mux2 is
   port (d0, d1: in st_dat;
	SEL: in std_logic;
	s: out st_dat);
end component;

component mux2_1 is
   port (d0, d1: in std_logic;
	SEL: in std_logic;
	s: out std_logic);
end component;

component RD_N_pe is							
  port (reloj, pcero, pe: in std_logic;		
         e: in st_dat;
         s: out st_dat);
end component;

component RD_N is							
  port (reloj, pcero: in std_logic;		
         e: in st_dat;
         s: out st_dat);
end component;

component RD_1_pe is
  port (reloj, pcero, pe: in std_logic;	
         e: in std_logic;
         s: out std_logic);
end component;

component RD_1 is							
  port (reloj, pcero: in std_logic;		
         e: in std_logic;
         s: out std_logic);
end component;

component igual_cero is
port(L1: in  st_dat;
	ig:	out std_logic );
end component;

component menqu is
port(L1, L2: in st_dat;
	meu: out std_logic);
end component;

component sumador is
    port (a	: in  st_dat;
          b	: in  st_dat;
          s	: out st_dat);
end component;

end package componentes_pkg;
