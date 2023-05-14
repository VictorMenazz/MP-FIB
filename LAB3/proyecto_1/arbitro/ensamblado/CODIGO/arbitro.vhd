--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.multis_pkg.all;
use work.componentes_arbitraje_pkg.all;
--! @image html arbitro.png 

entity arbitro is 										
	port(reloj, pcero: in  std_logic;
		arb_control: in st_arb_peticion;
		fin_trans: std_logic;
		arb_peticion: in st_arb_peticion;
		arb_concesion: out st_arb_concesion);
end arbitro;

architecture estructural of arbitro is
	signal t_arb_concesion: std_logic;
	signal reg_fin_trans: std_logic;
	signal t_arb_conc_and: st_arb_concesion;
	signal prx_estado, estado: tipoestadoarb;
begin

	-- interface con el bus. Senyal de finalizacion de transaccion
	reg_mval: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => fin_trans, s => reg_fin_trans);

	-- arbitraje
	arbi: arbitraje port map (arb => arb_control, peticion => arb_peticion, concesion => t_arb_concesion);

	--logica de salida. Interface con el CC
	reg_conc: RD_1_arbi port map (reloj => reloj, pcero => pcero, e => t_arb_conc_and, s => arb_concesion);

	-- registro de estado
	reg_estado: process(reloj, pcero)
		variable v_estado: tipoestadoarb;
	begin
		if rising_edge(reloj) then
			v_estado := prx_estado;
		elsif pcero = '1' then
			v_estado := ARB;
		end if;
		estado <= v_estado;
	end process;
	
	-- logica de proximo estado
	prx_esta: process(estado, t_arb_concesion, reg_fin_trans, pcero)
		variable v_prxestado: tipoestadoarb;
	begin
		v_prxestado := estado;
		if(pcero /= '1') then
			case estado is
				when ARB =>
					if t_arb_concesion = '1' then
						v_prxestado := ESPARB;
					end if;
				when ESPARB =>
					if reg_fin_trans = '0' then
						v_prxestado := ARB;
					end if;
			end case;
		else
			v_prxestado := ARB;
		end if;
		prx_estado <= v_prxestado;
	end process;
	
	-- logica se salida
	logi_sal: process(estado, t_arb_concesion, pcero)
		variable v_t_arb_concesion: st_arb_concesion;
	begin
		if(pcero /= '1') then
			case estado is
				when ARB =>
					v_t_arb_concesion := t_arb_concesion;
				when ESPARB =>
					v_t_arb_concesion := '0';
			end case;
		end if;
		t_arb_concesion <= v_t_arb_concesion;
	end process;
	
end;
