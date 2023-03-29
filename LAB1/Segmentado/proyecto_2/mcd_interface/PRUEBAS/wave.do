onerror {resume}
quietly virtual signal -install /prueba_etapa_mcd { (context /prueba_etapa_mcd )(pet_dv.val & pet_l.listo )} val_lista_Pro_mcd
quietly virtual signal -install /prueba_etapa_mcd { (context /prueba_etapa_mcd )(resp_dv.val & resp_l.listo )} val_lista_mcd_Consu
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_etapa_mcd/ciclo
add wave -noupdate /prueba_etapa_mcd/reloj
add wave -noupdate /prueba_etapa_mcd/pcero
add wave -noupdate /prueba_etapa_mcd/inicio
add wave -noupdate -divider {Flujo de informacion}
add wave -noupdate -divider Productor
add wave -noupdate -radix unsigned /prueba_etapa_mcd/a
add wave -noupdate -radix unsigned /prueba_etapa_mcd/b
add wave -noupdate -divider {Interface Pro-mcd}
add wave -noupdate /prueba_etapa_mcd/val_lista_Pro_mcd
add wave -noupdate -divider {Estado automata y salida mcd}
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/cnt/estado
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/cnt/prxestado
add wave -noupdate -radix unsigned /prueba_etapa_mcd/s
add wave -noupdate -divider {Interface mcd_Consu}
add wave -noupdate /prueba_etapa_mcd/val_lista_mcd_Consu
add wave -noupdate -divider Consumidor
add wave -noupdate -radix unsigned /prueba_etapa_mcd/DATextraido
add wave -noupdate -radix unsigned /prueba_etapa_mcd/DATprocesado
add wave -noupdate -divider OTRAS_mux_registros
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/ini
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/menor
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/pe_a
add wave -noupdate /prueba_etapa_mcd/pr_mcd/pr_mcd/pe_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 326
configure wave -valuecolwidth 100
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
WaveRestoreZoom {204100 ps} {1926100 ps}
