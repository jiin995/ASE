#!/bin/sh
echo "Running ghdl commands"
ghdl -a machine_M.vhd
ghdl -a machine_M_TestBench.vhd
ghdl -e machine_M_TestBench
ghdl -r machine_M_TestBench --vcd=machine_M.vcd
echo "Done. Running gtkwave"
gtkwave machine_M.vcd

