--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.param_disenyo_pkg.all;
use work.campo_DAT_pkg.all;

entity prueba_m_DAT is 

end entity;

architecture prueba of prueba_m_DAT is

component m_DAT is
port (reloj: in  std_logic;
	M_e: in  tp_mdat_e;
	DL: out st_elem_dat);
end component;

procedure wait_until_falling_edges(signal reloj: in std_logic; n: in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure escritura (signal M_e: out tp_mdat_e; signal reloj: in std_logic; 
                     entrada: in st_dir_conjunto; dato: in st_elem_dat) is
begin
    wait_until_falling_edges(reloj,1);
    M_e.acc <= '1';
    M_e.esc <= '1';
    M_e.dir <= entrada;
    M_e.DE <= dato;
end procedure;

procedure lectura_comprobacion (signal M_e: out tp_mdat_e; signal DL: in st_elem_dat; signal reloj: in std_logic; 
                   entrada: in st_dir_conjunto; datoL: in st_elem_dat) is
variable L: line;
begin
    wait_until_falling_edges(reloj,1);
    M_e.acc <= '1';
    M_e.esc <= '0';
    M_e.dir <= entrada;
    wait_until_falling_edges(reloj,1);
    if (DL /= datoL) then 
      assert false report "valor no esperado" severity warning;
      write(L, string'(", esperado:   "));
      write(L, DL);
      write(L, string'(", leido:   "));
      write(L, datoL);
      writeline(output, L);
    end if;
end procedure;


signal M_e: tp_mdat_e;
signal DL: st_elem_dat;

signal reloj: std_logic;

shared variable final : boolean := false;

begin

datos: m_DAT port map(reloj => reloj, M_e => M_e, DL => DL);

process
variable dir: st_dir_conjunto;
variable valor: st_elem_dat;
variable v_dir: std_logic_vector(2 downto 0);
variable v_valor: std_logic_vector(7 downto 0);
variable direccion: st_dir;
variable etiqueta: st_elem_dat;
variable conjunto: st_dir_conjunto;

begin
    -- escrituras en memoria
	v_dir:= "100";
	v_valor:= "01111111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    escritura(M_e, reloj, dir, valor);

    -- lecturas en memoria
	v_dir:= "100";
	v_valor:= "01111111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    lectura_comprobacion(M_e, DL, reloj, dir, valor);

   -- escrituras en memoria
	v_dir:= "100";
	v_valor:= "10000001";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    escritura(M_e, reloj, dir, valor);

	v_dir:= "010";
	v_valor:= "10111111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    escritura(M_e, reloj, dir, valor);

	v_dir:= "001";
	v_valor:= "11011111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    escritura(M_e, reloj, dir, valor);

   -- lecturas en memoria
	v_dir:= "010";
	v_valor:= "10111111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    lectura_comprobacion(M_e, DL, reloj, dir, valor);

   -- escrituras en memoria
	v_dir:= "010";
	v_valor:= "00111000";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    escritura(M_e, reloj, dir, valor);

	v_dir:= "001";
	v_valor:= "11011111";
	dir:= std_logic_vector(resize(unsigned(v_dir), st_dir_conjunto'length));
	valor:= std_logic_vector(resize(unsigned(v_valor), st_elem_dat'length));
    lectura_comprobacion(M_e, DL, reloj, dir, valor);


    
    assert false report "Comprobacion finalizada." severity note;
	 final := true;
    wait;
end process;

  
rlj:process
begin
  if final = false then
    reloj <= '0';
    wait for 10 ns;
    reloj <= '1';
    wait for 10 ns;
	else
	  wait;
	end if;
end process;
 
end prueba;

