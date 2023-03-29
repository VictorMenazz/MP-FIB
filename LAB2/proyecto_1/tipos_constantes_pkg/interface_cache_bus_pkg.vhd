--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package interface_cache_bus_pkg is

type tp_peticion_info is record
	acc: std_logic; -- quitar
	dir: st_dir;
    dato_E : st_palabra_dat; 
end record;

type tp_respuesta_info is record
    mdato_bus : st_palabra_dat; 
end record;

type tp_peticion_control is record
	mpet: std_logic;
	mles: std_logic;
end record;

type tp_respuesta_control is record
    m_val : std_logic; 
end record;

type tp_peticion_mem is record
	m_acc: std_logic; -- quitar
	m_pet: std_logic;
	m_esc: std_logic;
	m_dir: st_dir;
    m_DE : st_palabra_dat; 
end record;

end package interface_cache_bus_pkg;

