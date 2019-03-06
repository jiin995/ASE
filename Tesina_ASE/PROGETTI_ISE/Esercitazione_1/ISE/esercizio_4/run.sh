#!/bin/sh
echo "Running ghdl commands"
ghdl -a M.vhd
ghdl -a M_testbench.vhd
ghdl -e M_testbench
ghdl -r M_testbench --vcd=M.vcd
echo "Done. Running gtkwave"
gtkwave M.vcd

