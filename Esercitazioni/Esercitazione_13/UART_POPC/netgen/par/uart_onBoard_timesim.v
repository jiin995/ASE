////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: uart_onBoard_timesim.v
// /___/   /\     Timestamp: Tue Feb 26 14:15:36 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 3 -pcf uart_onBoard.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim uart_onBoard.ncd uart_onBoard_timesim.v 
// Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
// Input file	: uart_onBoard.ncd
// Output file	: /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_13/UART_POPC/netgen/par/uart_onBoard_timesim.v
// # of Modules	: 1
// Design Name	: uart_onBoard
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module uart_onBoard (
  clock, rx, rx_empty, anodes, cathodes
);
  input clock;
  input rx;
  output rx_empty;
  output [7 : 0] anodes;
  output [7 : 0] cathodes;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ;
  wire \uart_inst/uart_rx_inst/enable_stop ;
  wire \uart_inst/uart_rx_inst/reset_po ;
  wire \Result<0>_0 ;
  wire \Result<1>_0 ;
  wire \Result<2>_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[3] ;
  wire \Result<3>_0 ;
  wire \Result<4>_0 ;
  wire \Result<5>_0 ;
  wire \Result<6>_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[7] ;
  wire \Result<7>_0 ;
  wire \display/clock_divisor_instance/clock_division.counter<0>_0 ;
  wire \Result<0>1_0 ;
  wire \Result<1>1_0 ;
  wire \Result<2>1_0 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_cy[3] ;
  wire \Result<3>1_0 ;
  wire \Result<4>1_0 ;
  wire \Result<5>1_0 ;
  wire \Result<6>1_0 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_cy[7] ;
  wire \Result<7>1_0 ;
  wire \Result<8>1_0 ;
  wire \Result<9>1_0 ;
  wire \Result<10>_0 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_cy[11] ;
  wire \Result<11>_0 ;
  wire \Result<13>_0 ;
  wire cathodes_0_OBUF_705;
  wire anodes_0_OBUF_706;
  wire cathodes_1_OBUF_707;
  wire anodes_1_OBUF_0;
  wire cathodes_2_OBUF_0;
  wire anodes_2_OBUF_710;
  wire cathodes_3_OBUF_0;
  wire anodes_3_OBUF_0;
  wire cathodes_4_OBUF_0;
  wire anodes_4_OBUF_714;
  wire cathodes_5_OBUF_715;
  wire anodes_5_OBUF_0;
  wire rx_IBUF_717;
  wire cathodes_6_OBUF_718;
  wire anodes_6_OBUF_719;
  wire anodes_7_OBUF_0;
  wire \clock_BUFGP/IBUFG_721 ;
  wire clock_BUFGP;
  wire \uart_inst/uart_rx_inst/read_rx ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_val ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ;
  wire \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ;
  wire \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ;
  wire \display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ;
  wire \display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_734 ;
  wire \display/clock_divisor_instance/clock_out_temp_735 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp_740 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_741 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_746 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_747 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_749 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_750 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_751 ;
  wire \uart_inst/uart_rx_inst/load_tick_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_COUNTS_temp[4]_MUX_18_o ;
  wire N5;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt_12 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt_9 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt_0 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt_37 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt_34 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt_31 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt_22 ;
  wire \display/clock_divisor_instance/clock_division.counter<1>_rt_56 ;
  wire \display/clock_divisor_instance/clock_division.counter<2>_rt_53 ;
  wire \Result<0>1 ;
  wire \Result<1>1 ;
  wire \Result<2>1 ;
  wire \Result<3>1 ;
  wire \display/clock_divisor_instance/clock_division.counter<3>_rt_44 ;
  wire \display/clock_divisor_instance/clock_division.counter<4>_rt_81 ;
  wire \display/clock_divisor_instance/clock_division.counter<5>_rt_78 ;
  wire \display/clock_divisor_instance/clock_division.counter<6>_rt_75 ;
  wire \Result<4>1 ;
  wire \Result<5>1 ;
  wire \Result<6>1 ;
  wire \Result<7>1 ;
  wire \display/clock_divisor_instance/clock_division.counter<7>_rt_66 ;
  wire \display/clock_divisor_instance/clock_division.counter<8>_rt_103 ;
  wire \display/clock_divisor_instance/clock_division.counter<9>_rt_100 ;
  wire \display/clock_divisor_instance/clock_division.counter<10>_rt_97 ;
  wire \Result<8>1 ;
  wire \Result<9>1 ;
  wire \display/clock_divisor_instance/clock_division.counter<11>_rt_88 ;
  wire anodes_5_OBUF_151;
  wire anodes_3_OBUF_157;
  wire anodes_1_OBUF_163;
  wire \display/counter_mod4/Mcount_count.counter2 ;
  wire cathodes_3_OBUF_199;
  wire cathodes_4_OBUF_187;
  wire \display/counter_mod4/Mcount_count.counter ;
  wire cathodes_2_OBUF_213;
  wire \display/counter_mod4/Mcount_count.counter1 ;
  wire anodes_7_OBUF_224;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_pack_3 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_rt_237 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_251 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_0 ;
  wire \display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_3 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_4 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_1 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_2 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_6 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_9 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_5 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_8 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_10 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_7 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_11 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_13 ;
  wire \display/clock_divisor_instance/clock_division.counter<12>_rt_387 ;
  wire \display/clock_divisor_instance/clock_division.counter<13>_rt_385 ;
  wire \Result<12>_pack_2 ;
  wire \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_12 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp1 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp2 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<0>_pack_1 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp4 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_glue_set_430 ;
  wire \uart_inst/uart_rx_inst/reset_po_pack_3 ;
  wire \uart_inst/uart_rx_inst/load_tick ;
  wire \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6_rstpot_472 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_453 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot_452 ;
  wire \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5_rstpot_488 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4_rstpot_480 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot_498 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<1>_pack_9 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter1_528 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter2 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_520 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_13_o_count.counter[4]_equal_2_o ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter3 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<0>_pack_12 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter4 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_PWR_14_o_MUX_26_o ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot_565 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot_558 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot_550 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot_543 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7_rstpot_575 ;
  wire \Result<0>2 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<2>_pack_3 ;
  wire \Result<2>2 ;
  wire \Result<1>2 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8_rstpot_614 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt_610 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt_608 ;
  wire \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9_rstpot_602 ;
  wire \Result<8>_pack_6 ;
  wire \Result<9>_pack_5 ;
  wire \NlwBufferSignal_cathodes_0_OBUF/I ;
  wire \NlwBufferSignal_anodes_0_OBUF/I ;
  wire \NlwBufferSignal_cathodes_1_OBUF/I ;
  wire \NlwBufferSignal_anodes_1_OBUF/I ;
  wire \NlwBufferSignal_cathodes_2_OBUF/I ;
  wire \NlwBufferSignal_anodes_2_OBUF/I ;
  wire \NlwBufferSignal_cathodes_3_OBUF/I ;
  wire \NlwBufferSignal_anodes_3_OBUF/I ;
  wire \NlwBufferSignal_cathodes_4_OBUF/I ;
  wire \NlwBufferSignal_anodes_4_OBUF/I ;
  wire \NlwBufferSignal_cathodes_5_OBUF/I ;
  wire \NlwBufferSignal_anodes_5_OBUF/I ;
  wire \NlwBufferSignal_cathodes_6_OBUF/I ;
  wire \NlwBufferSignal_anodes_6_OBUF/I ;
  wire \NlwBufferSignal_anodes_7_OBUF/I ;
  wire \NlwBufferSignal_clock_BUFGP/BUFG/IN ;
  wire \NlwBufferSignal_display/counter_mod4/COUNTS_temp_2/CLK ;
  wire \NlwBufferSignal_display/counter_mod4/COUNTS_temp_1/CLK ;
  wire \NlwBufferSignal_display/counter_mod4/COUNTS_temp_0/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_out_temp/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_0/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_4/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_3/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_2/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_1/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_9/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_6/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_5/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_7/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_10/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_8/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_11/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_13/CLK ;
  wire \NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_12/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK ;
  wire \NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK ;
  wire \NLW_N0_inv_5.D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp2.CYINITGND_O_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[0]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[1]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[2]_UNCONNECTED ;
  wire \NLW_N0_inv_4.C5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_3.B5LUT_O_UNCONNECTED ;
  wire \NLW_cathodes_7_OBUF.A5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_9.D5LUT_O_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[0]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[1]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[2]_UNCONNECTED ;
  wire \NLW_N0_inv_8.C5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_7.B5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_6.A5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_15.D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp2.CYINITGND.1_O_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CO[0]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CO[1]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CO[2]_UNCONNECTED ;
  wire \NLW_N0_inv_14.C5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_13.B5LUT_O_UNCONNECTED ;
  wire \NLW_cathodes_7_OBUF_1_2.A5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_19.D5LUT_O_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CO[0]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CO[1]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CO[2]_UNCONNECTED ;
  wire \NLW_N0_inv_18.C5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_17.B5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_16.A5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_23.D5LUT_O_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CO[0]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CO[1]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CO[2]_UNCONNECTED ;
  wire \NLW_N0_inv_22.C5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_21.B5LUT_O_UNCONNECTED ;
  wire \NLW_N0_inv_20.A5LUT_O_UNCONNECTED ;
  wire VCC;
  wire GND;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[0]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[1]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[2]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[3]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_DI[1]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_DI[2]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_DI[3]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_O[2]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_O[3]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_S[2]_UNCONNECTED ;
  wire \NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_S[3]_UNCONNECTED ;
  wire \NLW_N0_inv_24.A5LUT_O_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[0]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[1]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[2]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[3]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[1]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[2]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[3]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[2]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[3]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[2]_UNCONNECTED ;
  wire \NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[3]_UNCONNECTED ;
  wire \NLW_N0_inv_10.A5LUT_O_UNCONNECTED ;
  wire [4 : 0] \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp ;
  wire [9 : 0] \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter ;
  wire [13 : 0] \display/clock_divisor_instance/clock_division.counter ;
  wire [2 : 0] \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter ;
  wire [2 : 0] \display/counter_mod4/COUNTS_temp ;
  wire [3 : 0] \display/cathodes_instance/nibble ;
  wire [13 : 0] Result;
  wire [4 : 0] \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp ;
  wire [0 : 0] \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut ;
  wire [0 : 0] \display/clock_divisor_instance/Mcount_clock_division.counter_lut ;
  initial $sdf_annotate("netgen/par/uart_onBoard_timesim.sdf");
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_DMUX_Delay  (
    .I(Result[3]),
    .O(\Result<3>_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CMUX_Delay  (
    .I(Result[2]),
    .O(\Result<2>_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_BMUX_Delay  (
    .I(Result[1]),
    .O(\Result<1>_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_AMUX_Delay  (
    .I(Result[0]),
    .O(\Result<0>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt_0 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_5.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_5.D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X49Y114" ))
  \ProtoComp2.CYINITGND  (
    .O(\NLW_ProtoComp2.CYINITGND_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X49Y114" ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>  (
    .CI(1'b0),
    .CYINIT(1'b0),
    .CO({\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[3] , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[2]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[1]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({Result[3], Result[2], Result[1], Result[0]}),
    .S({\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt_0 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt_9 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt_12 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [2]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt_9 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_4.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_4.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt_12 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_3.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_3.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 64'h0000FFFF0000FFFF ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut<0>_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [0]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y114" ),
    .INIT ( 32'hFFFFFFFF ))
  \cathodes_7_OBUF.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_cathodes_7_OBUF.A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_DMUX_Delay  (
    .I(Result[7]),
    .O(\Result<7>_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CMUX_Delay  (
    .I(Result[6]),
    .O(\Result<6>_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_BMUX_Delay  (
    .I(Result[5]),
    .O(\Result<5>_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_AMUX_Delay  (
    .I(Result[4]),
    .O(\Result<4>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt_22 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_9.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_9.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X49Y115" ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>  (
    .CI(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[3] ),
    .CYINIT(1'b0),
    .CO({\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[7] , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[2]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[1]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[7], Result[6], Result[5], Result[4]}),
    .S({\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt_22 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt_31 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt_34 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt_37 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt_31 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_8.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_8.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [5]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt_34 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_7.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_7.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [4]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt_37 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y115" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_6.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_6.A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_DMUX_Delay  (
    .I(\Result<3>1 ),
    .O(\Result<3>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CMUX_Delay  (
    .I(\Result<2>1 ),
    .O(\Result<2>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_BMUX_Delay  (
    .I(\Result<1>1 ),
    .O(\Result<1>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_AMUX_Delay  (
    .I(\Result<0>1 ),
    .O(\Result<0>1_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \display/clock_divisor_instance/clock_division.counter<3>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(\display/clock_divisor_instance/clock_division.counter [3]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<3>_rt_44 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_15.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_15.D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X29Y70" ))
  \ProtoComp2.CYINITGND.1  (
    .O(\NLW_ProtoComp2.CYINITGND.1_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X29Y70" ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>  (
    .CI(1'b0),
    .CYINIT(1'b0),
    .CO({\display/clock_divisor_instance/Mcount_clock_division.counter_cy[3] , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CO[2]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CO[1]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<3>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({\Result<3>1 , \Result<2>1 , \Result<1>1 , \Result<0>1 }),
    .S({\display/clock_divisor_instance/clock_division.counter<3>_rt_44 , \display/clock_divisor_instance/clock_division.counter<2>_rt_53 , 
\display/clock_divisor_instance/clock_division.counter<1>_rt_56 , \display/clock_divisor_instance/Mcount_clock_division.counter_lut [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<2>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [2]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<2>_rt_53 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_14.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_14.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<1>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [1]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<1>_rt_56 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_13.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_13.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 64'h0000FFFF0000FFFF ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_lut<0>_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter<0>_0 ),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_lut [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y70" ),
    .INIT ( 32'hFFFFFFFF ))
  \cathodes_7_OBUF_1_2.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_cathodes_7_OBUF_1_2.A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_DMUX_Delay  (
    .I(\Result<7>1 ),
    .O(\Result<7>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CMUX_Delay  (
    .I(\Result<6>1 ),
    .O(\Result<6>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_BMUX_Delay  (
    .I(\Result<5>1 ),
    .O(\Result<5>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_AMUX_Delay  (
    .I(\Result<4>1 ),
    .O(\Result<4>1_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<7>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [7]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<7>_rt_66 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_19.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_19.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X29Y71" ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>  (
    .CI(\display/clock_divisor_instance/Mcount_clock_division.counter_cy[3] ),
    .CYINIT(1'b0),
    .CO({\display/clock_divisor_instance/Mcount_clock_division.counter_cy[7] , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CO[2]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CO[1]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<7>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\Result<7>1 , \Result<6>1 , \Result<5>1 , \Result<4>1 }),
    .S({\display/clock_divisor_instance/clock_division.counter<7>_rt_66 , \display/clock_divisor_instance/clock_division.counter<6>_rt_75 , 
\display/clock_divisor_instance/clock_division.counter<5>_rt_78 , \display/clock_divisor_instance/clock_division.counter<4>_rt_81 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<6>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [6]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<6>_rt_75 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_18.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_18.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<5>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [5]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<5>_rt_78 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_17.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_17.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<4>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [4]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<4>_rt_81 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y71" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_16.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_16.A5LUT_O_UNCONNECTED )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_DMUX_Delay  (
    .I(Result[11]),
    .O(\Result<11>_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CMUX_Delay  (
    .I(Result[10]),
    .O(\Result<10>_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_BMUX_Delay  (
    .I(\Result<9>1 ),
    .O(\Result<9>1_0 )
  );
  X_BUF 
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>/display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_AMUX_Delay  (
    .I(\Result<8>1 ),
    .O(\Result<8>1_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<11>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<11>_rt_88 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_23.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_23.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X29Y72" ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>  (
    .CI(\display/clock_divisor_instance/Mcount_clock_division.counter_cy[7] ),
    .CYINIT(1'b0),
    .CO({\display/clock_divisor_instance/Mcount_clock_division.counter_cy[11] , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CO[2]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CO[1]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_cy<11>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[11], Result[10], \Result<9>1 , \Result<8>1 }),
    .S({\display/clock_divisor_instance/clock_division.counter<11>_rt_88 , \display/clock_divisor_instance/clock_division.counter<10>_rt_97 , 
\display/clock_divisor_instance/clock_division.counter<9>_rt_100 , \display/clock_divisor_instance/clock_division.counter<8>_rt_103 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<10>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [10]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<10>_rt_97 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_22.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_22.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<9>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [9]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<9>_rt_100 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_21.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_21.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<8>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [8]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<8>_rt_103 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y72" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_20.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_20.A5LUT_O_UNCONNECTED )
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y57" ))
  rx_empty_55 (
    .PAD(rx_empty)
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y57" ))
  rx_empty_OBUF (
    .I(1'b1),
    .O(rx_empty)
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y51" ))
  \cathodes<0>  (
    .PAD(cathodes[0])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y51" ))
  cathodes_0_OBUF (
    .I(\NlwBufferSignal_cathodes_0_OBUF/I ),
    .O(cathodes[0])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y104" ))
  \anodes<0>  (
    .PAD(anodes[0])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y104" ))
  anodes_0_OBUF (
    .I(\NlwBufferSignal_anodes_0_OBUF/I ),
    .O(anodes[0])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y50" ))
  \cathodes<1>  (
    .PAD(cathodes[1])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y50" ))
  cathodes_1_OBUF (
    .I(\NlwBufferSignal_cathodes_1_OBUF/I ),
    .O(cathodes[1])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y103" ))
  \anodes<1>  (
    .PAD(anodes[1])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y103" ))
  anodes_1_OBUF (
    .I(\NlwBufferSignal_anodes_1_OBUF/I ),
    .O(anodes[1])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y100" ))
  \cathodes<2>  (
    .PAD(cathodes[2])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y100" ))
  cathodes_2_OBUF (
    .I(\NlwBufferSignal_cathodes_2_OBUF/I ),
    .O(cathodes[2])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y52" ))
  \anodes<2>  (
    .PAD(anodes[2])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y52" ))
  anodes_2_OBUF (
    .I(\NlwBufferSignal_anodes_2_OBUF/I ),
    .O(anodes[2])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y116" ))
  \cathodes<3>  (
    .PAD(cathodes[3])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y116" ))
  cathodes_3_OBUF (
    .I(\NlwBufferSignal_cathodes_3_OBUF/I ),
    .O(cathodes[3])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y112" ))
  \anodes<3>  (
    .PAD(anodes[3])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y112" ))
  anodes_3_OBUF (
    .I(\NlwBufferSignal_anodes_3_OBUF/I ),
    .O(anodes[3])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y74" ))
  \cathodes<4>  (
    .PAD(cathodes[4])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y74" ))
  cathodes_4_OBUF (
    .I(\NlwBufferSignal_cathodes_4_OBUF/I ),
    .O(cathodes[4])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y83" ))
  \anodes<4>  (
    .PAD(anodes[4])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y83" ))
  anodes_4_OBUF (
    .I(\NlwBufferSignal_anodes_4_OBUF/I ),
    .O(anodes[4])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y62" ))
  \cathodes<5>  (
    .PAD(cathodes[5])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y62" ))
  cathodes_5_OBUF (
    .I(\NlwBufferSignal_cathodes_5_OBUF/I ),
    .O(cathodes[5])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y72" ))
  \anodes<5>  (
    .PAD(anodes[5])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y72" ))
  anodes_5_OBUF (
    .I(\NlwBufferSignal_anodes_5_OBUF/I ),
    .O(anodes[5])
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y136" ))
  rx_94 (
    .PAD(rx)
  );
  X_BUF #(
    .LOC ( "IOB_X1Y136" ))
  rx_IBUF (
    .O(rx_IBUF_717),
    .I(rx)
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y92" ))
  \cathodes<6>  (
    .PAD(cathodes[6])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y92" ))
  cathodes_6_OBUF (
    .I(\NlwBufferSignal_cathodes_6_OBUF/I ),
    .O(cathodes[6])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y104" ))
  \anodes<6>  (
    .PAD(anodes[6])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y104" ))
  anodes_6_OBUF (
    .I(\NlwBufferSignal_anodes_6_OBUF/I ),
    .O(anodes[6])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y111" ))
  \cathodes<7>  (
    .PAD(cathodes[7])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y111" ))
  cathodes_7_OBUF (
    .I(1'b1),
    .O(cathodes[7])
  );
  X_OPAD #(
    .LOC ( "IOB_X0Y53" ))
  \anodes<7>  (
    .PAD(anodes[7])
  );
  X_OBUF #(
    .LOC ( "IOB_X0Y53" ))
  anodes_7_OBUF (
    .I(\NlwBufferSignal_anodes_7_OBUF/I ),
    .O(anodes[7])
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y126" ))
  clock_109 (
    .PAD(clock)
  );
  X_BUF #(
    .LOC ( "IOB_X1Y126" ))
  \clock_BUFGP/IBUFG  (
    .O(\clock_BUFGP/IBUFG_721 ),
    .I(clock)
  );
  X_CKBUF #(
    .LOC ( "BUFGCTRL_X0Y31" ))
  \clock_BUFGP/BUFG  (
    .I(\NlwBufferSignal_clock_BUFGP/BUFG/IN ),
    .O(clock_BUFGP)
  );
  X_BUF   \anodes_4_OBUF/anodes_4_OBUF_AMUX_Delay  (
    .I(anodes_5_OBUF_151),
    .O(anodes_5_OBUF_0)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X1Y83" ),
    .INIT ( 64'hFBFBFBFBFBFBFBFB ))
  \display/anodes_instance/anodes<4>1  (
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .ADR0(\display/counter_mod4/COUNTS_temp [0]),
    .ADR2(\display/counter_mod4/COUNTS_temp [1]),
    .ADR5(1'b1),
    .O(anodes_4_OBUF_714)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X1Y83" ),
    .INIT ( 32'hF7F7F7F7 ))
  \display/anodes_instance/anodes<5>1  (
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .ADR0(\display/counter_mod4/COUNTS_temp [0]),
    .ADR2(\display/counter_mod4/COUNTS_temp [1]),
    .O(anodes_5_OBUF_151)
  );
  X_BUF   \anodes_2_OBUF/anodes_2_OBUF_DMUX_Delay  (
    .I(anodes_3_OBUF_157),
    .O(anodes_3_OBUF_0)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X1Y85" ),
    .INIT ( 64'hFFFFCFCFFFFFCFCF ))
  \display/anodes_instance/anodes<2>1  (
    .ADR0(1'b1),
    .ADR3(1'b1),
    .ADR2(\display/counter_mod4/COUNTS_temp [1]),
    .ADR4(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .ADR5(1'b1),
    .O(anodes_2_OBUF_710)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X1Y85" ),
    .INIT ( 32'hCFCFFFFF ))
  \display/anodes_instance/anodes<3>1  (
    .ADR0(1'b1),
    .ADR3(1'b1),
    .ADR2(\display/counter_mod4/COUNTS_temp [1]),
    .ADR4(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .O(anodes_3_OBUF_157)
  );
  X_BUF   \anodes_0_OBUF/anodes_0_OBUF_DMUX_Delay  (
    .I(anodes_1_OBUF_163),
    .O(anodes_1_OBUF_0)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X1Y103" ),
    .INIT ( 64'hFFFFEEEEFFFFEEEE ))
  \display/anodes_instance/anodes<0>1  (
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/counter_mod4/COUNTS_temp [1]),
    .ADR0(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .ADR5(1'b1),
    .O(anodes_0_OBUF_706)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X1Y103" ),
    .INIT ( 32'hFFFFDDDD ))
  \display/anodes_instance/anodes<1>1  (
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/counter_mod4/COUNTS_temp [1]),
    .ADR0(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .O(anodes_1_OBUF_163)
  );
  X_SFF #(
    .LOC ( "SLICE_X8Y84" ),
    .INIT ( 1'b0 ))
  \display/counter_mod4/COUNTS_temp_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/counter_mod4/COUNTS_temp_2/CLK ),
    .I(\display/counter_mod4/Mcount_count.counter2 ),
    .O(\display/counter_mod4/COUNTS_temp [2]),
    .SRST(GND),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y84" ),
    .INIT ( 64'h000000AC000000AC ))
  \display/cathodes_instance/Mmux_nibble<3>11  (
    .ADR3(\display/counter_mod4/COUNTS_temp [1]),
    .ADR2(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_749 ),
    .ADR4(\display/counter_mod4/COUNTS_temp [2]),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_751 ),
    .ADR5(1'b1),
    .O(\display/cathodes_instance/nibble [3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X8Y84" ),
    .INIT ( 32'h0FFFF000 ))
  \display/counter_mod4/Mcount_count.counter_xor<2>11  (
    .ADR3(\display/counter_mod4/COUNTS_temp [1]),
    .ADR2(\display/counter_mod4/COUNTS_temp [0]),
    .ADR0(1'b1),
    .ADR4(\display/counter_mod4/COUNTS_temp [2]),
    .ADR1(1'b1),
    .O(\display/counter_mod4/Mcount_count.counter2 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y84" ),
    .INIT ( 64'hAAAAF0F05050A0A0 ))
  \display/cathodes_instance/Mram_cathodes_for_digit111  (
    .ADR3(1'b1),
    .ADR1(1'b1),
    .ADR2(\display/cathodes_instance/nibble [2]),
    .ADR4(\display/cathodes_instance/nibble [0]),
    .ADR0(\display/cathodes_instance/nibble [1]),
    .ADR5(\display/cathodes_instance/nibble [3]),
    .O(cathodes_1_OBUF_707)
  );
  X_BUF   \cathodes_0_OBUF/cathodes_0_OBUF_CMUX_Delay  (
    .I(cathodes_3_OBUF_199),
    .O(cathodes_3_OBUF_0)
  );
  X_BUF   \cathodes_0_OBUF/cathodes_0_OBUF_BMUX_Delay  (
    .I(cathodes_4_OBUF_187),
    .O(cathodes_4_OBUF_0)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y85" ),
    .INIT ( 64'h0808929208089292 ))
  \display/cathodes_instance/Mram_cathodes_for_digit11  (
    .ADR3(1'b1),
    .ADR0(\display/cathodes_instance/nibble [0]),
    .ADR4(\display/cathodes_instance/nibble [1]),
    .ADR2(\display/cathodes_instance/nibble [2]),
    .ADR1(\display/cathodes_instance/nibble [3]),
    .ADR5(1'b1),
    .O(cathodes_0_OBUF_705)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X8Y85" ),
    .INIT ( 32'hA4A41212 ))
  \display/cathodes_instance/Mram_cathodes_for_digit31  (
    .ADR3(1'b1),
    .ADR0(\display/cathodes_instance/nibble [0]),
    .ADR4(\display/cathodes_instance/nibble [1]),
    .ADR2(\display/cathodes_instance/nibble [2]),
    .ADR1(\display/cathodes_instance/nibble [3]),
    .O(cathodes_3_OBUF_199)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y85" ),
    .INIT ( 64'h2121414121214141 ))
  \display/cathodes_instance/Mram_cathodes_for_digit61  (
    .ADR3(1'b1),
    .ADR0(\display/cathodes_instance/nibble [1]),
    .ADR2(\display/cathodes_instance/nibble [2]),
    .ADR1(\display/cathodes_instance/nibble [3]),
    .ADR4(\display/cathodes_instance/nibble [0]),
    .ADR5(1'b1),
    .O(cathodes_6_OBUF_718)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X8Y85" ),
    .INIT ( 32'h37371010 ))
  \display/cathodes_instance/Mram_cathodes_for_digit41  (
    .ADR3(1'b1),
    .ADR0(\display/cathodes_instance/nibble [1]),
    .ADR2(\display/cathodes_instance/nibble [2]),
    .ADR1(\display/cathodes_instance/nibble [3]),
    .ADR4(\display/cathodes_instance/nibble [0]),
    .O(cathodes_4_OBUF_187)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y85" ),
    .INIT ( 64'h00000A0A00000C0C ))
  \display/cathodes_instance/Mmux_nibble<0>11  (
    .ADR3(1'b1),
    .ADR4(\display/counter_mod4/COUNTS_temp [1]),
    .ADR2(\display/counter_mod4/COUNTS_temp [2]),
    .ADR5(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp_740 ),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_741 ),
    .O(\display/cathodes_instance/nibble [0])
  );
  X_BUF   \display/counter_mod4/COUNTS_temp<1>/display/counter_mod4/COUNTS_temp<1>_BMUX_Delay  (
    .I(cathodes_2_OBUF_213),
    .O(cathodes_2_OBUF_0)
  );
  X_SFF #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 1'b0 ))
  \display/counter_mod4/COUNTS_temp_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/counter_mod4/COUNTS_temp_1/CLK ),
    .I(\display/counter_mod4/Mcount_count.counter1 ),
    .O(\display/counter_mod4/COUNTS_temp [1]),
    .SRST(GND),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 64'h00000C0A00000C0A ))
  \display/cathodes_instance/Mmux_nibble<2>11  (
    .ADR2(\display/counter_mod4/COUNTS_temp [2]),
    .ADR3(\display/counter_mod4/COUNTS_temp [0]),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .ADR4(\display/counter_mod4/COUNTS_temp [1]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_750 ),
    .ADR5(1'b1),
    .O(\display/cathodes_instance/nibble [2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 32'h00FFFF00 ))
  \display/counter_mod4/Mcount_count.counter_xor<1>11  (
    .ADR0(1'b1),
    .ADR3(\display/counter_mod4/COUNTS_temp [0]),
    .ADR2(1'b1),
    .ADR4(\display/counter_mod4/COUNTS_temp [1]),
    .ADR1(1'b1),
    .O(\display/counter_mod4/Mcount_count.counter1 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 64'h3C000F0C3C000F0C ))
  \display/cathodes_instance/Mram_cathodes_for_digit51  (
    .ADR0(1'b1),
    .ADR2(\display/cathodes_instance/nibble [3]),
    .ADR1(\display/cathodes_instance/nibble [1]),
    .ADR3(\display/cathodes_instance/nibble [0]),
    .ADR4(\display/cathodes_instance/nibble [2]),
    .ADR5(1'b1),
    .O(cathodes_5_OBUF_715)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 32'hC0F0000C ))
  \display/cathodes_instance/Mram_cathodes_for_digit21  (
    .ADR0(1'b1),
    .ADR2(\display/cathodes_instance/nibble [3]),
    .ADR1(\display/cathodes_instance/nibble [1]),
    .ADR3(\display/cathodes_instance/nibble [0]),
    .ADR4(\display/cathodes_instance/nibble [2]),
    .O(cathodes_2_OBUF_213)
  );
  X_SFF #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 1'b0 ))
  \display/counter_mod4/COUNTS_temp_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/counter_mod4/COUNTS_temp_0/CLK ),
    .I(\display/counter_mod4/Mcount_count.counter ),
    .O(\display/counter_mod4/COUNTS_temp [0]),
    .SRST(GND),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X9Y84" ),
    .INIT ( 64'h00000000FFFFFFFF ))
  \display/counter_mod4/Mcount_count.counter1_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(\display/counter_mod4/COUNTS_temp [0]),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .O(\display/counter_mod4/Mcount_count.counter )
  );
  X_BUF   \anodes_6_OBUF/anodes_6_OBUF_AMUX_Delay  (
    .I(anodes_7_OBUF_224),
    .O(anodes_7_OBUF_0)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X11Y83" ),
    .INIT ( 64'hBFBFBFBFBFBFBFBF ))
  \display/anodes_instance/anodes<6>1  (
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR2(\display/counter_mod4/COUNTS_temp [1]),
    .ADR0(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .ADR5(1'b1),
    .O(anodes_6_OBUF_719)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X11Y83" ),
    .INIT ( 32'h7F7F7F7F ))
  \display/anodes_instance/anodes<7>1  (
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR2(\display/counter_mod4/COUNTS_temp [1]),
    .ADR0(\display/counter_mod4/COUNTS_temp [0]),
    .ADR1(\display/counter_mod4/COUNTS_temp [2]),
    .O(anodes_7_OBUF_224)
  );
  X_FF #(
    .LOC ( "SLICE_X11Y85" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp_740 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_BMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_pack_3 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_741 )
  );
  X_FF #(
    .LOC ( "SLICE_X11Y86" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_749 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X11Y86" ),
    .INIT ( 32'hFFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_747 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_rt_237 )
  );
  X_FF #(
    .LOC ( "SLICE_X11Y86" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_rt_237 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_pack_3 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X11Y86" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_746 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X11Y86" ),
    .INIT ( 64'h0000000033003030 ))
  \display/cathodes_instance/Mmux_nibble<1>11  (
    .ADR0(1'b1),
    .ADR1(\display/counter_mod4/COUNTS_temp [1]),
    .ADR5(\display/counter_mod4/COUNTS_temp [2]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_746 ),
    .ADR4(\display/counter_mod4/COUNTS_temp [0]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_747 ),
    .O(\display/cathodes_instance/nibble [1])
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_AMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_251 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X10Y86" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_251 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X13Y86" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_747 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y86" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_750 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_BUF   \display/clock_divisor_instance/clock_out_temp/display/clock_divisor_instance/clock_out_temp_BMUX_Delay  (
    .I(\display/clock_divisor_instance/clock_division.counter [0]),
    .O(\display/clock_divisor_instance/clock_division.counter<0>_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y69" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_out_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_out_temp/CLK ),
    .I(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o ),
    .O(\display/clock_divisor_instance/clock_out_temp_735 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y69" ),
    .INIT ( 64'h1000100010001000 ))
  \display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>3  (
    .ADR4(1'b1),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X28Y69" ),
    .INIT ( 32'hEFFF0000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_01  (
    .ADR4(\Result<0>1_0 ),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y69" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_0/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_0 ),
    .O(\display/clock_divisor_instance/clock_division.counter [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y69" ),
    .INIT ( 64'h8000000000000000 ))
  \display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1  (
    .ADR0(\display/clock_divisor_instance/clock_division.counter [3]),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [2]),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [9]),
    .ADR2(\display/clock_divisor_instance/clock_division.counter [8]),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [13]),
    .ADR3(\display/clock_divisor_instance/clock_division.counter [10]),
    .O(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_4/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_4 ),
    .O(\display/clock_divisor_instance/clock_division.counter [4]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 64'hFFFF0000AFFF0000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_41  (
    .ADR1(1'b1),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR4(\Result<4>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_4 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_3/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_3 ),
    .O(\display/clock_divisor_instance/clock_division.counter [3]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 64'hFFFF0000AFFF0000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_31  (
    .ADR1(1'b1),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR4(\Result<3>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_3 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_2/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_2 ),
    .O(\display/clock_divisor_instance/clock_division.counter [2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 64'hFFFFAFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_21  (
    .ADR1(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<2>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_2 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_1/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_1 ),
    .O(\display/clock_divisor_instance/clock_division.counter [1]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y70" ),
    .INIT ( 64'hFFAFFFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_14  (
    .ADR1(1'b1),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR3(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR4(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<1>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_1 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_9  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_9/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_9 ),
    .O(\display/clock_divisor_instance/clock_division.counter [9]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 64'hFFFF0000AFFF0000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_91  (
    .ADR1(1'b1),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR4(\Result<9>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_9 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 64'h0000000001000000 ))
  \display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>2  (
    .ADR2(\display/clock_divisor_instance/clock_division.counter [4]),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [5]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [6]),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [7]),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [1]),
    .ADR3(\display/clock_divisor_instance/clock_division.counter<0>_0 ),
    .O(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_6  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_6/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_6 ),
    .O(\display/clock_divisor_instance/clock_division.counter [6]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 64'hFFFFAFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_61  (
    .ADR1(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<6>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_6 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_5  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_5/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_5 ),
    .O(\display/clock_divisor_instance/clock_division.counter [5]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y71" ),
    .INIT ( 64'hFFFFAFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_51  (
    .ADR1(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<5>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_5 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y72" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_7  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_7/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_7 ),
    .O(\display/clock_divisor_instance/clock_division.counter [7]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y72" ),
    .INIT ( 64'hFFFFCFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_71  (
    .ADR0(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<7>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_7 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y72" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_10  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_10/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_10 ),
    .O(\display/clock_divisor_instance/clock_division.counter [10]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y72" ),
    .INIT ( 64'hFFFFAFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_101  (
    .ADR1(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<10>_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_10 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y72" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_8  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_8/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_8 ),
    .O(\display/clock_divisor_instance/clock_division.counter [8]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y72" ),
    .INIT ( 64'hFFFF0000AFFF0000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_81  (
    .ADR1(1'b1),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR4(\Result<8>1_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_8 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y73" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_11  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_11/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_11 ),
    .O(\display/clock_divisor_instance/clock_division.counter [11]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y73" ),
    .INIT ( 64'hFFFFCFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_111  (
    .ADR0(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<11>_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_11 )
  );
  X_FF #(
    .LOC ( "SLICE_X28Y74" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_13  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_13/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_13 ),
    .O(\display/clock_divisor_instance/clock_division.counter [13]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X28Y74" ),
    .INIT ( 64'hFFFFCFFF00000000 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_131  (
    .ADR0(1'b1),
    .ADR1(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR3(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR5(\Result<13>_0 ),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_13 )
  );
  X_BUF   \display/clock_divisor_instance/clock_division.counter<12>/display/clock_divisor_instance/clock_division.counter<12>_BMUX_Delay  (
    .I(Result[13]),
    .O(\Result<13>_0 )
  );
  X_BUF   \display/clock_divisor_instance/clock_division.counter<12>/display/clock_divisor_instance/clock_division.counter<12>_AMUX_Delay  (
    .I(\Result<12>_pack_2 ),
    .O(Result[12])
  );
  X_FF #(
    .LOC ( "SLICE_X29Y73" ),
    .INIT ( 1'b0 ))
  \display/clock_divisor_instance/clock_division.counter_12  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_12/CLK ),
    .I(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_12 ),
    .O(\display/clock_divisor_instance/clock_division.counter [12]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y73" ),
    .INIT ( 64'hFF00FF00AF00FF00 ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_eqn_121  (
    .ADR1(1'b1),
    .ADR0(\display/clock_divisor_instance/clock_division.counter [11]),
    .ADR4(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13>1_730 ),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR2(\display/clock_divisor_instance/PWR_27_o_clock_division.counter[13]_equal_1_o<13> ),
    .ADR3(Result[12]),
    .O(\display/clock_divisor_instance/Mcount_clock_division.counter_eqn_12 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X29Y73" ))
  \display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>  (
    .CI(\display/clock_divisor_instance/Mcount_clock_division.counter_cy[11] ),
    .CYINIT(1'b0),
    .CO({\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[3]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[2]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[1]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_CO[0]_UNCONNECTED }),
    .DI({\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_DI[3]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_DI[2]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_O[3]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_O[2]_UNCONNECTED , Result[13], \Result<12>_pack_2 }),
    .S({\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_S[3]_UNCONNECTED , 
\NLW_display/clock_divisor_instance/Mcount_clock_division.counter_xor<13>_S[2]_UNCONNECTED , 
\display/clock_divisor_instance/clock_division.counter<13>_rt_385 , \display/clock_divisor_instance/clock_division.counter<12>_rt_387 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y73" ),
    .INIT ( 64'hFFFFFFFF00000000 ))
  \display/clock_divisor_instance/clock_division.counter<13>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR5(\display/clock_divisor_instance/clock_division.counter [13]),
    .O(\display/clock_divisor_instance/clock_division.counter<13>_rt_385 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X29Y73" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \display/clock_divisor_instance/clock_division.counter<12>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\display/clock_divisor_instance/clock_division.counter [12]),
    .ADR5(1'b1),
    .O(\display/clock_divisor_instance/clock_division.counter<12>_rt_387 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X29Y73" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_24.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_24.A5LUT_O_UNCONNECTED )
  );
  X_FF #(
    .LOC ( "SLICE_X41Y106" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_751 ),
    .RST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X45Y110" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp2 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X45Y110" ),
    .INIT ( 64'h0000000200000002 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_COUNTS_temp[4]_MUX_18_o<4>1  (
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_COUNTS_temp[4]_MUX_18_o )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X45Y110" ),
    .INIT ( 32'h3C3CCCCC ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_xor<2>11  (
    .ADR0(1'b1),
    .ADR3(1'b1),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp2 )
  );
  X_SFF #(
    .LOC ( "SLICE_X45Y110" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp1 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X45Y110" ),
    .INIT ( 64'h0F0F0F0FF0F0F0F0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_xor<1>11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR4(1'b1),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp1 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<4>/uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<4>_DMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<0>_pack_1 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0])
  );
  X_SFF #(
    .LOC ( "SLICE_X45Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp4 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X45Y111" ),
    .INIT ( 64'h6AAAAAA86AAAAAA8 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_xor<4>11  (
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp4 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X45Y111" ),
    .INIT ( 32'h0F0F0F0D ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_xor<0>11  (
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp )
  );
  X_SFF #(
    .LOC ( "SLICE_X45Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<0>_pack_1 ),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<3>/uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<3>_CMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/reset_po_pack_3 ),
    .O(\uart_inst/uart_rx_inst/reset_po )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y111" ),
    .INIT ( 64'hF0000000F0000000 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/Mmux_increase_n_bits11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/read_rx )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X47Y111" ),
    .INIT ( 32'h00F00000 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/Mmux_reset_out11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .O(\uart_inst/uart_rx_inst/reset_po_pack_3 )
  );
  X_SFF #(
    .LOC ( "SLICE_X47Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_glue_set_430 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y111" ),
    .INIT ( 64'h3FFFBFFFC000EAAA ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_glue_set  (
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR0(\uart_inst/uart_rx_inst/load_tick_0 ),
    .ADR4(\uart_inst/uart_rx_inst/reset_po ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_glue_set_430 )
  );
  X_BUF   \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_DMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/load_tick ),
    .O(\uart_inst/uart_rx_inst/load_tick_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X47Y113" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In ),
    .O(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y113" ),
    .INIT ( 64'h30F0F5F530F0F5F5 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In1  (
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_734 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR0(rx_IBUF_717),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X47Y113" ),
    .INIT ( 32'h00000505 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/Mmux_load_tick_counter11  (
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR0(rx_IBUF_717),
    .O(\uart_inst/uart_rx_inst/load_tick )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_CMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_453 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6_rstpot_472 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 64'h0000DDFF00000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6_rstpot  (
    .ADR2(1'b1),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .ADR5(\Result<6>_0 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6_rstpot_472 )
  );
  X_FF #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In ),
    .O(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 64'hF4C4F4C4F4C4F4C4 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In1  (
    .ADR4(1'b1),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_0 ),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 32'hCFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot  (
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR0(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot_452 )
  );
  X_FF #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot_452 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_453 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 64'h0000400000000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o<9>  (
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [0]),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .ADR4(N5),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y115" ),
    .INIT ( 64'hFFFFFFFFFFFFFFFC ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o<9>_SW0  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [5]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [4]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [2]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [8]),
    .O(N5)
  );
  X_FF #(
    .LOC ( "SLICE_X47Y116" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5_rstpot_488 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [5]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y116" ),
    .INIT ( 64'h00F300FF00000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR5(\Result<5>_0 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5_rstpot_488 )
  );
  X_FF #(
    .LOC ( "SLICE_X47Y116" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4_rstpot_480 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [4]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X47Y116" ),
    .INIT ( 64'h00F300FF00000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR5(\Result<4>_0 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4_rstpot_480 )
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y110" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot_498 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X46Y110" ),
    .INIT ( 64'h00C500C500C500C5 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val1  (
    .ADR4(1'b1),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR0(rx_IBUF_717),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X46Y110" ),
    .INIT ( 32'hFFFE0004 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot  (
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_COUNTS_temp[4]_MUX_18_o ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR0(rx_IBUF_717),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot_498 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<4>/uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<4>_CMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<0>_pack_12 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0])
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<4>/uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<4>_BMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_520 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_0 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<4>/uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<4>_AMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<1>_pack_9 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1])
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4  (
    .CE(\uart_inst/uart_rx_inst/enable_stop ),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter4 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 64'h6CCCCCC86CCCCCC8 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter411  (
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter4 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 32'h55555551 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter1  (
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter )
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0  (
    .CE(\uart_inst/uart_rx_inst/enable_stop ),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<0>_pack_12 ),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3  (
    .CE(\uart_inst/uart_rx_inst/enable_stop ),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter3 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 64'h3CCCCCCC3CCCCCCC ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter31  (
    .ADR0(1'b1),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter3 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 32'h00000002 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_13_o_count.counter[4]_equal_2_o<4>1  (
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_13_o_count.counter[4]_equal_2_o )
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp  (
    .CE(\uart_inst/uart_rx_inst/enable_stop ),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_13_o_count.counter[4]_equal_2_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_520 ),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2  (
    .CE(\uart_inst/uart_rx_inst/enable_stop ),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter2 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 64'h0FF0F0F00FF0F0F0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter_xor<2>11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter2 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 32'h00FFFF00 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter_xor<1>11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR2(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter1_528 )
  );
  X_SFF #(
    .LOC ( "SLICE_X46Y111" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1  (
    .CE(\uart_inst/uart_rx_inst/enable_stop ),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter1_528 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<1>_pack_9 ),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X48Y113" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_PWR_14_o_MUX_26_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_734 ),
    .SRST(\uart_inst/uart_rx_inst/reset_po ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X48Y113" ),
    .INIT ( 64'hFF00000000000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_PWR_14_o_MUX_26_o<2>1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2]),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_PWR_14_o_MUX_26_o )
  );
  X_FF #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot_550 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 64'h00000000FF3F0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR4(\Result<3>_0 ),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot_550 )
  );
  X_FF #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot_558 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 64'h0000FF3F00000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR5(\Result<2>_0 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot_558 )
  );
  X_FF #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot_565 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 64'h00000000F050F0F0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot  (
    .ADR1(1'b1),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR2(\Result<1>_0 ),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot_565 )
  );
  X_FF #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot_543 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 64'h3300330033003300 ))
  \uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_enable_stop_count1  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/enable_stop )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X48Y114" ),
    .INIT ( 32'h0000F070 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot  (
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR2(\Result<0>_0 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot_543 )
  );
  X_FF #(
    .LOC ( "SLICE_X48Y116" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7_rstpot_575 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X48Y116" ),
    .INIT ( 64'h0000FF3F00000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .ADR5(\Result<7>_0 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7_rstpot_575 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<1>/uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<1>_BMUX_Delay  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<2>_pack_3 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2])
  );
  X_SFF #(
    .LOC ( "SLICE_X49Y113" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK ),
    .I(\Result<1>2 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y113" ),
    .INIT ( 64'h0F0FF0F00F0FF0F0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_xor<1>11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .ADR5(1'b1),
    .O(\Result<1>2 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y113" ),
    .INIT ( 32'h0FF0FF00 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_xor<2>11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .O(\Result<2>2 )
  );
  X_SFF #(
    .LOC ( "SLICE_X49Y113" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK ),
    .I(\Result<2>2 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<2>_pack_3 ),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X49Y113" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK ),
    .I(\Result<0>2 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .SRST(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y113" ),
    .INIT ( 64'h00000000FFFFFFFF ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_xor<0>11_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .O(\Result<0>2 )
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_BMUX_Delay  (
    .I(\Result<9>_pack_5 ),
    .O(Result[9])
  );
  X_BUF 
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>/uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_AMUX_Delay  (
    .I(\Result<8>_pack_6 ),
    .O(Result[8])
  );
  X_FF #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8_rstpot_614 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [8]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 64'h00000000F300FF00 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .ADR3(Result[8]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8_rstpot_614 )
  );
  X_FF #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 1'b0 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK ),
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9_rstpot_602 ),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .RST(GND),
    .SET(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X49Y116" ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>  (
    .CI(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[7] ),
    .CYINIT(1'b0),
    .CO({\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[3]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[2]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[1]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[0]_UNCONNECTED }),
    .DI({\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[3]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[2]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[3]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[2]_UNCONNECTED , \Result<9>_pack_5 , \Result<8>_pack_6 }),
    .S({\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[3]_UNCONNECTED , 
\NLW_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[2]_UNCONNECTED , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt_608 , 
\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt_610 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 64'h00000000FF3F0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9_rstpot  (
    .ADR0(1'b1),
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_PWR_11_o_MUX_11_o ),
    .ADR4(Result[9]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9_rstpot_602 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 64'hFFFFFFFF00000000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt_608 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [8]),
    .ADR5(1'b1),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt_610 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X49Y116" ),
    .INIT ( 32'h00000000 ))
  \N0_inv_10.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_inv_10.A5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X51Y113" ),
    .INIT ( 64'hFF20202020202020 ))
  \uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_val1  (
    .ADR1(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_728 ),
    .ADR2(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_726 ),
    .ADR0(\uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_727 ),
    .ADR3(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .ADR4(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR5(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2]),
    .O(\uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/Mcount_count.counter_val )
  );
  X_BUF   \NlwBufferBlock_cathodes_0_OBUF/I  (
    .I(cathodes_0_OBUF_705),
    .O(\NlwBufferSignal_cathodes_0_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_0_OBUF/I  (
    .I(anodes_0_OBUF_706),
    .O(\NlwBufferSignal_anodes_0_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_cathodes_1_OBUF/I  (
    .I(cathodes_1_OBUF_707),
    .O(\NlwBufferSignal_cathodes_1_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_1_OBUF/I  (
    .I(anodes_1_OBUF_0),
    .O(\NlwBufferSignal_anodes_1_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_cathodes_2_OBUF/I  (
    .I(cathodes_2_OBUF_0),
    .O(\NlwBufferSignal_cathodes_2_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_2_OBUF/I  (
    .I(anodes_2_OBUF_710),
    .O(\NlwBufferSignal_anodes_2_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_cathodes_3_OBUF/I  (
    .I(cathodes_3_OBUF_0),
    .O(\NlwBufferSignal_cathodes_3_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_3_OBUF/I  (
    .I(anodes_3_OBUF_0),
    .O(\NlwBufferSignal_anodes_3_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_cathodes_4_OBUF/I  (
    .I(cathodes_4_OBUF_0),
    .O(\NlwBufferSignal_cathodes_4_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_4_OBUF/I  (
    .I(anodes_4_OBUF_714),
    .O(\NlwBufferSignal_anodes_4_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_cathodes_5_OBUF/I  (
    .I(cathodes_5_OBUF_715),
    .O(\NlwBufferSignal_cathodes_5_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_5_OBUF/I  (
    .I(anodes_5_OBUF_0),
    .O(\NlwBufferSignal_anodes_5_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_cathodes_6_OBUF/I  (
    .I(cathodes_6_OBUF_718),
    .O(\NlwBufferSignal_cathodes_6_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_6_OBUF/I  (
    .I(anodes_6_OBUF_719),
    .O(\NlwBufferSignal_anodes_6_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_anodes_7_OBUF/I  (
    .I(anodes_7_OBUF_0),
    .O(\NlwBufferSignal_anodes_7_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_clock_BUFGP/BUFG/IN  (
    .I(\clock_BUFGP/IBUFG_721 ),
    .O(\NlwBufferSignal_clock_BUFGP/BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_display/counter_mod4/COUNTS_temp_2/CLK  (
    .I(\display/clock_divisor_instance/clock_out_temp_735 ),
    .O(\NlwBufferSignal_display/counter_mod4/COUNTS_temp_2/CLK )
  );
  X_BUF   \NlwBufferBlock_display/counter_mod4/COUNTS_temp_1/CLK  (
    .I(\display/clock_divisor_instance/clock_out_temp_735 ),
    .O(\NlwBufferSignal_display/counter_mod4/COUNTS_temp_1/CLK )
  );
  X_BUF   \NlwBufferBlock_display/counter_mod4/COUNTS_temp_0/CLK  (
    .I(\display/clock_divisor_instance/clock_out_temp_735 ),
    .O(\NlwBufferSignal_display/counter_mod4/COUNTS_temp_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_746 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_741 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_749 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_750 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_751 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_out_temp/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_out_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_0/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_0/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_4/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_4/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_3/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_3/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_2/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_2/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_1/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_1/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_9/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_9/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_6/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_6/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_5/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_5/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_7/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_7/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_10/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_10/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_8/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_8/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_11/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_11/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_13/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_13/CLK )
  );
  X_BUF   \NlwBufferBlock_display/clock_divisor_instance/clock_division.counter_12/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_display/clock_divisor_instance/clock_division.counter_12/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(rx_IBUF_717),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK  (
    .I(\uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_0 ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK  (
    .I(\uart_inst/uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_inst/uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK )
  );
  X_ONE   NlwBlock_uart_onBoard_VCC (
    .O(VCC)
  );
  X_ZERO   NlwBlock_uart_onBoard_GND (
    .O(GND)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

