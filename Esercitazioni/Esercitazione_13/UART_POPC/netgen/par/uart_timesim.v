////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: uart_timesim.v
// /___/   /\     Timestamp: Tue Feb 26 14:12:54 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 3 -pcf uart.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim uart.ncd uart_timesim.v 
// Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
// Input file	: uart.ncd
// Output file	: /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_13/UART_POPC/netgen/par/uart_timesim.v
// # of Modules	: 1
// Design Name	: uart
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

module uart (
  clock, reset, rx, rd_uart, wr_uart, tx, rx_empty, tx_full, din, dout
);
  input clock;
  input reset;
  input rx;
  input rd_uart;
  input wr_uart;
  output tx;
  output rx_empty;
  output tx_full;
  input [7 : 0] din;
  output [7 : 0] dout;
  wire \uart_rx_inst/enable_stop_0 ;
  wire reset_IBUF_376;
  wire \uart_rx_inst/reset_out ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ;
  wire \uart_rx_inst/read_rx ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ;
  wire \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ;
  wire \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ;
  wire clock_BUFGP;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_388 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_389 ;
  wire rx_IBUF_390;
  wire \uart_rx_inst/load_tick_0 ;
  wire N4;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp3 ;
  wire N10_0;
  wire \uart_rx_inst/reset_po ;
  wire \Result<0>_0 ;
  wire \Result<1>_0 ;
  wire \Result<2>_0 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[3] ;
  wire \Result<3>_0 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[7] ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp_420 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_421 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_422 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_0 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_0 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_425 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_0 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1_427 ;
  wire \clock_BUFGP/IBUFG_428 ;
  wire N0;
  wire N2;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_431 ;
  wire N8;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_12_o_count.counter[4]_equal_2_o ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter4 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt_12 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt_9 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt_0 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt_43 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt_39 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt_35 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt_24 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt_59 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt_56 ;
  wire \ProtoComp11.INTERMDISABLE_GND.0 ;
  wire \clock/ProtoComp11.INTERMDISABLE_GND.0 ;
  wire \reset/ProtoComp11.INTERMDISABLE_GND.0 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot_115 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot_105 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot_139 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot_127 ;
  wire \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot_123 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot1_150 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_rstpot_158 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<2>_pack_8 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2_rstpot_184 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_rstpot_183 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0_rstpot_176 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1_rstpot_166 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val_pack_1 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<1>_pack_2 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1_rstpot_195 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2_rstpot_194 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0_rstpot_229 ;
  wire N10;
  wire \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4_rstpot_213 ;
  wire \uart_rx_inst/enable_stop ;
  wire \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In ;
  wire \uart_rx_inst/load_tick ;
  wire \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_rstpot_258 ;
  wire N13;
  wire N12;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3_rstpot_269 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2_rstpot_292 ;
  wire \uart_rx_inst/reset_out_pack_2 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1_rstpot_322 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0_rstpot_316 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4_rstpot_308 ;
  wire \uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter_pack_15 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_339 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_348 ;
  wire \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_356 ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK ;
  wire \NlwBufferSignal_dout_0_OBUF/I ;
  wire \NlwBufferSignal_dout_1_OBUF/I ;
  wire \NlwBufferSignal_dout_2_OBUF/I ;
  wire \NlwBufferSignal_dout_3_OBUF/I ;
  wire \NlwBufferSignal_dout_4_OBUF/I ;
  wire \NlwBufferSignal_dout_5_OBUF/I ;
  wire \NlwBufferSignal_dout_6_OBUF/I ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/IN ;
  wire \NlwBufferSignal_clock_BUFGP/BUFG/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ;
  wire \NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN ;
  wire \NLW_N1_5.D5LUT_O_UNCONNECTED ;
  wire \NLW_ProtoComp7.CYINITGND_O_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[0]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[1]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_4.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_3.B5LUT_O_UNCONNECTED ;
  wire \NLW_rx_empty_OBUF.A5LUT_O_UNCONNECTED ;
  wire VCC;
  wire GND;
  wire \NLW_N1_9.D5LUT_O_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[0]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[1]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_8.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_7.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_6.A5LUT_O_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[0]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[1]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[2]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[3]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[1]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[2]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[3]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[2]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[3]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[2]_UNCONNECTED ;
  wire \NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[3]_UNCONNECTED ;
  wire \NLW_N1_10.A5LUT_O_UNCONNECTED ;
  wire [4 : 0] \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp ;
  wire [4 : 0] \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp ;
  wire [9 : 0] \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter ;
  wire [2 : 0] \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter ;
  wire [0 : 0] \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut ;
  wire [9 : 0] Result;
  initial $sdf_annotate("netgen/par/uart_timesim.sdf");
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_DMUX_Delay  (
    .I(Result[3]),
    .O(\Result<3>_0 )
  );
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CMUX_Delay  (
    .I(Result[2]),
    .O(\Result<2>_0 )
  );
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_BMUX_Delay  (
    .I(Result[1]),
    .O(\Result<1>_0 )
  );
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>/uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_AMUX_Delay  (
    .I(Result[0]),
    .O(\Result<0>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt_0 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 32'h00000000 ))
  \N1_5.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_5.D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X54Y117" ))
  \ProtoComp7.CYINITGND  (
    .O(\NLW_ProtoComp7.CYINITGND_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X54Y117" ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>  (
    .CI(1'b0),
    .CYINIT(1'b0),
    .CO({\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[3] , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[2]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[1]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<3>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({Result[3], Result[2], Result[1], Result[0]}),
    .S({\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<3>_rt_0 , \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt_9 , 
\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt_12 , \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut [0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [2]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<2>_rt_9 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 32'h00000000 ))
  \N1_4.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_4.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<1>_rt_12 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 32'h00000000 ))
  \N1_3.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_3.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 64'h0000FFFF0000FFFF ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut<0>_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [0]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_lut [0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y117" ),
    .INIT ( 32'hFFFFFFFF ))
  \rx_empty_OBUF.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_rx_empty_OBUF.A5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK ),
    .I(Result[7]),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .SRST(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt_24 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 32'h00000000 ))
  \N1_9.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_9.D5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK ),
    .I(Result[6]),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .SRST(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X54Y118" ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>  (
    .CI(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[3] ),
    .CYINIT(1'b0),
    .CO({\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[7] , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[2]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[1]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy<7>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[7], Result[6], Result[5], Result[4]}),
    .S({\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<7>_rt_24 , \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt_35 , 
\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt_39 , \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt_43 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .ADR3(1'b1),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<6>_rt_35 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 32'h00000000 ))
  \N1_8.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_8.C5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK ),
    .I(Result[5]),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [5]),
    .SRST(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [5]),
    .ADR3(1'b1),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<5>_rt_39 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 32'h00000000 ))
  \N1_7.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_7.B5LUT_O_UNCONNECTED )
  );
  X_SFF #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK ),
    .I(Result[4]),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [4]),
    .SRST(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [4]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<4>_rt_43 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y118" ),
    .INIT ( 32'h00000000 ))
  \N1_6.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_6.A5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X54Y119" ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>  (
    .CI(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_cy[7] ),
    .CYINIT(1'b0),
    .CO({\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[3]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[2]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[1]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_CO[0]_UNCONNECTED }),
    .DI({\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[3]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[2]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_DI[1]_UNCONNECTED , 1'b0}),
    .O({\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[3]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_O[2]_UNCONNECTED , Result[9], Result[8]}),
    .S({\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[3]_UNCONNECTED , 
\NLW_uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_xor<9>_S[2]_UNCONNECTED , 
\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt_56 , \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt_59 })
  );
  X_SFF #(
    .LOC ( "SLICE_X54Y119" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK ),
    .I(Result[9]),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .SRST(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y119" ),
    .INIT ( 64'hFFFFFFFF00000000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<9>_rt_56 )
  );
  X_SFF #(
    .LOC ( "SLICE_X54Y119" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK ),
    .I(Result[8]),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [8]),
    .SRST(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X54Y119" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [8]),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter<8>_rt_59 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X54Y119" ),
    .INIT ( 32'h00000000 ))
  \N1_10.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_10.A5LUT_O_UNCONNECTED )
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y147" ))
  rx_empty_35 (
    .PAD(rx_empty)
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y147" ))
  rx_empty_OBUF (
    .I(1'b1),
    .O(rx_empty)
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y142" ))
  \dout<0>  (
    .PAD(dout[0])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y142" ))
  dout_0_OBUF (
    .I(\NlwBufferSignal_dout_0_OBUF/I ),
    .O(dout[0])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y140" ))
  \dout<1>  (
    .PAD(dout[1])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y140" ))
  dout_1_OBUF (
    .I(\NlwBufferSignal_dout_1_OBUF/I ),
    .O(dout[1])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y141" ))
  \dout<2>  (
    .PAD(dout[2])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y141" ))
  dout_2_OBUF (
    .I(\NlwBufferSignal_dout_2_OBUF/I ),
    .O(dout[2])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y138" ))
  \dout<3>  (
    .PAD(dout[3])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y138" ))
  dout_3_OBUF (
    .I(\NlwBufferSignal_dout_3_OBUF/I ),
    .O(dout[3])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y137" ))
  \dout<4>  (
    .PAD(dout[4])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y137" ))
  dout_4_OBUF (
    .I(\NlwBufferSignal_dout_4_OBUF/I ),
    .O(dout[4])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y136" ))
  \dout<5>  (
    .PAD(dout[5])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y136" ))
  dout_5_OBUF (
    .I(\NlwBufferSignal_dout_5_OBUF/I ),
    .O(dout[5])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y135" ))
  \dout<6>  (
    .PAD(dout[6])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y135" ))
  dout_6_OBUF (
    .I(\NlwBufferSignal_dout_6_OBUF/I ),
    .O(dout[6])
  );
  X_OPAD #(
    .LOC ( "IOB_X1Y139" ))
  \dout<7>  (
    .PAD(dout[7])
  );
  X_OBUF #(
    .LOC ( "IOB_X1Y139" ))
  dout_7_OBUF (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1_427 ),
    .O(dout[7])
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y145" ))
  rx_63 (
    .PAD(rx)
  );
  X_ZERO #(
    .LOC ( "IOB_X1Y145" ))
  \ProtoComp11.INTERMDISABLE_GND  (
    .O(\ProtoComp11.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X1Y145" ))
  rx_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\ProtoComp11.INTERMDISABLE_GND.0 ),
    .O(rx_IBUF_390),
    .I(rx),
    .TPWRGT(1'b1)
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y128" ))
  clock_67 (
    .PAD(clock)
  );
  X_ZERO #(
    .LOC ( "IOB_X1Y128" ))
  \ProtoComp11.INTERMDISABLE_GND.1  (
    .O(\clock/ProtoComp11.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X1Y128" ))
  \clock_BUFGP/IBUFG  (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\clock/ProtoComp11.INTERMDISABLE_GND.0 ),
    .O(\clock_BUFGP/IBUFG_428 ),
    .I(clock),
    .TPWRGT(1'b1)
  );
  X_IPAD #(
    .LOC ( "IOB_X1Y144" ))
  reset_71 (
    .PAD(reset)
  );
  X_ZERO #(
    .LOC ( "IOB_X1Y144" ))
  \ProtoComp11.INTERMDISABLE_GND.2  (
    .O(\reset/ProtoComp11.INTERMDISABLE_GND.0 )
  );
  X_IBUF_INTERMDISABLE_TPWRGT #(
    .LOC ( "IOB_X1Y144" ))
  reset_IBUF (
    .IBUFDISABLE(1'b0),
    .INTERMDISABLE(\reset/ProtoComp11.INTERMDISABLE_GND.0 ),
    .O(reset_IBUF_376),
    .I(reset),
    .TPWRGT(1'b1)
  );
  X_FF #(
    .LOC ( "OLOGIC_X1Y139" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1_427 ),
    .SET(GND),
    .RST(\uart_rx_inst/reset_po )
  );
  X_CKBUF #(
    .LOC ( "BUFGCTRL_X0Y31" ))
  \clock_BUFGP/BUFG  (
    .I(\NlwBufferSignal_clock_BUFGP/BUFG/IN ),
    .O(clock_BUFGP)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y117" ),
    .INIT ( 64'hAAEAAAEAFFFFAAEA ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val2  (
    .ADR0(reset_IBUF_376),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR3(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR4(N2),
    .ADR5(N0),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val )
  );
  X_FF #(
    .LOC ( "SLICE_X55Y117" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot_105 ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y117" ),
    .INIT ( 64'h0000FFFF00000000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<1>_0 ),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1_rstpot_105 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y117" ),
    .INIT ( 64'hFFFFFFFFFFFFFFFC ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val1_SW0  (
    .ADR0(1'b1),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [5]),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [0]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [4]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [8]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [2]),
    .O(N0)
  );
  X_FF #(
    .LOC ( "SLICE_X55Y117" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot_115 ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y117" ),
    .INIT ( 64'h1000500010105050 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot  (
    .ADR2(\Result<0>_0 ),
    .ADR0(reset_IBUF_376),
    .ADR5(N2),
    .ADR4(N4),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR3(N0),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0_rstpot_115 )
  );
  X_FF #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot_127 ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 64'h0000000000000008 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot  (
    .ADR3(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .ADR2(N8),
    .ADR5(\uart_rx_inst/reset_po ),
    .ADR4(N0),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_rstpot_127 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 64'h0000FFFFFFFFFFFF ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val1_SW1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .O(N8)
  );
  X_FF #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot_139 ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 64'h00000000FFFF0000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\Result<3>_0 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3_rstpot_139 )
  );
  X_FF #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot_123 ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y118" ),
    .INIT ( 64'h00000000FFFF0000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\Result<2>_0 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val ),
    .O(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2_rstpot_123 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X55Y119" ),
    .INIT ( 64'h00C0000000000000 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val2_SW0  (
    .ADR0(1'b1),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [9]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [7]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [6]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [3]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter [1]),
    .O(N2)
  );
  X_FF #(
    .LOC ( "SLICE_X60Y109" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot1_150 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X60Y109" ),
    .INIT ( 64'h000000008888888D ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot1  (
    .ADR0(\uart_rx_inst/load_tick_0 ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR4(N10_0),
    .ADR5(\uart_rx_inst/reset_po ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot1_150 )
  );
  X_FF #(
    .LOC ( "SLICE_X60Y110" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_rstpot_158 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X60Y110" ),
    .INIT ( 64'h00000000FF00FF30 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_rstpot  (
    .ADR0(1'b1),
    .ADR1(reset_IBUF_376),
    .ADR2(\uart_rx_inst/load_tick_0 ),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp3 ),
    .ADR4(\uart_rx_inst/reset_out ),
    .ADR5(\uart_rx_inst/reset_po ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3_rstpot_158 )
  );
  X_BUF   \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<1>/uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<1>_AMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<2>_pack_8 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2])
  );
  X_FF #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1_rstpot_166 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 64'h00000D0F0D0F0000 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1_rstpot  (
    .ADR0(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR2(reset_IBUF_376),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1_rstpot_166 )
  );
  X_FF #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0_rstpot_176 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 64'hAFAAAAAAAFAAAAAA ))
  \uart_rx_inst/reset_po1  (
    .ADR0(reset_IBUF_376),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR4(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR1(1'b1),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR5(1'b1),
    .O(\uart_rx_inst/reset_po )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 32'h10111111 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0_rstpot  (
    .ADR0(reset_IBUF_376),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR4(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0_rstpot_176 )
  );
  X_FF #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_rstpot_183 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_389 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 64'h00C0000000C00000 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_rstpot  (
    .ADR0(1'b1),
    .ADR3(\uart_rx_inst/reset_po ),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_rstpot_183 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 32'h003F00C0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2_rstpot  (
    .ADR0(1'b1),
    .ADR3(\uart_rx_inst/reset_po ),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [0]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [1]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter [2]),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2_rstpot_184 )
  );
  X_FF #(
    .LOC ( "SLICE_X60Y115" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2_rstpot_184 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter<2>_pack_8 ),
    .RST(GND),
    .SET(GND)
  );
  X_BUF   \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<2>/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<2>_CMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<1>_pack_2 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1])
  );
  X_BUF   \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<2>/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<2>_BMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val_pack_1 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val )
  );
  X_FF #(
    .LOC ( "SLICE_X61Y109" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2_rstpot_194 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y109" ),
    .INIT ( 64'h00003CCC00003CCC ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2_rstpot  (
    .ADR0(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2_rstpot_194 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X61Y109" ),
    .INIT ( 32'h00000FF0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1_rstpot  (
    .ADR0(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR1(1'b1),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1_rstpot_195 )
  );
  X_FF #(
    .LOC ( "SLICE_X61Y109" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1_rstpot_195 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<1>_pack_2 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y109" ),
    .INIT ( 64'h0000F0F00000F0F0 ))
  \uart_rx_inst/uart_rx_po_inst/baud_generator/Mcount_count.counter_val2_SW1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR5(1'b1),
    .O(N4)
  );
  X_LUT5 #(
    .LOC ( "SLICE_X61Y109" ),
    .INIT ( 32'hFF00FFD1 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val1  (
    .ADR3(reset_IBUF_376),
    .ADR0(rx_IBUF_390),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR4(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val_pack_1 )
  );
  X_BUF   \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<4>/uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp<4>_BMUX_Delay  (
    .I(N10),
    .O(N10_0)
  );
  X_FF #(
    .LOC ( "SLICE_X61Y110" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4_rstpot_213 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y110" ),
    .INIT ( 64'h0000000078F0F0E0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4_rstpot  (
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4_rstpot_213 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y110" ),
    .INIT ( 64'h5AAAAAAA5AAAAAAA ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_xor<3>11  (
    .ADR1(1'b1),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp3 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X61Y110" ),
    .INIT ( 32'hFFFFBBBB ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_rstpot1_SW0  (
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .O(N10)
  );
  X_FF #(
    .LOC ( "SLICE_X61Y110" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0_rstpot_229 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y110" ),
    .INIT ( 64'h000000000F0E0F0F ))
  \uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0_rstpot  (
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [4]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [3]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [2]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [0]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp [1]),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_tick/Mcount_COUNTS_temp_val ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0_rstpot_229 )
  );
  X_BUF   \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_BMUX_Delay  (
    .I(\uart_rx_inst/load_tick ),
    .O(\uart_rx_inst/load_tick_0 )
  );
  X_BUF   \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_AMUX_Delay  (
    .I(\uart_rx_inst/enable_stop ),
    .O(\uart_rx_inst/enable_stop_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X61Y111" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK ),
    .I(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In ),
    .O(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .RST(reset_IBUF_376),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y111" ),
    .INIT ( 64'h0DCDCDCD0DCDCDCD ))
  \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In1  (
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp_389 ),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR0(rx_IBUF_390),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2-In )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X61Y111" ),
    .INIT ( 32'h01010101 ))
  \uart_rx_inst/uart_rx_cu_inst/Mmux_load_tick_counter11  (
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR0(rx_IBUF_390),
    .O(\uart_rx_inst/load_tick )
  );
  X_FF #(
    .LOC ( "SLICE_X61Y111" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK ),
    .I(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In ),
    .O(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .RST(reset_IBUF_376),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X61Y111" ),
    .INIT ( 64'hDCD0DCD0DCD0DCD0 ))
  \uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In1  (
    .ADR4(1'b1),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_388 ),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1-In )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X61Y111" ),
    .INIT ( 32'h30303030 ))
  \uart_rx_inst/uart_rx_cu_inst/current_state_enable_stop_count1  (
    .ADR0(1'b1),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR3(1'b1),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR4(1'b1),
    .O(\uart_rx_inst/enable_stop )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X62Y112" ),
    .INIT ( 64'h0000000000000500 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_12_o_count.counter[4]_equal_2_o<4>1  (
    .ADR1(1'b1),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_12_o_count.counter[4]_equal_2_o )
  );
  X_FF #(
    .LOC ( "SLICE_X62Y112" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_rstpot_258 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_388 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X62Y112" ),
    .INIT ( 64'h3120101031203030 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_rstpot  (
    .ADR1(reset_IBUF_376),
    .ADR4(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_388 ),
    .ADR0(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_stop/PWR_12_o_count.counter[4]_equal_2_o ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp_rstpot_258 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X63Y109" ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3_rstpot  (
    .IA(N12),
    .IB(N13),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3_rstpot_269 ),
    .SEL(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y109" ),
    .INIT ( 64'h0505000055550000 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3_rstpot_F  (
    .ADR3(1'b1),
    .ADR1(1'b1),
    .ADR0(reset_IBUF_376),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .O(N12)
  );
  X_FF #(
    .LOC ( "SLICE_X63Y109" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3_rstpot_269 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y109" ),
    .INIT ( 64'h4555555510000000 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3_rstpot_G  (
    .ADR0(reset_IBUF_376),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR1(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .O(N13)
  );
  X_BUF   \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<2>/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<2>_BMUX_Delay  (
    .I(\uart_rx_inst/reset_out_pack_2 ),
    .O(\uart_rx_inst/reset_out )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y110" ),
    .INIT ( 64'hF0000000F0000000 ))
  \uart_rx_inst/uart_rx_cu_inst/Mmux_increase_n_bits11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR3(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR5(1'b1),
    .O(\uart_rx_inst/read_rx )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X63Y110" ),
    .INIT ( 32'h0F000000 ))
  \uart_rx_inst/uart_rx_cu_inst/Mmux_reset_out11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR3(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .O(\uart_rx_inst/reset_out_pack_2 )
  );
  X_FF #(
    .LOC ( "SLICE_X63Y110" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2_rstpot_292 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y110" ),
    .INIT ( 64'h0000133300002000 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2_rstpot  (
    .ADR0(\uart_rx_inst/enable_stop_0 ),
    .ADR1(reset_IBUF_376),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR4(\uart_rx_inst/reset_out ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2_rstpot_292 )
  );
  X_BUF   \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<1>/uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp<1>_CMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter_pack_15 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter )
  );
  X_FF #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1_rstpot_322 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 64'h2012203030123030 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1_rstpot  (
    .ADR1(reset_IBUF_376),
    .ADR0(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR3(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1_rstpot_322 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 64'h78F0F0E078F0F0E0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter411  (
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .ADR5(1'b1),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter4 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 32'h33333323 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter1  (
    .ADR2(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [3]),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [2]),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR0(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [1]),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter_pack_15 )
  );
  X_FF #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4_rstpot_308 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 64'h00D400DC0084008C ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4_rstpot  (
    .ADR3(reset_IBUF_376),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR1(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [4]),
    .ADR0(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter4 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4_rstpot_308 )
  );
  X_FF #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK ),
    .I(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0_rstpot_316 ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X63Y112" ),
    .INIT ( 64'h3133212310100000 ))
  \uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0_rstpot  (
    .ADR1(reset_IBUF_376),
    .ADR2(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1_384 ),
    .ADR3(\uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp_383 ),
    .ADR5(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp [0]),
    .ADR0(\uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2_385 ),
    .ADR4(\uart_rx_inst/uart_rx_po_inst/counter_stop/Mcount_count.counter ),
    .O(\uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0_rstpot_316 )
  );
  X_FF #(
    .LOC ( "SLICE_X66Y130" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_431 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_DMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_339 ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X67Y130" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_339 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X72Y135" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_425 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_AMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_348 ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X72Y136" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_348 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X75Y140" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_422 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_BUF 
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_BMUX_Delay  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_356 ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_0 )
  );
  X_FF #(
    .LOC ( "SLICE_X74Y137" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_356 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X88Y140" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp_420 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X88Y140" ),
    .INIT ( 1'b0 ))
  \uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK ),
    .I(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN ),
    .O(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_421 ),
    .RST(\uart_rx_inst/reset_po ),
    .SET(GND)
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_7/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_6/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_5/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_4/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_9/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_8/CLK )
  );
  X_BUF   \NlwBufferBlock_dout_0_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp_420 ),
    .O(\NlwBufferSignal_dout_0_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_dout_1_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_421 ),
    .O(\NlwBufferSignal_dout_1_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_dout_2_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_422 ),
    .O(\NlwBufferSignal_dout_2_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_dout_3_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_dout_3_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_dout_4_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_dout_4_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_dout_5_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_425 ),
    .O(\NlwBufferSignal_dout_5_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_dout_6_OBUF/I  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_dout_6_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/IN  (
    .I(rx_IBUF_390),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_1/IN )
  );
  X_BUF   \NlwBufferBlock_clock_BUFGP/BUFG/IN  (
    .I(\clock_BUFGP/IBUFG_428 ),
    .O(\NlwBufferSignal_clock_BUFGP/BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_3/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/baud_generator/count.counter_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_3/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_n_bits/count.counter_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_4/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_tick/COUNTS_temp_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK  (
    .I(clock_BUFGP),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_cu_inst/current_state_FSM_FFd1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/count_hit_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_3/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_2/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_1/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_4/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK  (
    .I(\uart_rx_inst/uart_rx_po_inst/baud_generator/count_hit_temp_381 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/counter_stop/COUNTS_temp_0/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(rx_IBUF_390),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[7].shift_reg_right.flipflop/flipflop_d/q_temp_431 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[6].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[5].shift_reg_right.flipflop/flipflop_d/q_temp_425 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[4].shift_reg_right.flipflop/flipflop_d/q_temp_0 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[3].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp_421 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[0].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK  (
    .I(\uart_rx_inst/read_rx ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/CLK )
  );
  X_BUF   \NlwBufferBlock_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN  (
    .I(\uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[2].shift_reg_right.flipflop/flipflop_d/q_temp_422 ),
    .O(\NlwBufferSignal_uart_rx_inst/uart_rx_po_inst/received_byte_reg/shift_reg[1].shift_reg_right.flipflop/flipflop_d/q_temp/IN )
  );
  X_ONE   NlwBlock_uart_VCC (
    .O(VCC)
  );
  X_ZERO   NlwBlock_uart_GND (
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

