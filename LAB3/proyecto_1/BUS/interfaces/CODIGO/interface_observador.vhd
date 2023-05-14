--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.interface_observador_pkg.all;
use work.componentes_interfaces_bus_multi_pkg.all;
--! @image html interface_observador.png 

entity interface_observador is
	port (reloj, pcero	: in  std_logic;
		O_listo: in std_logic;
		pet_observacion_bus: in  tp_observacion;
		pet_observacion_s: out  tp_observacion);
end interface_observador;

architecture estruc of interface_observador is
signal t_pet_observacion, reg_pet_obser: tp_observacion;
signal pe: std_logic;
begin
-- interface con el bus
reg_obser: RD_observacion port map(reloj => reloj, pcero => pcero, e => pet_observacion_bus, s => t_pet_observacion);

-- interface con la cache
pe <= t_pet_observacion.pet and t_pet_observacion.les;
reg_inter_obs: RD_pe_obser port map(reloj => reloj, pcero => pcero, pe => pe, e => t_pet_observacion, s => reg_pet_obser);
mux_inter_obs: mux_obser port map (a => reg_pet_obser, b => t_pet_observacion, sel => O_listo, s => pet_observacion_s);

end;

