transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/rajjo/OneDrive/Desktop/sap {C:/Users/rajjo/OneDrive/Desktop/sap/pc.v}

vlog -vlog01compat -work work +incdir+C:/Users/rajjo/OneDrive/Desktop/sap {C:/Users/rajjo/OneDrive/Desktop/sap/tb_pc.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_pc.v

add wave *
view structure
view signals
run -all
