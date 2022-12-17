transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/EE@IITB/EE 224/IITB_CPU_Project/SE9/SE9/DUT.vhdl}
vcom -93 -work work {D:/EE@IITB/EE 224/IITB_CPU_Project/SE9/SE9/sign_extend_9.vhdl}

vcom -93 -work work {D:/EE@IITB/EE 224/IITB_CPU_Project/SE9/SE9/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
