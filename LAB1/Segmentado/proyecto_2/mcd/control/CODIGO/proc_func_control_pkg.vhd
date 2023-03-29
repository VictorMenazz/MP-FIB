--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use work.param_disenyo_pkg.all;

package proc_func_control_pkg is

procedure defecto(variable v_mxa, v_pe_a, v_pe_b: out std_logic;
					variable v_finalizada, v_desocupada: out std_logic);

procedure camino_iniciar(variable v_mxa, v_pe_a, v_pe_b: out std_logic);

procedure interfaces_ESP(variable v_finalizada, v_desocupada: out std_logic);

procedure camino_calcular(variable v_pe_a, v_pe_b: out std_logic);

procedure camino_intercambio(variable v_pe_a, v_pe_b: out std_logic);

procedure interfaces_CALC(variable v_finalizada, v_desocupada: out std_logic);

procedure interfaces_HECHO(variable v_finalizada, v_desocupada: out std_logic);


function estan_operandos_disponibles(oper_disp: std_logic) return boolean;

function hay_intercambio(menor: std_logic) return boolean;

function ha_finalizado_calculo(final: std_logic) return boolean;

function es_consumido_resultado (consumo: std_logic) return boolean;

end package proc_func_control_pkg;

package body proc_func_control_pkg is

procedure defecto(variable v_mxa, v_pe_a, v_pe_b: out std_logic;
					variable v_finalizada, v_desocupada: out std_logic) is
begin
	v_mxa := '0';
	v_pe_a := '0';
	v_pe_b := '0';
	v_finalizada := '0';
	v_desocupada := '1';
end procedure;

procedure camino_iniciar(variable v_mxa, v_pe_a, v_pe_b: out std_logic) is
begin
	v_mxa := '1';
	v_pe_a := '1';
	v_pe_b := '1';
end procedure;

procedure interfaces_ESP(variable v_finalizada, v_desocupada: out std_logic) is
begin
	v_finalizada := '0';
	v_desocupada := '1';
end procedure;

procedure camino_calcular(variable v_pe_a, v_pe_b: out std_logic) is
begin
	v_pe_a := '1';
	v_pe_b := '0';
end procedure;

procedure camino_intercambio(variable v_pe_a, v_pe_b: out std_logic) is
begin
	v_pe_a := '1';
	v_pe_b := '1';
end procedure;

procedure interfaces_CALC(variable v_finalizada, v_desocupada: out std_logic) is
begin
	v_finalizada := '0';
	v_desocupada := '0';
end procedure;

procedure interfaces_HECHO(variable v_finalizada, v_desocupada: out std_logic) is
begin
	v_finalizada := '1';
	v_desocupada := '0';
end procedure;


function estan_operandos_disponibles(oper_disp: std_logic)
				return boolean is
variable oper: boolean; 
begin
	if oper_disp = '1' then
		oper := true;
	else
		oper := false;
	end if;
	return oper;
end estan_operandos_disponibles;

function hay_intercambio(menor: std_logic)
				return boolean is
variable men: boolean; 
begin
	if menor = '1' then
		men := true;
	else
		men := false;
	end if;
	return men;
end hay_intercambio;

function ha_finalizado_calculo(final: std_logic)
				return boolean is
variable t_final: boolean; 
begin
	if final = '1' then
		t_final := true;
	else
		t_final := false;
	end if;
	return t_final;
end ha_finalizado_calculo;

function es_consumido_resultado (consumo: std_logic)
				return boolean is
variable consu: boolean; 
begin
	if consumo = '1' then
		consu := true;
	else
		consu := false;
	end if;
	return consu;
end es_consumido_resultado;

end package body proc_func_control_pkg;

