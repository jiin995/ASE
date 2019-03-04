onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_sistema_completo/uut/rxd
add wave -noupdate -format Logic /tb_sistema_completo/uut/txd
add wave -noupdate -format Logic /tb_sistema_completo/uut/ck
add wave -noupdate -format Literal /tb_sistema_completo/uut/ingresso_mbr_sig
add wave -noupdate -format Literal /tb_sistema_completo/uut/leds_sig
add wave -noupdate -format Literal /tb_sistema_completo/uut/io_mdr_sig
add wave -noupdate -format Literal /tb_sistema_completo/uut/uscita_mar_sig
add wave -noupdate -format Literal /tb_sistema_completo/uut/uscita_pc_sig
add wave -noupdate -format Logic /tb_sistema_completo/uut/wr_sig
add wave -noupdate -format Logic /tb_sistema_completo/uut/rd_sig
add wave -noupdate -format Logic /tb_sistema_completo/uut/fetch_sig
add wave -noupdate -format Logic /tb_sistema_completo/uut/ce_rom_cpool
add wave -noupdate -format Logic /tb_sistema_completo/uut/ce_ram_locvarframe_opstack
add wave -noupdate -format Logic /tb_sistema_completo/uut/ce_uart_signal
add wave -noupdate -format Logic /tb_sistema_completo/uut/ck_signal
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_mic1/inst_parte_operativa/inst_alu/output
add wave -noupdate -format Logic /tb_sistema_completo/uut/inst_mic1/inst_parte_operativa/wcbtr_mar
add wave -noupdate -format Logic /tb_sistema_completo/uut/inst_mic1/inst_parte_operativa/wcbtr_mar_sig
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_mic1/inst_parte_operativa/address_mar
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_mic1/inst_parte_di_controllo/inst_control_store/addr
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_mic1/inst_parte_di_controllo/inst_control_store/mir
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_ram/ram(18)
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_ram/ram(17)
add wave -noupdate -format Literal /tb_sistema_completo/uut/inst_ram/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 339
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ps} {1364222 ps}
