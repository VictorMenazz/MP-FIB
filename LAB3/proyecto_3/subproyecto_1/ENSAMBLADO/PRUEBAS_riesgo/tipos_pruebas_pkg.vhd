--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--use std.textio.all;
--use ieee.std_logic_textio.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_pkg.all;
use work.controlador_pkg.all;

use work.campo_ET_pkg.all;

use work.controlador_Obs_pkg.all;
use work.multis_pkg.all;
use work.param_memorias_pkg.all;

package tipos_pruebas_pkg is
  
type tp_s_derechos_acceso is array (0 to Nproc-1) of std_logic;
type tp_s_estado is array (0 to Nproc-1) of tipoestado;
type tp_s_pet is array (0 to Nproc-1) of tp_contro_e;

type tp_s_AF is array (0 to Nproc-1) of std_logic;
type tp_s_est is array (0 to Nproc-1) of std_logic;
type tp_s_control is array (0 to Nproc-1) of tp_contro_cam_cntl;

--type tp_s_peticion is array (0 to Nproc-1) of tp_peticion;

type tp_s_sel_agentes is array (0 to Nproc-1) of std_logic;

type tp_s_estado_obs is array (0 to Nproc-1) of tipoestado_O;

type tp_dir_cache is array (0 to Nproc-1) of st_dir;

type tp_caches_etiquetas is array (0 to Nproc-1) of tp_ET_mem;
type tp_caches_estado is array (0 to Nproc-1) of tp_EST_mem;
type tp_caches_datos is array (0 to Nproc-1) of tp_DAT_mem;

type nombre_fichero is access string;
type vector_ficheros is array (0 to Nproc-1) of nombre_fichero;

type tp_esperado_multi is array (0 to Nproc-1) of st_palabra_dat;

type tp_dir_DAT_multi is array (0 to Nproc-1) of st_dir;

end package tipos_pruebas_pkg;



