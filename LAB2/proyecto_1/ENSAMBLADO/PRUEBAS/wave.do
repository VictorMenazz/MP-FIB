onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_ensamblado/ciclo
add wave -noupdate /prueba_ensamblado/reloj
add wave -noupdate /prueba_ensamblado/pcero
add wave -noupdate -divider {PROCESADOR produc./consum.}
add wave -noupdate -divider Productor
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/peticion.acc -radix unsigned} {/prueba_ensamblado/peticion.dir -radix unsigned} {/prueba_ensamblado/peticion.esc -radix unsigned} {/prueba_ensamblado/peticion.ini -radix unsigned} {/prueba_ensamblado/peticion.DE -radix unsigned}} -subitemconfig {/prueba_ensamblado/peticion.acc {-height 16 -radix unsigned} /prueba_ensamblado/peticion.dir {-height 16 -radix unsigned} /prueba_ensamblado/peticion.esc {-height 16 -radix unsigned} /prueba_ensamblado/peticion.ini {-height 16 -radix unsigned} /prueba_ensamblado/peticion.DE {-height 16 -radix unsigned}} /prueba_ensamblado/peticion
add wave -noupdate /prueba_ensamblado/pet_listo
add wave -noupdate -divider Consumidor
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/respuesta.DL -radix unsigned} {/prueba_ensamblado/respuesta.val -radix unsigned}} -subitemconfig {/prueba_ensamblado/respuesta.DL {-height 16 -radix unsigned} /prueba_ensamblado/respuesta.val {-height 16 -radix unsigned}} /prueba_ensamblado/respuesta
add wave -noupdate -divider {INTERFACE proc/cache}
add wave -noupdate -divider {PETICION en cache}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/inter_Pr_ca/pe
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/peticion
add wave -noupdate -divider {CAMPOS CACHE}
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(1) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(2) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(3) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(4) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(5) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(6) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/estado/EST_mem
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate -divider {CONTROLADOR de cache}
add wave -noupdate -divider {Controlador estados}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/derechos_acceso
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/estado
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/prxestado
add wave -noupdate -divider {Controlador. senyales}
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/s_estado
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/s_control
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.listo -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.listo {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp.finalizada {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_acc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_pet -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_esc -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_acc {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_pet {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m.m_esc {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/pet_m
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp_m.m_val -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp_m.m_val {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/cach/cache_sin/contro/resp_m
add wave -noupdate -divider {INTER. cache/BUS}
add wave -noupdate -divider Peticion
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.acc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.dir -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.dato_E -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.acc {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.dir {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e.dato_E {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_e
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_CON/mpet_cntl_e
add wave -noupdate -divider Respuesta
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mresp_info_s
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_CON/mresp_cntl_s
add wave -noupdate -divider BUS
add wave -noupdate -divider Peticion
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus.acc -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus.dir -radix unsigned} {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus.dato_E -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus.acc {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus.dir {-height 16 -radix unsigned} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus.dato_E {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mpet_info_bus
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_CON/mpet_cntl_bus
add wave -noupdate -divider Respuesta
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mresp_info_bus.mdato_bus -radix unsigned}} -subitemconfig {/prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mresp_info_bus.mdato_bus {-height 16 -radix unsigned}} /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_IN/mresp_info_bus
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/cache/inter_Pr_BUS_CON/mresp_cntl_bus
add wave -noupdate -divider {INTER. BUS/memoria}
add wave -noupdate -divider Peticion
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/memoria/inter_Mem_BUS_IN/mpet_info_s
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/memoria/inter_Mem_BUS_CON/mpet_cntl_s
add wave -noupdate -divider Respuesta
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/memoria/inter_Mem_BUS_IN/mresp_info_e
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/memoria/inter_Mem_BUS_CON/mresp_cntl_e
add wave -noupdate -divider MEMORIA
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/memoria/memoria/MPET
add wave -noupdate /prueba_ensamblado/ensa_ca_mem/memoria/memoria/MLES
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/memoria/memoria/dir
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/memoria/memoria/ED
add wave -noupdate -radix unsigned /prueba_ensamblado/ensa_ca_mem/memoria/memoria/LD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9073399 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 610
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {55944 ns}
