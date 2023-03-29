--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;
use work.retardos_componentes_pkg.all;
use work.estado_pkg.all;
use work.proc_func_control_pkg.all;

entity control is
port (reloj, pcero: in std_logic;
	op_dis: in std_logic;
	consumo: in std_logic;
	igualcero: in std_logic;
	mxa, pec: out std_logic;
	finalizada, desocupada: out std_logic);
end;
  
architecture funcional of control is

signal estado, prxestado: tipoestado;

begin

-- registro de estado
reg_estado: process (reloj, pcero)
variable v_estado: tipoestado;
begin
	if pcero = puesta_cero then
		v_estado := ESP;
	elsif rising_edge(reloj) then
		v_estado := prxestado;										
	end if;
	estado <= v_estado after retardo_estado;
end process;    
   
-- logica de proximo estado
prx_esta: process(estado, op_dis, igualcero, consumo, pcero)
variable v_prxestado: tipoestado;
begin
	v_prxestado := estado; 
	if (pcero = not puesta_cero) then
		case estado is
			when ESP => 
				if estan_operandos_disponibles(op_dis) then
					if ha_finalizado_calculo(igualcero) then
						if es_consumido_resultado(consumo) then

						else
							v_prxestado := CALC;
						end if;
					else
						v_prxestado := CALC;
					end if;
				end if;
			when CALC => 
				if ha_finalizado_calculo(igualcero) then
					if es_consumido_resultado(consumo) then
						v_prxestado := ESP;
					end if;
				end if;
			when others => 
				v_prxestado := ESP;
		end case;
	else
       v_prxestado := ESP;
	end if; 
	prxestado <= v_prxestado after retardo_logica_estado;
end process;

-- logica de salida
logi_sal: process(estado, op_dis, igualcero, consumo, pcero)
variable v_mxa, v_pe, v_pec: std_logic;
variable v_finalizada, v_desocupada: std_logic;
begin

	defecto(v_mxa, v_pec, v_finalizada, v_desocupada);
	if (pcero = not puesta_cero) then
		case estado is
			when ESP => 
				camino_cortocircuito(v_mxa);
				if estan_operandos_disponibles(op_dis) then
					if ha_finalizado_calculo(igualcero) then
						if es_consumido_resultado(consumo) then
--							defecto (camino_iniciar)
							camino_iniciar(v_pec);
							interfaces_ESP_HECHO(v_finalizada, v_desocupada);
						else
							camino_espera_ESP_CALC(v_pec);
							interfaces_HECHO(v_finalizada, v_desocupada);
						end if;
					else
						camino_calcular(v_pec);
						interfaces_CALC(v_finalizada, v_desocupada);
					end if;
				else
--					defecto (camino_iniciar)
					camino_iniciar(v_pec);
					interfaces_ESP(v_finalizada, v_desocupada);
				end if;
			when CALC => 
				camino_no_cortocircuito(v_mxa);
				if ha_finalizado_calculo(igualcero) then
					if es_consumido_resultado(consumo) then
						camino_iniciar(v_pec);
						interfaces_ESP_HECHO(v_finalizada, v_desocupada);
					else
						camino_espera(v_pec);
						interfaces_HECHO(v_finalizada, v_desocupada);
					end if;
				else
					camino_calcular(v_pec);
					interfaces_CALC(v_finalizada, v_desocupada);
				end if;
		end case;
	end if; 

mxa <= v_mxa after retardo_logica_salida;
pec <= v_pec after retardo_logica_salida;
finalizada <= v_finalizada after retardo_logica_salida;
desocupada <= v_desocupada after retardo_logica_salida;

end process;


end;
