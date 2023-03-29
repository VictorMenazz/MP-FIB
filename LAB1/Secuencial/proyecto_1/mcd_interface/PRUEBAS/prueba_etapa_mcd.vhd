--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all; 
use std.textio.all;
use IEEE.std_logic_textio.all;
use std.env.all;

use work.param_disenyo_pkg.all;
use work.estado_pkg.all;
use work.procedimientos_prueba_pkg.all;
use work.interface_pkg.all;

use work.componentes_pkg.all;

entity prueba_etapa_mcd IS
generic(pasoapaso: integer range 0 to 1:= 0);
end prueba_etapa_mcd;
 
architecture prueba OF prueba_etapa_mcd IS 
 
component etapa_mcd is
   port (reloj, pcero: std_logic;
	pet_dv: in posterior_2;
	pet_l: out anterior; -- atras
	resp_dv: out posterior_1;
	resp_l: in anterior); -- atras
end component;


signal reloj, pcero: std_logic;
signal pet_dv: posterior_2;
signal pet_l, resp_l: anterior; -- atras
signal resp_dv: posterior_1;

signal DATextraido, DATprocesado: st_dat;

signal inicio: std_logic;

signal ciclo: integer:= 0;
shared variable final : boolean := false;
shared variable final_P, final_C: boolean := false;

alias a: st_dat is pet_dv.dat_a;
alias b: st_dat is pet_dv.dat_b;
alias op_dis: std_logic is pet_dv.val;
alias lista_UF: std_logic is pet_l.listo;

alias s: st_dat is resp_dv.dat;
alias finalizada: std_logic is resp_dv.val;
alias listo_C: std_logic is resp_l.listo;

begin

pr_mcd: etapa_mcd port map (reloj => reloj, pcero => pcero, pet_dv => pet_dv, pet_l => pet_l, resp_dv => resp_dv, resp_l => resp_l);

estimulos: process
begin
	pcero <= '1';
	wait_until_falling_edges(reloj,2);
	pcero <= '0';
	inicio <= '1';
	wait;
end process;

productor: process
variable v_a, v_b: st_dat;
variable tiempoproducir: integer;
variable valor: integer:= 0;
begin
	op_dis <= '0';
	wait until inicio = '1';


		producir_datos (21, 12, 1, a, b, op_dis, reloj, lista_UF, ciclo);

		producir_datos (84, 48, 1, a, b, op_dis, reloj, lista_UF, ciclo);

		producir_datos (15, 10, 1, a, b, op_dis, reloj, lista_UF, ciclo);

		producir_datos (0, 8, 12, a, b, op_dis, reloj, lista_UF, ciclo); --1

		producir_datos (7, 0, 1, a, b, op_dis, reloj, lista_UF, ciclo); 

		op_dis <= '0';

    assert FALSE report CR &LF & "productor ha finalizado." severity note;
	op_dis <= '0';
	final_P := true;
    wait;
end process;

consumidor: process
variable tiempoconsumir: integer;
begin
	listo_C <= '0';
	wait until inicio = '1';
	for i in 0 to 9 loop
		wait until falling_edge(reloj);	
	end loop;

		consumir_datos (s, 1, DATextraido, DATprocesado, listo_C, reloj, finalizada, ciclo);

		consumir_datos (s, 8, DATextraido, DATprocesado, listo_C, reloj, finalizada, ciclo); --1

		consumir_datos (s, 1, DATextraido, DATprocesado, listo_C, reloj, finalizada, ciclo);

		consumir_datos (s, 4, DATextraido, DATprocesado, listo_C, reloj, finalizada, ciclo); --1

		consumir_datos (s, 1, DATextraido, DATprocesado, listo_C, reloj, finalizada, ciclo); 

    assert FALSE report CR &LF & "consumidor ha finalizado." severity note;
	listo_C <= '0';
	final_C := true;
    wait;
end process;

finalizar: process
begin
	if final_P = true and final_c = true then
		final := true;
	end if;
	wait until rising_edge(reloj);
end process;
		

process
begin
  if final = false and ciclo < 70 then
    reloj <= '0';
    wait for 20 ns;
    reloj <= '1';
	ciclo <= ciclo +1;
    wait for 20 ns;
	if pasoapaso = 1 then
		stop(0);
	end if;
	else
    assert FALSE report CR &LF & "Comprobacion finalizada." severity note;
	  wait;
	end if;
end process;

end prueba;

