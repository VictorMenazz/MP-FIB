--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.param_disenyo_pkg.all;

package procedimientos_prueba_pkg is

procedure wait_until_falling_edges(signal reloj : in std_logic; n : in integer);

procedure interface_productor(signal reloj: in std_logic; signal listo_B: in std_logic);

procedure interface_consumidor(signal reloj: in std_logic; signal valido_B: in std_logic);

procedure producir (signal reloj: in std_logic; variable tiempoproducir: in integer; variable valor_a: in st_dat; variable valor_b: in st_dat; signal validoP: out std_logic; signal a: out st_dat; signal b: out st_dat);

procedure consumir (signal reloj: in std_logic; variable tiempoconsumir: in integer; signal listo_C: out std_logic; signal DATconsumido: in st_dat; signal DATextraido,  DATprocesado: out st_dat);

procedure producir_datos (dat_a, dat_b: integer; tiempoproducir: integer; signal a, b: out st_dat; signal op_dis: out std_logic; signal reloj, lista_UF: in std_logic; signal ciclo: integer);

procedure consumir_datos (signal s: in st_dat; tiempoproducir: integer; signal DATextraido, DATprocesado: out st_dat; signal listo_C: out std_logic; signal reloj, finalizada: in std_logic; signal ciclo: integer);

end package procedimientos_prueba_pkg;

package body procedimientos_prueba_pkg is

procedure wait_until_falling_edges(signal reloj : in std_logic; n : in integer) is
begin
    for i in 1 to n loop
        wait until falling_edge(reloj);
    end loop;
end procedure;

procedure interface_productor(signal reloj: in std_logic; signal listo_B: in std_logic) is
begin
	wait until rising_edge(reloj) and listo_B = '1';
end procedure;

procedure interface_consumidor(signal reloj: in std_logic; signal valido_B: in std_logic) is
begin
	wait until rising_edge(reloj) and valido_B = '1';
end procedure;

procedure producir (signal reloj: in std_logic; variable tiempoproducir: in integer; variable valor_a: in st_dat; variable valor_b: in st_dat; signal validoP: out std_logic; signal a: out st_dat; signal b: out st_dat) is
begin
	a <= (others => 'U');
	b <= (others => 'U');
	if tiempoproducir > 1 then
		validoP <= '0';
	end if;
	wait_until_falling_edges(reloj, tiempoproducir);
	a <= valor_a;
	b <= valor_b;
	validoP <= '1';
end procedure; 

procedure consumir (signal reloj: in std_logic; variable tiempoconsumir: in integer; signal listo_C: out std_logic; signal DATconsumido: in st_dat; signal DATextraido, DATprocesado: out st_dat) is
variable v_DATextraido: st_dat;
begin
	DATextraido <= DATconsumido;
	v_DATextraido := DATconsumido;
	DATprocesado <= (others => 'U');
	if tiempoconsumir > 1 then
		listo_C <= '0';
	end if;
	wait_until_falling_edges(reloj, tiempoconsumir);
	DATprocesado <= v_DATextraido;
	listo_C <= '1';
end procedure; 

procedure producir_datos (dat_a, dat_b: integer; tiempoproducir: integer; signal a, b: out st_dat; signal op_dis: out std_logic; signal reloj, lista_UF: in std_logic; signal ciclo: integer) is 
variable v_a, v_b: st_dat;
variable tiempo_producir: integer;
begin
		tiempo_producir:= tiempoproducir;
		v_a := std_logic_vector(to_unsigned(dat_a,tam_dat)); 
		v_b := std_logic_vector(to_unsigned(dat_b,tam_dat)); 
		producir (reloj, tiempo_producir, v_a, v_b, op_dis, a, b);
		report CR &LF & "produccion. Ciclo: " & integer'image(ciclo) & "   Valor a: " & integer'image(to_integer(unsigned(v_a))) 
				 & "   Valor b: " & integer'image(to_integer(unsigned(v_b)));
		interface_productor(reloj, lista_UF);
		report CR &LF & "Consume UF. Ciclo: " & integer'image(ciclo) & "   Valor a: " & integer'image(to_integer(unsigned(v_a))) 
				 & "   Valor b: " & integer'image(to_integer(unsigned(v_b)));

		op_dis <= '0';
end procedure;

procedure consumir_datos (signal s: in st_dat; tiempoproducir: integer; signal DATextraido, DATprocesado: out st_dat; signal listo_C: out std_logic; signal reloj, finalizada: in std_logic; signal ciclo: integer) is 
variable tiempo_producir: integer;
variable v_DATprocesado: st_dat;
begin
		listo_C <= '1';
		interface_consumidor(reloj, finalizada);
		wait for 0 fs; --delta
		report CR &LF & "Extraccion. Ciclo: " & integer'image(ciclo) & "   Valor: " & integer'image(to_integer(unsigned(s)));

		tiempo_producir:= tiempoproducir;
		v_DATprocesado := s;
		consumir (reloj, tiempo_producir, listo_C, s, DATextraido, DATprocesado);
		report CR &LF & "Finalizacion del consumo del dato. Ciclo: " & integer'image(ciclo) & "   Valor: " & integer'image(to_integer(unsigned(v_DATprocesado)));

end procedure;


end package body procedimientos_prueba_pkg;

