transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {sap_processor.vo}

vlog -vlog01compat -work work +incdir+C:/Users/rajjo/OneDrive/Desktop/sap {C:/Users/rajjo/OneDrive/Desktop/sap/tb_test.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb_test.v

add wave *
view structure
view signals
run -all
