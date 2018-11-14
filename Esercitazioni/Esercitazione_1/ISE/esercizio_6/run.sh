#!/bin/sh
echo "Running ghdl commands"
ghdl -a S.vhd
ghdl -a S_testbench.vhd
ghdl -e S_testbench
ghdl -r S_testbench --vcd=S.vcd
echo "Done. Running gtkwave"
gtkwave S.vcd

