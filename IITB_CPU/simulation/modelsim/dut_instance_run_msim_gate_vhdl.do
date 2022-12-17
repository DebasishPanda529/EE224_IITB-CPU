transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {dut_instance.vho}

vcom -93 -work work {D:/EE@IITB/EE 224/IITB_CPU_Project/IITB_CPU/IITB_CPU/Testbench.vhdl}

vsim -t 1ps -L altera -L altera_lnsim -L fiftyfivenm -L gate_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
