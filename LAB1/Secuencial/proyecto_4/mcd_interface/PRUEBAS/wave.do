onerror {resume}
quietly virtual signal -install /prueba_etapa_mcd { (context /prueba_etapa_mcd )(pet_dv.val & pet_l.listo )} val_lista_pro_mcd
quietly virtual signal -install /prueba_etapa_mcd { (context /prueba_etapa_mcd )(resp_dv.val & resp_l.listo )} val_lista_mcd_Consu
quietly virtual signal -install /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua { (context /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua )(rdv_e.val & rl_s.listo )} VAL_LISTO_RG
quietly virtual signal -install /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab { (context /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab )(rdv_s.val & rl_s.listo )} val_listo_CAB
quietly virtual signal -install /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rl_e.listo  } lista_mcd
quietly virtual signal -install /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab { (context /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab )(rdv_e.val & rl_e.listo )} val_listo_RD
quietly virtual signal -install /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua { (context /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua )(rdv_s.val & rl_e.listo )} val_listo_RG_RD
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_etapa_mcd/ciclo
add wave -noupdate /prueba_etapa_mcd/reloj
add wave -noupdate /prueba_etapa_mcd/pcero
add wave -noupdate /prueba_etapa_mcd/inicio
add wave -noupdate -divider {Flujo de informacion}
add wave -noupdate -divider Productor
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pet_dv.dat_a
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pet_dv.dat_b
add wave -noupdate -divider {Interface Pro-mcd}
add wave -noupdate /prueba_etapa_mcd/val_lista_pro_mcd
add wave -noupdate -divider {Estados automata y salida mcd}
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/cnt/estado
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/cnt/prxestado
add wave -noupdate -radix unsigned -childformat {{/prueba_etapa_mcd/resp_dv.dat(7) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(6) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(5) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(4) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(3) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(2) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(1) -radix unsigned} {/prueba_etapa_mcd/resp_dv.dat(0) -radix unsigned}} -subitemconfig {/prueba_etapa_mcd/resp_dv.dat(7) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(6) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(5) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(4) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(3) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(2) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(1) {-height 16 -radix unsigned} /prueba_etapa_mcd/resp_dv.dat(0) {-height 16 -radix unsigned}} /prueba_etapa_mcd/resp_dv.dat
add wave -noupdate -divider {Reg. Internos}
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pr_mcd/pr_mcd/cam/reg_a
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pr_mcd/pr_mcd/cam/reg_b
add wave -noupdate -divider {Interface mcd-Consu}
add wave -noupdate /prueba_etapa_mcd/val_lista_mcd_Consu
add wave -noupdate -divider Consumidor
add wave -noupdate -radix unsigned /prueba_etapa_mcd/DATextraido
add wave -noupdate -radix unsigned /prueba_etapa_mcd/DATprocesado
add wave -noupdate -divider {Detalle registro con guarda}
add wave -noupdate -divider {registro de guarda (entrada)}
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua/rdv_e.dat
add wave -noupdate -expand /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua/VAL_LISTO_RG
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua/rdv_s.dat
add wave -noupdate -expand /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_gua/val_listo_RG_RD
add wave -noupdate -divider {registro de cabeza}
add wave -noupdate -radix unsigned /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_e.dat
add wave -noupdate -expand /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/val_listo_RD
add wave -noupdate -radix unsigned -childformat {{/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(7) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(6) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(5) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(4) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(3) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(2) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(1) -radix unsigned} {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(0) -radix unsigned}} -subitemconfig {/prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(7) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(6) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(5) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(4) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(3) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(2) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(1) {-height 16 -radix unsigned} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat(0) {-height 16 -radix unsigned}} /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/rdv_s.dat
add wave -noupdate -expand /prueba_etapa_mcd/pr_mcd/r_c_gua_a/reg_cab/val_listo_CAB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 412
configure wave -valuecolwidth 44
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 20000
configure wave -gridperiod 40000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1722 ns}
