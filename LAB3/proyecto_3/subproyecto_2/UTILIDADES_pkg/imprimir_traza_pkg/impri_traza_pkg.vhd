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

use work.multis_pkg.all;
use work.controlador_Obs_pkg.all;
use work.tipos_pruebas_pkg.all;

package impri_traza_pkg is

type ascii_estado_ptr is access string;
type ascii_estado_obs_ptr is access string;

function ascii_estado (estado: tipoestado)
        return ascii_estado_ptr;

function ascii_estado_obs (estado: tipoestado_O)
        return ascii_estado_obs_ptr;

procedure cabecera_traza (fichero: in string; variable ficheros_nombre_ptr: in vector_ficheros);

procedure proc_pend(v_peticion: tp_peticion; l: inout line);

procedure cache_I(v_pet_listo: st_cache_listo; v_PET: tp_peticion; v_AF, v_est: std_logic; v_estado: tipoestado; l: inout line);

procedure estado_contro(v_estado: tipoestado; l: inout line);

procedure estado_contro_obs(v_estado: tipoestado_O; l: inout line);

procedure etapa (v_estado: tipoestado; cnt: inout integer; cnt_sigue: inout integer; l: inout line);

procedure seleccion_agente (v_s_sel_agente: std_logic; l: inout line);

procedure campos_cache (v_control: tp_contro_cam_cntl; l: inout line);

procedure contenido_cache (v_dir_cache: st_dir; s_mem_etiq: tp_ET_mem; s_mem_estado: tp_EST_mem; s_mem_datos: tp_DAT_mem; l: inout line);

procedure contenido_memoria (v_PET: tp_peticion; s_mem_memoria: RAM_mem; l: inout line);

procedure impri_traza (v_pet_listo: tp_cache_listo_multi; v_PET: tp_peticiones_multi; v_peticion: tp_peticiones_multi; v_AF: tp_s_AF; v_est: tp_s_est; v_estado: tp_s_estado;
						s_mem_etiq: tp_caches_etiquetas; s_mem_estado: tp_caches_estado; s_mem_datos: tp_caches_datos; s_mem_memoria: RAM_mem;
						v_control: tp_s_control;
						v_s_sel_agente: tp_s_sel_agentes; v_estado_obs: tp_s_estado_obs; v_control_obs: tp_s_control;
						v_dir_cache: tp_dir_cache; v_ent_DAT_muli: in tp_ent_DAT_multi; variable ficheros_nombre_ptr: in vector_ficheros;
 						ciclod:integer; cnt: inout integer; cnt_sigue: inout integer; fichero: in string);

end package impri_traza_pkg;

package body impri_traza_pkg is


function ascii_estado (estado: tipoestado)
        return ascii_estado_ptr is

variable ascii_ptr: ascii_estado_ptr;
begin
--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
	case estado is 
	  when DES0 => ascii_ptr:= new string'("   DES0");
	  when DES => ascii_ptr := new string'("    DES"); 
	  when CMPETIQ => ascii_ptr := new string'("CMPETIQ"); 
	  when INI => ascii_ptr:= new string'("    INI"); 
	  when ESCINI => ascii_ptr:= new string'(" ESCINI");
	  when LEC => ascii_ptr := new string'("    LEC"); 
	  when PML => ascii_ptr := new string'("    PML"); 
	  when PMEA => ascii_ptr:= new string'("   PMEA"); 
	  when PMEF => ascii_ptr:= new string'("   PMEF");
	  when ESPL => ascii_ptr := new string'("   ESPL"); 
	  when ESPEA => ascii_ptr := new string'("  ESPEA"); 
	  when ESPEF => ascii_ptr:= new string'("  ESPEF"); 
	  when ESB => ascii_ptr:= new string'("    ESB");
	  when ESCP => ascii_ptr := new string'("   ESCP"); 
	  when HECHOL => ascii_ptr := new string'(" HECHOL"); 
	  when HECHOE => ascii_ptr:= new string'(" HECHOE"); 
	  when DESB => ascii_ptr := new string'("   DESB"); 
	  when others => 
	    report "el estado no existe";
end case;

return ascii_ptr;
end function ascii_estado;

