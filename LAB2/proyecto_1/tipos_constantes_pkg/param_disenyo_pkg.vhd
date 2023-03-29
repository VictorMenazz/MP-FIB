--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package param_disenyo_pkg is

-- Camino de datos
constant dato_bits: natural:= 8;

subtype st_dato is std_logic_vector(dato_bits-1 downto 0);

-- Direccion
constant dir_bits: natural:= 16;

-- Memoria
constant tam_ELogico: integer:= 2**dir_bits; -- en bytes

subtype st_dir is std_logic_vector(dir_bits-1 downto 0);

-- bloque de datos
constant tam_byte_bits: natural := 8;
constant tam_palabra_bytes: natural := 1;
constant num_palabras_bloque: natural := 1;
constant tam_bloque_bytes: natural:= num_palabras_bloque * tam_palabra_bytes;
constant tam_palabra_bits: natural := tam_byte_bits * tam_palabra_bytes;
constant tam_bloque_bits: natural := tam_byte_bits * tam_bloque_bytes;

constant dir_byte_palabra_bits: natural := natural(log2(real(tam_palabra_bytes)));
constant dir_mod_bloque_bits: natural := natural(log2(real(tam_bloque_bytes)));
constant dir_palabra_bloq_bits: natural := dir_mod_bloque_bits - dir_byte_palabra_bits;
constant dir_bloque_bits: natural:= dir_bits - dir_mod_bloque_bits;

-- Cache
subtype st_elem_dat is std_logic_vector(tam_byte_bits-1 downto 0);
subtype st_palabra_dat is std_logic_vector(tam_palabra_bits-1 downto 0);
subtype st_bloque_dat is std_logic_vector(tam_bloque_bits-1 downto 0);

constant num_conjuntos: natural:= 8;
constant num_elem_conjunto: natural:= 1;
constant num_contenedores: natural:= num_conjuntos * num_elem_conjunto;

constant log_num_conjuntos: natural := natural(log2(real(num_conjuntos)));

constant indice_bits: natural:= natural(log2(real(num_conjuntos)));
constant elem_conjunto_bits: natural:= natural(log2(real(num_elem_conjunto)));
constant etiq_bits: natural:= dir_bloque_bits - indice_bits + elem_conjunto_bits;

subtype st_etiqueta is std_logic_vector(etiq_bits-1 downto 0); 
subtype st_dir_conjunto is std_logic_vector(indice_bits-1 downto 0);
subtype st_dir_bloque is std_logic_vector(etiq_bits+elem_conjunto_bits+indice_bits-1 downto 0);

-- bits mas significativo (mas uno) y menos significativo de los campos etiquetas (et) y conjunto (cj)
constant bitMAS_et: natural:= dir_bloque_bits;
constant bitMEN_et: natural:= bitMAS_et-etiq_bits;

constant bitMAS_cj: natural:= bitMEN_et;
constant bitMEN_cj: natural:= bitMAS_cj-indice_bits;

subtype st_estado is std_logic;

subtype st_cache_dat is std_logic_vector(tam_bloque_bits-1 downto 0);

-- prueba
constant tam_palabra: natural := 2**tam_palabra_bits;

end package param_disenyo_pkg;


