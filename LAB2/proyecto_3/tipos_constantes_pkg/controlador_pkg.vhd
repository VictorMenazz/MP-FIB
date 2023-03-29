--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;

package controlador_pkg is

--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOE);
--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, ESPL, ESPEA, ESPEF, ESB, ESCP);
type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, ESPL, ESPEA, ESPEF, ESB, ESCP);

type tp_contro_e is record
	acc: std_logic;
    esc : std_logic;
	ini: std_logic;
end record;

type tp_contro_s is record
    listo : std_logic;
	finalizada: std_logic;
end record;

type tp_contro_cam_estado is record
	AF: std_logic;
	EST: st_estado;
end record;

type tp_contro_cam_cntl is record
    DAT_acc: std_logic;
    DAT_esc: std_logic;

    EST_acc: std_logic;
    EST_esc: std_logic;
    EST_DE: st_estado;

	ET_acc: std_logic;
    ET_esc : std_logic;

	muxE: std_logic;
	muxL: std_logic;
end record;

type tp_cntl_memoria_s is record
	m_acc: std_logic;
	m_pet: std_logic;
	m_esc: std_logic;
end record;

type tp_cntl_memoria_e is record
	m_val: std_logic;
end record;

end package controlador_pkg;


