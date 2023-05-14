onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_ensamblado_multi/ciclo
add wave -noupdate /prueba_ensamblado_multi/reloj
add wave -noupdate /prueba_ensamblado_multi/pcero
add wave -noupdate /prueba_ensamblado_multi/arb_control
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/peticion
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/respuesta.DL -radix unsigned} {/prueba_ensamblado_multi/respuesta.val -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/respuesta.DL {-height 16 -radix unsigned} /prueba_ensamblado_multi/respuesta.val {-height 16 -radix unsigned}} /prueba_ensamblado_multi/respuesta
add wave -noupdate /prueba_ensamblado_multi/pet_listo
add wave -noupdate /prueba_ensamblado_multi/parar
add wave -noupdate /prueba_ensamblado_multi/finaltraza
add wave -noupdate -divider Arbitraje
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/arbitraje/arb_control
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/contro_proc/arb_pet
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/contro_proc/arb_conc
add wave -noupdate -divider Cache
add wave -noupdate -divider {estado agente procesador}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/contro_proc/prxestado
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/peticion.acc
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/peticion.esc
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/peticion.dir
add wave -noupdate -divider {estado agente observador}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/contro_obser/prxestado
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/obs_bus.dir -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/obs_bus.dir {-radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/obs_bus
add wave -noupdate -divider {Campos de cache}
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(2) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(3) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(4) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(5) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(6) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/estado/EST_mem
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate -divider {Senyales de estado y control}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/s_estado
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/s_control
add wave -noupdate -divider {agente procesador}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/s_control_P
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/resp
add wave -noupdate -divider {agente observador}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/s_control_O
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/resp_O
add wave -noupdate -divider {Senyales de coordinacion entre agentes}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/cntl
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/trans_bus
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/contro/observacion
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/muxO
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/cache/cach/cache_sin/dir_cache
add wave -noupdate -divider {Interface con el bus}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/mpet_cntl_bus
add wave -noupdate -divider {Interface del observador}
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus.dir -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus.pet -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus.les -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus.dir {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus.pet {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus.les {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_bus
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s.dir -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s.pet -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s.les -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s.dir {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s.pet {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s.les {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pet_observacion_s
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/pe
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/cache/obser/O_listo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 259
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 40000
configure wave -gridperiod 80000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {5544 ns}
