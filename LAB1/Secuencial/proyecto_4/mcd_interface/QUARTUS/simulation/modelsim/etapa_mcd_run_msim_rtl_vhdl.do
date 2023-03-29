transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/tipos_constantes_pkg/retardos_componentes_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/tipos_constantes_pkg/param_disenyo_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_3/mcd/control/CODIGO/estado_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes_pkg/componentes_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/tipos_constantes_pkg/interface_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_3/mcd/componentes_mcd_pkg/componentes_mcd_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_3/mcd/control/CODIGO/proc_func_control_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/REGISTROS/CODIGO/RD_1.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/REGISTROS/CODIGO/RD_N_pe.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/MUX/CODIGO/mux2.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/REGISTROS/CODIGO/RD_1_pe.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/MUX/CODIGO/mux2_1.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/menor/CODIGO/menqu.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/sumador/CODIGO/sumador.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_1/mcd/camino/componentes/igual_cero/CODIGO/igual_cero.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/interfaces/registro_con_guarda/componentes_reg_con_guarda_pkg/componentes_reg_con_guarda_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/interfaces/registro_con_guarda_pkg/registro_con_guarda_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/interfaces/registro_con_guarda/regguarda/CODIGO/reg_guarda.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/interfaces/registro_con_guarda/regcabeza/CODIGO/reg_cabeza.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_3/mcd/ensamblado/CODIGO/mcd.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_3/mcd/camino/ensamblado/CODIGO/camino_mcd.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_3/mcd/control/CODIGO/control.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/mcd_interface/CODIGO/etapa_mcd.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/interfaces/registro_con_guarda/ensamblado_reg_guarda/CODIGO/reg_con_guarda.vhd}

vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/mcd_interface/QUARTUS/../PRUEBAS/procedimientos_prueba_pkg.vhd}
vcom -93 -work work {/home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/mcd_interface/QUARTUS/../PRUEBAS/prueba_etapa_mcd.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  prueba_etapa_mcd

do /home/victormena/Documentos/MP/LAB1/Secuencial/proyecto_4/mcd_interface/QUARTUS/../PRUEBAS/formato_ventanas.do