function ascii_estado_obs (estado: tipoestado_O)
        return ascii_estado_obs_ptr is

variable ascii_ptr: ascii_estado_obs_ptr;
begin
--type tipoestado_O is (DESO, CMPETO, EEST);
	case estado is 
	  when DESO => ascii_ptr:= new string'("  DESO");
	  when CMPETO => ascii_ptr := new string'("CMPETO"); 
	  when EEST => ascii_ptr:= new string'("  EEST"); 
	  when others => 
	    report "el estado no existe";
end case;

return ascii_ptr;
end function ascii_estado_obs;

procedure cabecera_traza (fichero: in string; variable ficheros_nombre_ptr: in vector_ficheros) is
file S: text;
variable linea_S : line;
variable l: line;
type lineas_line is array (0 to Nproc-1) of line;
variable lineas: lineas_line;
begin
		write (l, string'(" salida de comprobacion de la propagacion de un acceso a memoria" & CR & LF ));
		linea_S := new string'(l.all);
	for i in 0 to Nproc-1 loop
		lineas(i):= new string'(l.all);
	end loop;
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

	for i in 0 to Nproc-1 loop
		file_open(S,ficheros_nombre_ptr(i).all,append_mode); 
		write (l, string'("cache:"), right, 6);
		write (l, integer'(i), right, 3);
		writeline (S, l);
		writeline (S, lineas(i));
		file_close(S);
	end loop;

	for i in 0 to Nproc-1 loop
		write (l, string'("ciclo"), right, 5);
		write (l, string'("acceso pend."), right, 13);
		write (l, string'("acceso cache"), right, 16);
		write (l, string'("agente procesador"), right, 30-2);
		write (l, string'("agente observador"), right, 30-10);
		if i /= Nproc-1 then
			write (l, string'(" "), right, 20+2+6+1+6);--+0
		end if;
		if i = 0 then
			for j in 0 to Nproc-1 loop
			 lineas(j):= new string'(l.all);
			end loop;
		end if;
	end loop;
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

	for i in 0 to Nproc-1 loop
		file_open(S,ficheros_nombre_ptr(i).all,append_mode); 
		writeline (S, lineas(i));
		file_close(S);
	end loop;

		write (l, string'(" "), right, 6);
	for i in 0 to Nproc-1 loop
		write (l, string'("tipo"), right, 4);
		write (l, string'("direc."), right, 9);
		write (l, string'("tipo"), right, 6);
		write (l, string'("direc."), right, 9);
		write (l, string'("SA"), right, 5); --28
		write (l, string'("SL"), right, 3); --28
		write (l, string'("act. campos"), right, 17-4-1);
		write (l, string'("est. AP"), right, 11-2-1);
		write (l, string'("act. cam"), right, 17-4-3);
		write (l, string'("est. AO"), right, 11-4+3-1);
		write (l, string'("cache contenido"), right, 19-3);
		write (l, string'("direc"), right, 6);
		write (l, string'("direc"), right, 6);
		write (l, string'("memoria"), right, 9);
		if i /= Nproc-1 then
			write (l, string'(" "), right, 1+4);--+0
		end if;
		if i = 0 then
			for j in 0 to Nproc-1 loop
			 lineas(j):= new string'(l.all);
			end loop;
		end if;
	end loop;
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

	for i in 0 to Nproc-1 loop
		file_open(S,ficheros_nombre_ptr(i).all,append_mode); 
		writeline (S, lineas(i));
		file_close(S);
	end loop;

		write (l, string'(" "), right, 30);
	for i in 0 to Nproc-1 loop
		write (l, string'("A/F"), right, 6);
		write (l, string'("ET"), right, 12);
		write (l, string'("ES"), right, 3);
		write (l, string'("DA"), right, 3);
		write (l, string'("CT"), right, 18+12);
		write (l, string'("ET"), right, 3+1+1);
		write (l, string'("ES"), right, 6-1-1);
		write (l, string'("DA"), right, 3+1);
		write (l, string'("ETEST"), right, 6);
		write (l, string'("  DAT"), right, 6);
		write (l, string'("contenido"), right, 12-1);
		if i /= Nproc-1 then
			write (l, string'(" "), right, 1+4+22);--+0
		end if;
		if i = 0 then
			for j in 0 to Nproc-1 loop
			 lineas(j):= new string'(l.all);
			end loop;
		end if;
	end loop;
		linea_S := new string'(l.all);
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);

	for i in 0 to Nproc-1 loop
		file_open(S,ficheros_nombre_ptr(i).all,append_mode); 
		writeline (S, lineas(i));
		file_close(S);
	end loop;

		write (l, string'(" "), right, 2);
		linea_S := new string'(l.all);
		for j in 0 to Nproc-1 loop
			lineas(j):= new string'(l.all);
		end loop;
		writeline(output, l);
		file_open(S,fichero,append_mode); 
		writeline (S, linea_S);
		file_close(S);
	for i in 0 to Nproc-1 loop
		file_open(S,ficheros_nombre_ptr(i).all,append_mode); 
		writeline (S, lineas(i));
		file_close(S);
	end loop;

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
	write (l, string'(estado_ascii.all), right, 4);--6
	deallocate(estado_ascii);
end procedure;

procedure estado_contro_obs(v_estado: tipoestado_O; l: inout line) is
variable estado_ascii: ascii_estado_obs_ptr;
begin
	estado_ascii:= ascii_estado_obs(v_estado);
	write (l, string'(estado_ascii.all), right, 4);--6
	deallocate(estado_ascii);
end procedure;

procedure etapa (v_estado: tipoestado; cnt: inout integer; cnt_sigue: inout integer; l: inout line) is
variable estado_ascii: ascii_estado_ptr;

begin
	case v_estado is 
	  when DES0 => 
		write (l, string'("D0"), right, 4);
	  when DES => 
		write (l, string'("DS"), right, 4);
	  when CMPETIQ => 
		write (l, string'("CM"), right, 4);
	  when INI => 
		write (l, string'("IN"), right, 4);
	  when ESCINI => 
		write (l, string'("ES"), right, 4);
	  when LEC => 
		write (l, string'("LE"), right, 4);
	  when PML => 
		write (l, string'("FL"), right, 4);
	  when PMEA => 
		write (l, string'("AE"), right, 4);
	  when PMEF => 
		write (l, string'("FE"), right, 4);
	  when ESPL => 
		write (l, string'("ML"), right, 4);
		cnt := cnt +1;
	  when ESPEA => 
		write (l, string'("ME"), right, 4);
	  when ESPEF => 
		write (l, string'("ME"), right, 4);
	  when ESB => 
		write (l, string'("EB"), right, 4);
	  when ESCP => 
		write (l, string'("EP"), right, 4);
	  when HECHOL => 
		write (l, string'("HL"), right, 4);
	  when HECHOE => 
		write (l, string'("HE"), right, 4);
	  when DESB => 
		write (l, string'("DB"), right, 4);
	  when others => 
	    report "el estado no existe";
end case;

end procedure;

procedure seleccion_agente (v_s_sel_agente: std_logic; l: inout line) is
begin
	if v_s_sel_agente = '1'  then 
		write (l, string'("O  "), right, 3);  
	else
		write (l, string'("P  "), right, 3);
	end if;
end procedure;

procedure campos_cache (v_control: tp_contro_cam_cntl; l: inout line) is
begin
 	write (l, string'("  "), right, 2); 
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

procedure contenido_cache (v_dir_cache: st_dir; s_mem_etiq: tp_ET_mem; s_mem_estado: tp_EST_mem; s_mem_datos: tp_DAT_mem; l: inout line) is
variable conjunto: st_dir_conjunto;
variable e_conjunto: integer;
variable e_v_dir: integer;
begin
	conjunto:= std_logic_vector(to_unsigned(to_integer(unsigned(v_dir_cache)) mod num_conjuntos, log_num_conjuntos));
	hwrite(l, conjunto, right, 4);
	e_conjunto:= to_integer(unsigned(conjunto));
	hwrite(l, s_mem_etiq(e_conjunto), right, 5);
	write(l, s_mem_estado(e_conjunto), right, 3);
	hwrite(l, s_mem_datos(e_conjunto), right, 4);
end procedure;

procedure contenido_memoria (v_PET: tp_peticion; s_mem_memoria: RAM_mem; l: inout line) is
variable e_v_dir: integer;
begin
	e_v_dir:= to_integer(unsigned(v_PET.dir));
	hwrite(l, s_mem_memoria(e_v_dir), right, 6);
end procedure;


procedure impri_traza (v_pet_listo: tp_cache_listo_multi; v_PET: tp_peticiones_multi; v_peticion: tp_peticiones_multi; v_AF: tp_s_AF; v_est: tp_s_est; v_estado: tp_s_estado;
						s_mem_etiq: tp_caches_etiquetas; s_mem_estado: tp_caches_estado; s_mem_datos: tp_caches_datos; s_mem_memoria: RAM_mem;
						v_control: tp_s_control;
						v_s_sel_agente: tp_s_sel_agentes; v_estado_obs: tp_s_estado_obs; v_control_obs: tp_s_control;
						v_dir_cache: tp_dir_cache; v_ent_DAT_muli: in tp_ent_DAT_multi; variable ficheros_nombre_ptr: in vector_ficheros;
 						ciclod:integer; cnt: inout integer; cnt_sigue: inout integer; fichero: in string) is
file S: text;
variable l : line;
variable t_t_linea_S, t_linea_S, linea_S : line;
type lineas_line is array (0 to Nproc-1) of line;
variable lineas: lineas_line;

variable dir_ET_EST: st_dir;
variable dir_DAT: st_dir;

begin
for i in 0 to Nproc-1 loop
	write(lineas(i), ciclod, right, 5);
	proc_pend(v_peticion(i), lineas(i));
	cache_I(v_pet_listo(i), v_PET(i), v_AF(i), v_est(i), v_estado(i), lineas(i));
	etapa (v_estado(i), cnt, cnt_sigue, lineas(i));

	write (lineas(i), string'(" "), right, 2); 
	if v_PET(i).acc = '1' then
		seleccion_agente (v_s_sel_agente(i), lineas(i));
		campos_cache (v_control(i), lineas(i));
		estado_contro(v_estado(i), lineas(i));
		campos_cache (v_control_obs(i), lineas(i));
		estado_contro_obs(v_estado_obs(i), lineas(i));
		contenido_cache (v_dir_cache(i), s_mem_etiq(i), s_mem_estado(i), s_mem_datos(i), lineas(i));
		dir_ET_EST := v_dir_cache(i);
		hwrite(lineas(i), dir_ET_EST, right, 6);
		dir_DAT := v_ent_DAT_muli(i);
		hwrite(lineas(i), dir_DAT, right, 6);
		contenido_memoria (v_PET(i), s_mem_memoria, lineas(i));
	else
		seleccion_agente (v_s_sel_agente(i), lineas(i));
		write (lineas(i), string'(" "), right, 30-2-7-1-2); -- 0
		campos_cache (v_control_obs(i), lineas(i));
		estado_contro_obs(v_estado_obs(i), lineas(i));
		contenido_cache (v_dir_cache(i), s_mem_etiq(i), s_mem_estado(i), s_mem_datos(i), lineas(i));
		dir_ET_EST := v_dir_cache(i);
		hwrite(lineas(i), dir_ET_EST, right, 6);
		dir_DAT := v_ent_DAT_muli(i);
		hwrite(lineas(i), dir_DAT, right, 6);
		contenido_memoria (v_PET(i), s_mem_memoria, lineas(i));
	end if;
	write(lineas(i), string'(" "), right, 2);

	t_linea_S := new string'(lineas(i).all);
	file_open(S,ficheros_nombre_ptr(i).all,append_mode); 
	writeline (S, t_linea_S);
	file_close(S);
end loop;

	l:= new string'(lineas(0).all);
for i in 1 to Nproc-1 loop
	l := new string'(l.all & lineas(i).all);
end loop;
	linea_S := new string'(l.all);
	writeline(output, l);
	file_open(S,fichero,append_mode); 
	writeline (S, linea_S);
	file_close(S);

for i in 1 to 1 loop
	deallocate(lineas(i));
end loop;

end procedure impri_traza;


end package body impri_traza_pkg;

