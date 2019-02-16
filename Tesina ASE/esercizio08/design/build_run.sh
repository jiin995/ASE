#!/bin/sh
echo "Running ghdl commands"
ghdl -a propagation_generation_calculator.vhd
ghdl -a full_adder.vhd
ghdl -a carry_look_ahead_adder.vhd
ghdl -a carry_look_ahead_adder_testbench.vhd
ghdl -e carry_look_ahead_adder_testbench
ghdl -r carry_look_ahead_adder_testbench --vcd=carry_look_ahead_adder.vcd --stop-time=10us
echo "Done. Running gtkwave"
gtkwave carry_look_ahead_adder.vcd
