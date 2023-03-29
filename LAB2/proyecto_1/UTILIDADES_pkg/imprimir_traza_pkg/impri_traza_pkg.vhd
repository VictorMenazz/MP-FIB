--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 
use std.textio.all;
use IEEE.std_logic_textio.all;

use std.env.all;
use work.param_disenyo_pkg.all;
use work.param_memorias_pkg.all;
use work.acciones_pkg.all;
use work.cache_pkg.all;
use work.controlador_pkg.all;

package impri_traza_pkg is

type ascii_estado_ptr is access string;

function ascii_estado (estado: tipoestado)
        return ascii_estado_ptr;

procedure cabecera_traza (fichero: in string);

procedure proc_pend(v_peticion: tp_peticion; l: inout line);

procedure cache_I(v_pet_listo: st_cache_listo; v_PET: tp_peticion; v_AF, v_est: std_logic; v_estado: tipoestado; l: inout line);

procedure estado_contro(v_estado: tipoestado; l: inout line);

procedure etapa (v_estado: tipoestado; cnt: inout integer; cnt_sigue: inout integer; l: inout line);

procedure campos_cache (v_control: tp_contro_cam_cntl; l: inout line);

procedure contenido_cache_memoria (v_PET: tp_peticion; s_mem_etiq: tp_ET_mem; s_mem_estado: tp_EST_mem; s_mem_datos: tp_DAT_mem; s_mem_memoria: RAM_mem;
								 l: inout line);

procedure impri_traza (v_pet_listo: st_cache_listo; v_PET: tp_peticion; v_peticion: tp_peticion; v_AF, v_est: std_logic; v_estado: tipoestado;
						s_mem_etiq: tp_ET_mem; s_mem_estado: tp_EST_mem; s_mem_datos: tp_DAT_mem; s_mem_memoria: RAM_mem;
						v_control: tp_contro_cam_cntl;
 						ciclod:integer; cnt: inout integer; cnt_sigue: inout integer; fichero: in string);
end package impri_traza_pkg;

package body impri_traza_pkg is


function ascii_estado (estado: tipoestado)
        return ascii_estado_ptr is

variable ascii_ptr: ascii_estado_ptr;
begin
--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
	case estado is 
	  when DES0 => ascii_ptr:= new string'("    DES0");
	  when DES => ascii_ptr := new string'("     DES"); 
	  when CMPETIQ => ascii_ptr := new string'(" CMPETIQ"); 
	  when INI => ascii_ptr:= new string'("     INI"); 
	  when ESCINI => ascii_ptr:= new string'("  ESCINI");
	  when LEC => ascii_ptr := new string'("     LEC"); 
	  when PML => ascii_ptr := new string'("     PML"); 
	  when PMEA => ascii_ptr:= new string'("    PMEA"); 
	  when PMEF => ascii_ptr:= new string'("    PMEF");
	  when ESPL => ascii_ptr := new string'("    ESPL"); 
	  when ESPEA => ascii_ptr := new string'("   ESPEA"); 
	  when ESPEF => ascii_ptr:= new string'("   ESPEF"); 
	  when ESB => ascii_ptr:= new string'("     ESB");
	  when ESCP => ascii_ptr := new string'("    ESCP"); 
	  when HECHOL => ascii_ptr := new string'("  HECHOL"); 
	  when HECHOE => ascii_ptr:= new string'("  HECHOE"); 
	  when others => 
	    report "el estado no existe";
end case;

return ascii_ptr;
end function ascii_estado;

