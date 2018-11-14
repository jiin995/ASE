#!/bin/sh
echo "Running ghdl commands"
ghdl -a full_adder.vhd
ghdl -a full_adder_testbench.vhd
ghdl -e full_adder_testbench
ghdl -r full_adder_testbench --vcd=full_adder.vcd
echo "Done. Running gtkwave"
gtkwave full_adder.vcd

