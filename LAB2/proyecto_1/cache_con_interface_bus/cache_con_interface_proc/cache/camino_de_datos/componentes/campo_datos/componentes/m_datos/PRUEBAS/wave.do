onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_m_dat/reloj
add wave -noupdate -radix unsigned -childformat {{/prueba_m_dat/M_e.acc -radix unsigned} {/prueba_m_dat/M_e.dir -radix unsigned} {/prueba_m_dat/M_e.esc -radix unsigned} {/prueba_m_dat/M_e.DE -radix unsigned}} -expand -subitemconfig {/prueba_m_dat/M_e.acc {-height 16 -radix unsigned} /prueba_m_dat/M_e.dir {-height 16 -radix unsigned} /prueba_m_dat/M_e.esc {-height 16 -radix unsigned} /prueba_m_dat/M_e.DE {-height 16 -radix unsigned}} /prueba_m_dat/M_e
add wave -noupdate /prueba_m_dat/datos/t_indice
add wave -noupdate -radix unsigned /prueba_m_dat/DL
add wave -noupdate -radix unsigned -childformat {{/prueba_m_dat/datos/DAT_mem(0) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(1) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(2) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(3) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(4) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(5) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(6) -radix unsigned} {/prueba_m_dat/datos/DAT_mem(7) -radix unsigned}} -expand -subitemconfig {/prueba_m_dat/datos/DAT_mem(0) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(1) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(2) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(3) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(4) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(5) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(6) {-height 16 -radix unsigned} /prueba_m_dat/datos/DAT_mem(7) {-height 16 -radix unsigned}} /prueba_m_dat/datos/DAT_mem
TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 226
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 10000
configure wave -gridperiod 20000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {252 ns}