procedure cabecera_traza (fichero: in string) is
file S: text;
variable linea_S : line;
variable l : line;
begin
		write (l, string'(" salida de comprobacion de la propagacion de un acceso a memoria" & CR & LF ));
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("ciclo"), right, 5);
		write (l, string'("acceso pend."), right, 13);
		write (l, string'("acceso cache"), right, 16);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("tipo"), right, 10);
		write (l, string'("direc."), right, 9);
		write (l, string'("tipo"), right, 6);
		write (l, string'("direc."), right, 9);
		write (l, string'("segmentacion del acceso"), right, 28);
		write (l, string'("act. campos"), right, 35);
		write (l, string'("estado CC"), right, 11);
		write (l, string'("cache contenido"), right, 19);
		write (l, string'("memoria"), right, 9);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'("A/F"), right, 36);
		write (l, string'("ET"), right, 54);
		write (l, string'("ES"), right, 3);
		write (l, string'("DA"), right, 3);
		write (l, string'("CT"), right, 18);
		write (l, string'("ET"), right, 3);
		write (l, string'("ES"), right, 6);
		write (l, string'("DA"), right, 3);
		write (l, string'("contenido"), right, 12);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

		write (l, string'(" "), right, 2);
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

end procedure cabecera_traza;  

procedure proc_pend(v_peticion: tp_peticion; l: inout line) is
begin
	if v_peticion.acc = '1' then 
		if v_peticion.ini = '1' then
			write (l, string'("inic  "), right, 7);
			hwrite(l, v_peticion.dir, right, 6);
		else
			if v_peticion.esc = '0' then
				write (l, string'("load  "), right, 7);
				hwrite(l, v_peticion.dir, right, 6);
			else
				write (l, string'("store "), right, 7);
				hwrite(l, v_peticion.dir, right, 6);
			end if;
		end if;
	else
		write (l, string'("no hay"), right, 7);
		write (l, string'(" "), right, 6);
	end if;
	write (l, string'(" "), right, 2);
end procedure;

procedure cache_I(v_pet_listo: st_cache_listo; v_PET: tp_peticion; v_AF, v_est: std_logic; v_estado: tipoestado; l: inout line) is
variable estado_ascii: ascii_estado_ptr;
begin
	if v_PET.acc = '1' and v_pet_listo = '1' then 
		if v_PET.ini = '1' then
			write (l, string'("inic  "), right, 7);
			hwrite(l, v_PET.dir, right, 6);
		else
			if v_PET.esc = '0' then
				write (l, string'("load  "), right, 7);
				hwrite(l, v_PET.dir, right, 6);
			else
				write (l, string'("store "), right, 7);
				hwrite(l, v_PET.dir, right, 6);
			end if;
		end if;
	elsif v_pet_listo = '1' then
		write (l, string'("no hay"), right, 7);
		write (l, string'(" "), right, 6);
	else
		write (l, string'(" "), right, 13);
	end if;

	if v_estado = CMPETIQ then
		if v_PET.acc = '1' then 
			if v_PET.ini = '0' then
				if v_AF = '1' and v_est = '1' then
					write (l, string'("A"), right, 2);
				else
					write (l, string'("F"), right, 2);
				end if;
			end if;
		end if;
	else
		write (l, string'(" "), right, 2);
	end if;

end procedure;

procedure estado_contro(v_estado: tipoestado; l: inout line) is
variable estado_ascii: ascii_estado_ptr;
begin
	estado_ascii:= ascii_estado(v_estado);
	write (l, string'(estado_ascii.all), right, 6);
	deallocate(estado_ascii);
end procedure;


procedure etapa (v_estado: tipoestado; cnt: inout integer; cnt_sigue: inout integer; l: inout line) is
variable estado_ascii: ascii_estado_ptr;

begin
	write (l, string'(" "), right, 2);
	case v_estado is 
	  when DES0 => 
		cnt := 0;
		cnt_sigue := 0;
		write (l, string'("D0"), right, 4);
	  when DES => 
		cnt := 0;
		cnt_sigue := 0;
		write (l, string'("DS"), right, 4);
	  when CMPETIQ => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, 4);
		write (l, string'("CM"), right, 4);
	  when INI => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, 4);
		write (l, string'("IN"), right, 4);
	  when ESCINI => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, 8);
		write (l, string'("ES"), right, 4);
	  when LEC => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, (cnt)*4+8); --(cnt+1)*4+8
		write (l, string'("LE"), right, 4);
	  when PML => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, 8);
		write (l, string'("FL"), right, 4);
	  when PMEA => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, 8);
		write (l, string'("AE"), right, 4);
	  when PMEF => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, 8); 
		write (l, string'("FE"), right, 4);
	  when ESPL => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12); 
		write (l, string'("ML"), right, 4);
		cnt := cnt +1;
	  when ESPEA => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12);
		write (l, string'("ME"), right, 4);
		 cnt := cnt +1;
	  when ESPEF => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12);
		write (l, string'("ME"), right, 4);
		 cnt := cnt +1;
	  when ESB => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12);
		write (l, string'("EB"), right, 4);
		 cnt := cnt +1+1; 
	  when ESCP => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12);
		write (l, string'("EP"), right, 4);
		 cnt := cnt +1; 
	  when HECHOL => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12); 
		write (l, string'("HL"), right, 4);
	  when HECHOE => 
		cnt_sigue := cnt_sigue +1;
		write (l, string'(" "), right, cnt*4 + 12); 
		write (l, string'("HE"), right, 4);
	  when others => 
	    report "el estado no existe";
end case;

end procedure;

procedure campos_cache (v_control: tp_contro_cam_cntl; l: inout line) is
begin
	write (l, string'("  "), right, 4);  
	if v_control.ET_acc = '1' and  v_control.ET_esc = '1' then 
		write (l, string'("S  "), right, 3);  
	else
		write (l, string'("N  "), right, 3);
	end if;

	if v_control.EST_acc = '1' and  v_control.EST_esc = '1' then 
		write (l, string'("S  "), right, 3);
	else
		write (l, string'("N  "), right, 3); 
	end if;

	if v_control.DAT_acc = '1' and  v_control.DAT_esc = '1' then 
		write (l, string'("S  "), right, 3);
	else
		write (l, string'("N  "), right, 3); 
	end if;
end procedure;

procedure contenido_cache_memoria (v_PET: tp_peticion; s_mem_etiq: tp_ET_mem; s_mem_estado: tp_EST_mem; s_mem_datos: tp_DAT_mem; s_mem_memoria: RAM_mem;
								 l: inout line) is

variable conjunto: st_dir_conjunto;
variable e_conjunto: integer;
variable e_v_dir: integer;
begin
	conjunto:= std_logic_vector(to_unsigned(to_integer(unsigned(v_PET.dir)) mod num_conjuntos, log_num_conjuntos));
	hwrite(l, conjunto, right, 4);
	e_conjunto:= to_integer(unsigned(conjunto));
	hwrite(l, s_mem_etiq(e_conjunto), right, 5);
	write(l, s_mem_estado(e_conjunto), right, 3);
	hwrite(l, s_mem_datos(e_conjunto), right, 4);

	e_v_dir:= to_integer(unsigned(v_PET.dir));
	hwrite(l, s_mem_memoria(e_v_dir), right, 6);
end procedure;

procedure impri_traza (v_pet_listo: st_cache_listo; v_PET: tp_peticion; v_peticion: tp_peticion; v_AF, v_est: std_logic; v_estado: tipoestado;
						s_mem_etiq: tp_ET_mem; s_mem_estado: tp_EST_mem; s_mem_datos: tp_DAT_mem; s_mem_memoria: RAM_mem;
						v_control: tp_contro_cam_cntl;
 						ciclod:integer; cnt: inout integer; cnt_sigue: inout integer; fichero: in string) is

file S: text;
variable l : line;
variable linea_S : line;

begin
	write(l, ciclod, right, 5);
	proc_pend(v_peticion, l);

	cache_I(v_pet_listo, v_PET, v_AF, v_est, v_estado, l);
	etapa (v_estado, cnt, cnt_sigue, l);

	write (l, string'(" "), right, 44-4*cnt_sigue); --40
	if v_PET.acc = '1' then
		campos_cache (v_control, l);
		write (l, string'(" "), right, 2);
		estado_contro(v_estado, l);
		contenido_cache_memoria (v_PET, s_mem_etiq, s_mem_estado, s_mem_datos, s_mem_memoria, l);
	end if;

	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);

end procedure impri_traza;


end package body impri_traza_pkg;

