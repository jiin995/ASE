--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: uart_onBoard_timesim.vhd
-- /___/   /\     Timestamp: Tue Feb 26 14:15:50 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 1 -pcf uart_onBoard.pcf -rpw 100 -tpw 0 -ar Structure -tm uart_onBoard -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim uart_onBoard.ncd uart_onBoard_timesim.vhd 
-- Device	: 7a100tcsg324-1 (PRODUCTION 1.10 2013-10-13)
-- Input file	: uart_onBoard.ncd
-- Output file	: /home/jiin995/ASE_WorkSpace/Test/UART/netgen/par/uart_onBoard_timesim.vhd
-- # of Entities	: 1
-- Design Name	: uart_onBoard
-- Xilinx	: /opt/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity uart_onBoard is
  port (
    clock : in STD_LOGIC := 'X'; 
    rx : in STD_LOGIC := 'X'; 
    rx_empty : out STD_LOGIC; 
    tx : out STD_LOGIC; 
    tx_full : out STD_LOGIC; 
    anodes : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    cathodes : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end uart_onBoard;

architecture Structure of uart_onBoard is
  signal uart_inst_uart_tx_inst_current_state_FSM_FFd1_781 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_current_state_FSM_FFd2_784 : STD_LOGIC; 
  signal uart_inst_input_buffer_flag_reg_785 : STD_LOGIC; 
  signal clock_BUFGP : STD_LOGIC; 
  signal uart_inst_baud_generator_count_hit_temp_787 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_n0104_inv_790 : STD_LOGIC; 
  signal N10_0 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_current_state_FSM_FFd1_794 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_current_state_FSM_FFd2_795 : STD_LOGIC; 
  signal rx_IBUF_797 : STD_LOGIC; 
  signal uart_inst_output_buffer_flag_reg_799 : STD_LOGIC; 
  signal uart_inst_rx_done_int : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_Mmux_tick_count_next41_810 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_n0131_inv_0 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_n0122_inv : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mmux_tick_count_next211_0 : STD_LOGIC; 
  signal cathodes_0_OBUF_826 : STD_LOGIC; 
  signal cathodes_3_OBUF_0 : STD_LOGIC; 
  signal anodes_0_OBUF_832 : STD_LOGIC; 
  signal anodes_1_OBUF_0 : STD_LOGIC; 
  signal anodes_2_OBUF_837 : STD_LOGIC; 
  signal anodes_3_OBUF_0 : STD_LOGIC; 
  signal anodes_4_OBUF_839 : STD_LOGIC; 
  signal anodes_5_OBUF_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_out_temp_841 : STD_LOGIC; 
  signal uart_inst_output_buffer_buf_reg_5_0 : STD_LOGIC; 
  signal anodes_6_OBUF_843 : STD_LOGIC; 
  signal anodes_7_OBUF_0 : STD_LOGIC; 
  signal cathodes_5_OBUF_845 : STD_LOGIC; 
  signal cathodes_2_OBUF_0 : STD_LOGIC; 
  signal uart_inst_output_buffer_buf_reg_6_0 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_n0110_inv : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_n0110_inv11_0 : STD_LOGIC; 
  signal Result_0_0 : STD_LOGIC; 
  signal uart_inst_baud_generator_Mcount_count_counter_cy_3_Q_854 : STD_LOGIC; 
  signal uart_inst_baud_generator_Mcount_count_counter_val : STD_LOGIC; 
  signal uart_inst_baud_generator_Mcount_count_counter_cy_7_Q_860 : STD_LOGIC; 
  signal Result_0_1_0 : STD_LOGIC; 
  signal Result_1_1_0 : STD_LOGIC; 
  signal Result_2_1_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q_870 : STD_LOGIC; 
  signal Result_3_1_0 : STD_LOGIC; 
  signal Result_4_1_0 : STD_LOGIC; 
  signal Result_5_1_0 : STD_LOGIC; 
  signal Result_6_1_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q_879 : STD_LOGIC; 
  signal Result_7_1_0 : STD_LOGIC; 
  signal Result_8_1_0 : STD_LOGIC; 
  signal Result_9_1_0 : STD_LOGIC; 
  signal Result_10_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q_888 : STD_LOGIC; 
  signal Result_11_0 : STD_LOGIC; 
  signal Result_12_0 : STD_LOGIC; 
  signal rx_empty_OBUF_0 : STD_LOGIC; 
  signal cathodes_1_OBUF_895 : STD_LOGIC; 
  signal cathodes_4_OBUF_0 : STD_LOGIC; 
  signal cathodes_6_OBUF_897 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_tx_current_898 : STD_LOGIC; 
  signal clock_BUFGP_IBUFG_899 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901 : STD_LOGIC; 
  signal display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mmux_tick_count_next21_905 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal uart_inst_output_buffer_buf_reg_4_0 : STD_LOGIC; 
  signal uart_inst_output_buffer_buf_reg_7_0 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_Mmux_tick_count_next3 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_1_rt_17 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_2_rt_13 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_3_rt_2 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_4_rt_48 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_5_rt_44 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_6_rt_40 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_7_rt_29 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_8_rt_64 : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_9_rt_61 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_1_rt_80 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_2_rt_77 : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_3_rt_68 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_4_rt_105 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_5_rt_102 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_6_rt_99 : STD_LOGIC; 
  signal Result_4_1 : STD_LOGIC; 
  signal Result_5_1 : STD_LOGIC; 
  signal Result_6_1 : STD_LOGIC; 
  signal Result_7_1 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_7_rt_90 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_8_rt_127 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_9_rt_124 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_10_rt_121 : STD_LOGIC; 
  signal Result_8_1 : STD_LOGIC; 
  signal Result_9_1 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_11_rt_112 : STD_LOGIC; 
  signal rx_empty_OBUF_176 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_1 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_2 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_3 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_4 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_0_pack_3 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_5 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_6 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_7 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_8 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_10 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_11 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_12 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_9 : STD_LOGIC; 
  signal anodes_5_OBUF_298 : STD_LOGIC; 
  signal anodes_3_OBUF_293 : STD_LOGIC; 
  signal anodes_1_OBUF_305 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_13 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_12_rt_316 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_13_rt_314 : STD_LOGIC; 
  signal Result_13_pack_2 : STD_LOGIC; 
  signal display_counter_mod4_Mcount_count_counter2 : STD_LOGIC; 
  signal display_counter_mod4_Mcount_count_counter1 : STD_LOGIC; 
  signal cathodes_2_OBUF_331 : STD_LOGIC; 
  signal display_counter_mod4_Mcount_count_counter : STD_LOGIC; 
  signal cathodes_3_OBUF_358 : STD_LOGIC; 
  signal cathodes_4_OBUF_376 : STD_LOGIC; 
  signal anodes_7_OBUF_389 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_6_rt_434 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_7_rt_427 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_4_rt_422 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_5_rt_417 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_current_state_FSM_FFd2_In : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_n0131_inv : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_current_state_FSM_FFd1_In : STD_LOGIC; 
  signal uart_inst_input_buffer_flag_reg_rstpot_455 : STD_LOGIC; 
  signal uart_inst_output_buffer_flag_reg_rstpot_464 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_1_pack_4 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_3_pack_5 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_5_pack_7 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_received_bits_7_pack_9 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mmux_tick_count_next211 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_send_bits_1_pack_4 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_send_bits_3_pack_5 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_send_bits_5_pack_7 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_send_bits_7_pack_9 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_current_state_FSM_FFd2_In_586 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mmux_tick_count_next21_pack_7 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_current_state_FSM_FFd1_In : STD_LOGIC; 
  signal uart_inst_baud_generator_count_counter_0_rstpot_652 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_n_received_bits_0_pack_4 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_Mcount_n_received_bits : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_Mcount_n_received_bits1 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_n0110_inv11 : STD_LOGIC; 
  signal uart_inst_uart_rx_inst_Mcount_n_received_bits2 : STD_LOGIC; 
  signal N17 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_n_sended_bits_1_pack_1 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mcount_n_sended_bits1 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mcount_n_sended_bits2 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_Mcount_n_sended_bits : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_tx_next : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_7_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_tx_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_tx_full_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_clock_BUFGP_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_out_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_12_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_11_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_10_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_13_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_counter_mod4_COUNTS_temp_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_counter_mod4_COUNTS_temp_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_counter_mod4_COUNTS_temp_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_7_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_buf_reg_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_buf_reg_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_current_state_FSM_FFd2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_current_state_FSM_FFd1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_input_buffer_flag_reg_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_output_buffer_flag_reg_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_current_state_FSM_FFd2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_current_state_FSM_FFd1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_hit_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_baud_generator_count_counter_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_uart_inst_uart_tx_inst_tx_current_CLK : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NLW_N0_inv1_5_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp21_CYINITGND_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_4_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_3_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_cathodes_7_OBUF_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_9_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_cy_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_cy_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_cy_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_8_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_7_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_6_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_DI_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_DI_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_S_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_S_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_10_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_15_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp24_CYINITGND_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_14_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_13_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_cathodes_7_OBUF_1_2_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_19_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_18_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_17_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_16_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_23_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_22_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_21_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_20_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_DI_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_DI_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_S_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_S_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_inv1_24_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal uart_inst_uart_tx_inst_n_sended_bits : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal uart_inst_uart_rx_inst_tick_count : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal uart_inst_input_buffer_buf_reg : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uart_inst_output_buffer_buf_reg : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uart_inst_uart_rx_inst_received_bits : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uart_inst_uart_tx_inst_send_bits : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal display_cathodes_instance_nibble : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal display_counter_mod4_COUNTS_temp : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal uart_inst_baud_generator_count_counter : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal display_clock_divisor_instance_clock_division_counter : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal uart_inst_uart_tx_inst_tick_count : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal uart_inst_uart_rx_inst_n_received_bits : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal uart_inst_baud_generator_Mcount_count_counter_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal uart_inst_uart_rx_inst_received_bits_next : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uart_inst_uart_tx_inst_send_bits_next : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uart_inst_uart_rx_inst_tick_count_next : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal uart_inst_uart_tx_inst_tick_count_next : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  uart_inst_baud_generator_count_counter_3_uart_inst_baud_generator_count_counter_3_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(0),
      O => Result_0_0
    );
  uart_inst_baud_generator_count_counter_3 : X_SFF
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_3_CLK,
      I => Result(3),
      O => uart_inst_baud_generator_count_counter(3),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_3_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => uart_inst_baud_generator_count_counter(3),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_3_rt_2
    );
  N0_inv1_5_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_5_D5LUT_O_UNCONNECTED
    );
  ProtoComp21_CYINITGND : X_ZERO
    generic map(
      LOC => "SLICE_X29Y100"
    )
    port map (
      O => NLW_ProtoComp21_CYINITGND_O_UNCONNECTED
    );
  uart_inst_baud_generator_count_counter_2 : X_SFF
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_2_CLK,
      I => Result(2),
      O => uart_inst_baud_generator_count_counter(2),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_Mcount_count_counter_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X29Y100"
    )
    port map (
      CI => '0',
      CYINIT => '0',
      CO(3) => uart_inst_baud_generator_Mcount_count_counter_cy_3_Q_854,
      CO(2) => NLW_uart_inst_baud_generator_Mcount_count_counter_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_uart_inst_baud_generator_Mcount_count_counter_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_uart_inst_baud_generator_Mcount_count_counter_cy_3_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => Result(3),
      O(2) => Result(2),
      O(1) => Result(1),
      O(0) => Result(0),
      S(3) => uart_inst_baud_generator_count_counter_3_rt_2,
      S(2) => uart_inst_baud_generator_count_counter_2_rt_13,
      S(1) => uart_inst_baud_generator_count_counter_1_rt_17,
      S(0) => uart_inst_baud_generator_Mcount_count_counter_lut(0)
    );
  uart_inst_baud_generator_count_counter_2_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR1 => uart_inst_baud_generator_count_counter(2),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_2_rt_13
    );
  N0_inv1_4_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_4_C5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_count_counter_1 : X_SFF
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_1_CLK,
      I => Result(1),
      O => uart_inst_baud_generator_count_counter(1),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_1_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => uart_inst_baud_generator_count_counter(1),
      ADR3 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_1_rt_17
    );
  N0_inv1_3_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_3_B5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_Mcount_count_counter_lut_0_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"0000FFFF0000FFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => uart_inst_baud_generator_count_counter(0),
      ADR5 => '1',
      O => uart_inst_baud_generator_Mcount_count_counter_lut(0)
    );
  cathodes_7_OBUF_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y100",
      INIT => X"FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_cathodes_7_OBUF_A5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_count_counter_7 : X_SFF
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_7_CLK,
      I => Result(7),
      O => uart_inst_baud_generator_count_counter(7),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_7_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => uart_inst_baud_generator_count_counter(7),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_7_rt_29
    );
  N0_inv1_9_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_9_D5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_count_counter_6 : X_SFF
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_6_CLK,
      I => Result(6),
      O => uart_inst_baud_generator_count_counter(6),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_Mcount_count_counter_cy_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X29Y101"
    )
    port map (
      CI => uart_inst_baud_generator_Mcount_count_counter_cy_3_Q_854,
      CYINIT => '0',
      CO(3) => uart_inst_baud_generator_Mcount_count_counter_cy_7_Q_860,
      CO(2) => NLW_uart_inst_baud_generator_Mcount_count_counter_cy_7_CO_2_UNCONNECTED,
      CO(1) => NLW_uart_inst_baud_generator_Mcount_count_counter_cy_7_CO_1_UNCONNECTED,
      CO(0) => NLW_uart_inst_baud_generator_Mcount_count_counter_cy_7_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => Result(7),
      O(2) => Result(6),
      O(1) => Result(5),
      O(0) => Result(4),
      S(3) => uart_inst_baud_generator_count_counter_7_rt_29,
      S(2) => uart_inst_baud_generator_count_counter_6_rt_40,
      S(1) => uart_inst_baud_generator_count_counter_5_rt_44,
      S(0) => uart_inst_baud_generator_count_counter_4_rt_48
    );
  uart_inst_baud_generator_count_counter_6_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR1 => uart_inst_baud_generator_count_counter(6),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_6_rt_40
    );
  N0_inv1_8_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_8_C5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_count_counter_5 : X_SFF
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_5_CLK,
      I => Result(5),
      O => uart_inst_baud_generator_count_counter(5),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_5_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR1 => uart_inst_baud_generator_count_counter(5),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_5_rt_44
    );
  N0_inv1_7_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_7_B5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_count_counter_4 : X_SFF
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_4_CLK,
      I => Result(4),
      O => uart_inst_baud_generator_count_counter(4),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_4_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => uart_inst_baud_generator_count_counter(4),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_4_rt_48
    );
  N0_inv1_6_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y101",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_6_A5LUT_O_UNCONNECTED
    );
  uart_inst_baud_generator_Mcount_count_counter_xor_9_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X29Y102"
    )
    port map (
      CI => uart_inst_baud_generator_Mcount_count_counter_cy_7_Q_860,
      CYINIT => '0',
      CO(3) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_3_UNCONNECTED,
      CO(2) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_2_UNCONNECTED,
      CO(1) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_1_UNCONNECTED,
      CO(0) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_CO_0_UNCONNECTED,
      DI(3) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_DI_3_UNCONNECTED,
      DI(2) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_DI_2_UNCONNECTED,
      DI(1) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_DI_1_UNCONNECTED,
      DI(0) => '0',
      O(3) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_O_3_UNCONNECTED,
      O(2) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_O_2_UNCONNECTED,
      O(1) => Result(9),
      O(0) => Result(8),
      S(3) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_S_3_UNCONNECTED,
      S(2) => NLW_uart_inst_baud_generator_Mcount_count_counter_xor_9_S_2_UNCONNECTED,
      S(1) => uart_inst_baud_generator_count_counter_9_rt_61,
      S(0) => uart_inst_baud_generator_count_counter_8_rt_64
    );
  uart_inst_baud_generator_count_counter_9 : X_SFF
    generic map(
      LOC => "SLICE_X29Y102",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_9_CLK,
      I => Result(9),
      O => uart_inst_baud_generator_count_counter(9),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_9_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y102",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR1 => uart_inst_baud_generator_count_counter(9),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_9_rt_61
    );
  uart_inst_baud_generator_count_counter_8 : X_SFF
    generic map(
      LOC => "SLICE_X29Y102",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_8_CLK,
      I => Result(8),
      O => uart_inst_baud_generator_count_counter(8),
      SRST => uart_inst_baud_generator_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  uart_inst_baud_generator_count_counter_8_rt : X_LUT6
    generic map(
      LOC => "SLICE_X29Y102",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => uart_inst_baud_generator_count_counter(8),
      ADR4 => '1',
      ADR5 => '1',
      O => uart_inst_baud_generator_count_counter_8_rt_64
    );
  N0_inv1_10_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X29Y102",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_10_A5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_3_1,
      O => Result_3_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_2_1,
      O => Result_2_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_1_1,
      O => Result_1_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_0_1,
      O => Result_0_1_0
    );
  display_clock_divisor_instance_clock_division_counter_3_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => display_clock_divisor_instance_clock_division_counter(3),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_3_rt_68
    );
  N0_inv1_15_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_15_D5LUT_O_UNCONNECTED
    );
  ProtoComp24_CYINITGND : X_ZERO
    generic map(
      LOC => "SLICE_X0Y69"
    )
    port map (
      O => NLW_ProtoComp24_CYINITGND_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X0Y69"
    )
    port map (
      CI => '0',
      CYINIT => '0',
      CO(3) => display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q_870,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => Result_3_1,
      O(2) => Result_2_1,
      O(1) => Result_1_1,
      O(0) => Result_0_1,
      S(3) => display_clock_divisor_instance_clock_division_counter_3_rt_68,
      S(2) => display_clock_divisor_instance_clock_division_counter_2_rt_77,
      S(1) => display_clock_divisor_instance_clock_division_counter_1_rt_80,
      S(0) => display_clock_divisor_instance_Mcount_clock_division_counter_lut(0)
    );
  display_clock_divisor_instance_clock_division_counter_2_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(2),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_2_rt_77
    );
  N0_inv1_14_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_14_C5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_1_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(1),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_1_rt_80
    );
  N0_inv1_13_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_13_B5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_lut_0_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"0000FFFF0000FFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(0),
      ADR5 => '1',
      O => display_clock_divisor_instance_Mcount_clock_division_counter_lut(0)
    );
  cathodes_7_OBUF_1_2_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y69",
      INIT => X"FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_cathodes_7_OBUF_1_2_A5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_7_1,
      O => Result_7_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_6_1,
      O => Result_6_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_5_1,
      O => Result_5_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_4_1,
      O => Result_4_1_0
    );
  display_clock_divisor_instance_clock_division_counter_7_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(7),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_7_rt_90
    );
  N0_inv1_19_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_19_D5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X0Y70"
    )
    port map (
      CI => display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q_870,
      CYINIT => '0',
      CO(3) => display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q_879,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => Result_7_1,
      O(2) => Result_6_1,
      O(1) => Result_5_1,
      O(0) => Result_4_1,
      S(3) => display_clock_divisor_instance_clock_division_counter_7_rt_90,
      S(2) => display_clock_divisor_instance_clock_division_counter_6_rt_99,
      S(1) => display_clock_divisor_instance_clock_division_counter_5_rt_102,
      S(0) => display_clock_divisor_instance_clock_division_counter_4_rt_105
    );
  display_clock_divisor_instance_clock_division_counter_6_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(6),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_6_rt_99
    );
  N0_inv1_18_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_18_C5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_5_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(5),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_5_rt_102
    );
  N0_inv1_17_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_17_B5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_4_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => display_clock_divisor_instance_clock_division_counter(4),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_4_rt_105
    );
  N0_inv1_16_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y70",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_16_A5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(11),
      O => Result_11_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(10),
      O => Result_10_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_9_1,
      O => Result_9_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_8_1,
      O => Result_8_1_0
    );
  display_clock_divisor_instance_clock_division_counter_11_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_11_rt_112
    );
  N0_inv1_23_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_23_D5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X0Y71"
    )
    port map (
      CI => display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q_879,
      CYINIT => '0',
      CO(3) => display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q_888,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => Result(11),
      O(2) => Result(10),
      O(1) => Result_9_1,
      O(0) => Result_8_1,
      S(3) => display_clock_divisor_instance_clock_division_counter_11_rt_112,
      S(2) => display_clock_divisor_instance_clock_division_counter_10_rt_121,
      S(1) => display_clock_divisor_instance_clock_division_counter_9_rt_124,
      S(0) => display_clock_divisor_instance_clock_division_counter_8_rt_127
    );
  display_clock_divisor_instance_clock_division_counter_10_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(10),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_10_rt_121
    );
  N0_inv1_22_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_22_C5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_9_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(9),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_9_rt_124
    );
  N0_inv1_21_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_21_B5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_8_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(8),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_8_rt_127
    );
  N0_inv1_20_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y71",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_20_A5LUT_O_UNCONNECTED
    );
  rx_empty_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y57"
    )
    port map (
      I => rx_empty_OBUF_0,
      O => rx_empty
    );
  cathodes_0_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y51"
    )
    port map (
      I => NlwBufferSignal_cathodes_0_OBUF_I,
      O => cathodes(0)
    );
  anodes_0_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y104"
    )
    port map (
      I => NlwBufferSignal_anodes_0_OBUF_I,
      O => anodes(0)
    );
  cathodes_1_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y50"
    )
    port map (
      I => NlwBufferSignal_cathodes_1_OBUF_I,
      O => cathodes(1)
    );
  anodes_1_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y103"
    )
    port map (
      I => NlwBufferSignal_anodes_1_OBUF_I,
      O => anodes(1)
    );
  cathodes_2_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y100"
    )
    port map (
      I => NlwBufferSignal_cathodes_2_OBUF_I,
      O => cathodes(2)
    );
  anodes_2_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y52"
    )
    port map (
      I => NlwBufferSignal_anodes_2_OBUF_I,
      O => anodes(2)
    );
  cathodes_3_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y116"
    )
    port map (
      I => NlwBufferSignal_cathodes_3_OBUF_I,
      O => cathodes(3)
    );
  anodes_3_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y112"
    )
    port map (
      I => NlwBufferSignal_anodes_3_OBUF_I,
      O => anodes(3)
    );
  cathodes_4_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y74"
    )
    port map (
      I => NlwBufferSignal_cathodes_4_OBUF_I,
      O => cathodes(4)
    );
  anodes_4_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y83"
    )
    port map (
      I => NlwBufferSignal_anodes_4_OBUF_I,
      O => anodes(4)
    );
  cathodes_5_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y62"
    )
    port map (
      I => NlwBufferSignal_cathodes_5_OBUF_I,
      O => cathodes(5)
    );
  anodes_5_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y72"
    )
    port map (
      I => NlwBufferSignal_anodes_5_OBUF_I,
      O => anodes(5)
    );
  rx_IBUF : X_BUF
    generic map(
      LOC => "IOB_X1Y136",
      PATHPULSE => 50 ps
    )
    port map (
      O => rx_IBUF_797,
      I => rx
    );
  cathodes_6_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y92"
    )
    port map (
      I => NlwBufferSignal_cathodes_6_OBUF_I,
      O => cathodes(6)
    );
  anodes_6_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y104"
    )
    port map (
      I => NlwBufferSignal_anodes_6_OBUF_I,
      O => anodes(6)
    );
  cathodes_7_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y111"
    )
    port map (
      I => '1',
      O => cathodes(7)
    );
  anodes_7_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y53"
    )
    port map (
      I => NlwBufferSignal_anodes_7_OBUF_I,
      O => anodes(7)
    );
  tx_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y127"
    )
    port map (
      I => NlwBufferSignal_tx_OBUF_I,
      O => tx
    );
  tx_full_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y59"
    )
    port map (
      I => NlwBufferSignal_tx_full_OBUF_I,
      O => tx_full
    );
  clock_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "IOB_X1Y126",
      PATHPULSE => 50 ps
    )
    port map (
      O => clock_BUFGP_IBUFG_899,
      I => clock
    );
  rx_empty_OBUF_rx_empty_OBUF_OQ_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => rx_empty_OBUF_176,
      O => rx_empty_OBUF_0
    );
  uart_inst_rx_empty1_INV_0 : X_INV
    generic map(
      LOC => "OLOGIC_X0Y57",
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_flag_reg_799,
      O => rx_empty_OBUF_176
    );
  clock_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGCTRL_X0Y31",
      PATHPULSE => 50 ps
    )
    port map (
      I => NlwBufferSignal_clock_BUFGP_BUFG_IN,
      O => clock_BUFGP
    );
  display_clock_divisor_instance_clock_division_counter_4 : X_FF
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_4_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_4,
      O => display_clock_divisor_instance_clock_division_counter(4),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_41 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_4_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_4
    );
  display_clock_divisor_instance_clock_division_counter_3 : X_FF
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_3_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_3,
      O => display_clock_divisor_instance_clock_division_counter(3),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_31 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_3_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_3
    );
  display_clock_divisor_instance_clock_division_counter_2 : X_FF
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_2_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_2,
      O => display_clock_divisor_instance_clock_division_counter(2),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_21 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => X"FFFFAFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR0 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_2_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_2
    );
  display_clock_divisor_instance_clock_division_counter_1 : X_FF
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_1_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_1,
      O => display_clock_divisor_instance_clock_division_counter(1),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_14 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y69",
      INIT => X"FFFF0000F7F70000"
    )
    port map (
      ADR3 => '1',
      ADR2 => display_clock_divisor_instance_clock_division_counter(12),
      ADR5 => display_clock_divisor_instance_clock_division_counter(11),
      ADR1 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR0 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result_1_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_1
    );
  display_clock_divisor_instance_clock_out_temp_display_clock_divisor_instance_clock_out_temp_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_division_counter_0_pack_3,
      O => display_clock_divisor_instance_clock_division_counter(0)
    );
  display_clock_divisor_instance_clock_out_temp : X_FF
    generic map(
      LOC => "SLICE_X1Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_out_temp_CLK,
      I => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o,
      O => display_clock_divisor_instance_clock_out_temp_841,
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_3 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y70",
      INIT => X"0020002000200020"
    )
    port map (
      ADR4 => '1',
      ADR3 => display_clock_divisor_instance_clock_division_counter(11),
      ADR1 => display_clock_divisor_instance_clock_division_counter(12),
      ADR0 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => '1',
      O => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_01 : X_LUT5
    generic map(
      LOC => "SLICE_X1Y70",
      INIT => X"FFDF0000"
    )
    port map (
      ADR4 => Result_0_1_0,
      ADR3 => display_clock_divisor_instance_clock_division_counter(11),
      ADR1 => display_clock_divisor_instance_clock_division_counter(12),
      ADR0 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_0
    );
  display_clock_divisor_instance_clock_division_counter_0 : X_FF
    generic map(
      LOC => "SLICE_X1Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_0_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_0,
      O => display_clock_divisor_instance_clock_division_counter_0_pack_3,
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y70",
      INIT => X"8000000000000000"
    )
    port map (
      ADR5 => display_clock_divisor_instance_clock_division_counter(3),
      ADR3 => display_clock_divisor_instance_clock_division_counter(2),
      ADR4 => display_clock_divisor_instance_clock_division_counter(9),
      ADR0 => display_clock_divisor_instance_clock_division_counter(8),
      ADR2 => display_clock_divisor_instance_clock_division_counter(13),
      ADR1 => display_clock_divisor_instance_clock_division_counter(10),
      O => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q
    );
  display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_2 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y70",
      INIT => X"0000000000100000"
    )
    port map (
      ADR3 => display_clock_divisor_instance_clock_division_counter(4),
      ADR1 => display_clock_divisor_instance_clock_division_counter(5),
      ADR0 => display_clock_divisor_instance_clock_division_counter(6),
      ADR5 => display_clock_divisor_instance_clock_division_counter(7),
      ADR2 => display_clock_divisor_instance_clock_division_counter(1),
      ADR4 => display_clock_divisor_instance_clock_division_counter(0),
      O => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901
    );
  display_clock_divisor_instance_clock_division_counter_8 : X_FF
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_8_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_8,
      O => display_clock_divisor_instance_clock_division_counter(8),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_81 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_8_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_8
    );
  display_clock_divisor_instance_clock_division_counter_7 : X_FF
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_7_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_7,
      O => display_clock_divisor_instance_clock_division_counter(7),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_71 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_7_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_7
    );
  display_clock_divisor_instance_clock_division_counter_6 : X_FF
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_6_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_6,
      O => display_clock_divisor_instance_clock_division_counter(6),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_61 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => X"FFFF0000AFFF0000"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR5 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result_6_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_6
    );
  display_clock_divisor_instance_clock_division_counter_5 : X_FF
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_5_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_5,
      O => display_clock_divisor_instance_clock_division_counter(5),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_51 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y71",
      INIT => X"FFFF0000AFFF0000"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR5 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result_5_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_5
    );
  display_clock_divisor_instance_clock_division_counter_12 : X_FF
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_12_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_12,
      O => display_clock_divisor_instance_clock_division_counter(12),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_121 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => X"FFFFAFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_12_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_12
    );
  display_clock_divisor_instance_clock_division_counter_11 : X_FF
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_11_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_11,
      O => display_clock_divisor_instance_clock_division_counter(11),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_111 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => X"FFFFAFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_11_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_11
    );
  display_clock_divisor_instance_clock_division_counter_10 : X_FF
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_10_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_10,
      O => display_clock_divisor_instance_clock_division_counter(10),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_101 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => X"FFFF0000AFFF0000"
    )
    port map (
      ADR1 => '1',
      ADR5 => display_clock_divisor_instance_clock_division_counter(12),
      ADR0 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result_10_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_10
    );
  display_clock_divisor_instance_clock_division_counter_9 : X_FF
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_9_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_9,
      O => display_clock_divisor_instance_clock_division_counter(9),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_91 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y72",
      INIT => X"FFFF0000AFFF0000"
    )
    port map (
      ADR1 => '1',
      ADR5 => display_clock_divisor_instance_clock_division_counter(12),
      ADR0 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR3 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result_9_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_9
    );
  anodes_2_OBUF_anodes_2_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_3_OBUF_293,
      O => anodes_3_OBUF_0
    );
  anodes_2_OBUF_anodes_2_OBUF_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_5_OBUF_298,
      O => anodes_5_OBUF_0
    );
  display_anodes_instance_anodes_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y83",
      INIT => X"FFF3FFF3FFF3FFF3"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR3 => display_counter_mod4_COUNTS_temp(0),
      ADR2 => display_counter_mod4_COUNTS_temp(2),
      ADR5 => '1',
      O => anodes_2_OBUF_837
    );
  display_anodes_instance_anodes_3_1 : X_LUT5
    generic map(
      LOC => "SLICE_X1Y83",
      INIT => X"F3FFF3FF"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR3 => display_counter_mod4_COUNTS_temp(0),
      ADR2 => display_counter_mod4_COUNTS_temp(2),
      O => anodes_3_OBUF_293
    );
  display_anodes_instance_anodes_4_1 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y83",
      INIT => X"EEEEFFFFEEEEFFFF"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(2),
      ADR0 => display_counter_mod4_COUNTS_temp(0),
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR5 => '1',
      O => anodes_4_OBUF_839
    );
  display_anodes_instance_anodes_5_1 : X_LUT5
    generic map(
      LOC => "SLICE_X1Y83",
      INIT => X"DDDDFFFF"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(2),
      ADR0 => display_counter_mod4_COUNTS_temp(0),
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      O => anodes_5_OBUF_298
    );
  anodes_0_OBUF_anodes_0_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_1_OBUF_305,
      O => anodes_1_OBUF_0
    );
  display_anodes_instance_anodes_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y103",
      INIT => X"FFFFFAFAFFFFFAFA"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR0 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR4 => display_counter_mod4_COUNTS_temp(2),
      ADR5 => '1',
      O => anodes_0_OBUF_832
    );
  display_anodes_instance_anodes_1_1 : X_LUT5
    generic map(
      LOC => "SLICE_X1Y103",
      INIT => X"FFFFAFAF"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR0 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR4 => display_counter_mod4_COUNTS_temp(2),
      O => anodes_1_OBUF_305
    );
  display_clock_divisor_instance_clock_division_counter_13_display_clock_divisor_instance_clock_division_counter_13_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_13_pack_2,
      O => Result(13)
    );
  display_clock_divisor_instance_clock_division_counter_13_display_clock_divisor_instance_clock_division_counter_13_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(12),
      O => Result_12_0
    );
  display_clock_divisor_instance_clock_division_counter_13 : X_FF
    generic map(
      LOC => "SLICE_X0Y72",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_13_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_13,
      O => display_clock_divisor_instance_clock_division_counter(13),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_131 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y72",
      INIT => X"FFCF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => display_clock_divisor_instance_clock_division_counter(12),
      ADR3 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_1_901,
      ADR5 => display_clock_divisor_instance_PWR_17_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result(13),
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_13
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X0Y72"
    )
    port map (
      CI => display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q_888,
      CYINIT => '0',
      CO(3) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_3_UNCONNECTED,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_CO_0_UNCONNECTED,
      DI(3) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_DI_3_UNCONNECTED,
      DI(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_DI_2_UNCONNECTED,
      DI(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_DI_1_UNCONNECTED,
      DI(0) => '0',
      O(3) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_O_3_UNCONNECTED,
      O(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_O_2_UNCONNECTED,
      O(1) => Result_13_pack_2,
      O(0) => Result(12),
      S(3) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_S_3_UNCONNECTED,
      S(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_S_2_UNCONNECTED,
      S(1) => display_clock_divisor_instance_clock_division_counter_13_rt_314,
      S(0) => display_clock_divisor_instance_clock_division_counter_12_rt_316
    );
  display_clock_divisor_instance_clock_division_counter_13_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y72",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR5 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      ADR1 => display_clock_divisor_instance_clock_division_counter(13),
      O => display_clock_divisor_instance_clock_division_counter_13_rt_314
    );
  display_clock_divisor_instance_clock_division_counter_12_rt : X_LUT6
    generic map(
      LOC => "SLICE_X0Y72",
      INIT => X"AAAAAAAAAAAAAAAA"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_12_rt_316
    );
  N0_inv1_24_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X0Y72",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_inv1_24_A5LUT_O_UNCONNECTED
    );
  display_counter_mod4_COUNTS_temp_2_display_counter_mod4_COUNTS_temp_2_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_2_OBUF_331,
      O => cathodes_2_OBUF_0
    );
  display_counter_mod4_COUNTS_temp_2 : X_SFF
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_counter_mod4_COUNTS_temp_2_CLK,
      I => display_counter_mod4_Mcount_count_counter2,
      O => display_counter_mod4_COUNTS_temp(2),
      SRST => GND,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  display_cathodes_instance_Mmux_nibble_2_11 : X_LUT6
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => X"000C000A000C000A"
    )
    port map (
      ADR3 => display_counter_mod4_COUNTS_temp(1),
      ADR4 => display_counter_mod4_COUNTS_temp(0),
      ADR0 => uart_inst_output_buffer_buf_reg(2),
      ADR2 => display_counter_mod4_COUNTS_temp(2),
      ADR1 => uart_inst_output_buffer_buf_reg_6_0,
      ADR5 => '1',
      O => display_cathodes_instance_nibble(2)
    );
  display_counter_mod4_Mcount_count_counter_xor_2_11 : X_LUT5
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => X"0FF0F0F0"
    )
    port map (
      ADR3 => display_counter_mod4_COUNTS_temp(1),
      ADR4 => display_counter_mod4_COUNTS_temp(0),
      ADR1 => '1',
      ADR2 => display_counter_mod4_COUNTS_temp(2),
      ADR0 => '1',
      O => display_counter_mod4_Mcount_count_counter2
    );
  display_cathodes_instance_Mram_cathodes_for_digit51 : X_LUT6
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => X"28280E0E28280E0E"
    )
    port map (
      ADR3 => '1',
      ADR2 => display_cathodes_instance_nibble(3),
      ADR1 => display_cathodes_instance_nibble(1),
      ADR0 => display_cathodes_instance_nibble(0),
      ADR4 => display_cathodes_instance_nibble(2),
      ADR5 => '1',
      O => cathodes_5_OBUF_845
    );
  display_cathodes_instance_Mram_cathodes_for_digit21 : X_LUT5
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => X"D0D00404"
    )
    port map (
      ADR3 => '1',
      ADR2 => display_cathodes_instance_nibble(3),
      ADR1 => display_cathodes_instance_nibble(1),
      ADR0 => display_cathodes_instance_nibble(0),
      ADR4 => display_cathodes_instance_nibble(2),
      O => cathodes_2_OBUF_331
    );
  display_counter_mod4_COUNTS_temp_1 : X_SFF
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_counter_mod4_COUNTS_temp_1_CLK,
      I => display_counter_mod4_Mcount_count_counter1,
      O => display_counter_mod4_COUNTS_temp(1),
      SRST => GND,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  display_cathodes_instance_Mmux_nibble_1_11 : X_LUT6
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => X"0022003000220030"
    )
    port map (
      ADR3 => display_counter_mod4_COUNTS_temp(2),
      ADR4 => display_counter_mod4_COUNTS_temp(0),
      ADR2 => uart_inst_output_buffer_buf_reg(1),
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR0 => uart_inst_output_buffer_buf_reg_5_0,
      ADR5 => '1',
      O => display_cathodes_instance_nibble(1)
    );
  display_counter_mod4_Mcount_count_counter_xor_1_11 : X_LUT5
    generic map(
      LOC => "SLICE_X5Y89",
      INIT => X"3333CCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(0),
      ADR2 => '1',
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR3 => '1',
      O => display_counter_mod4_Mcount_count_counter1
    );
  display_counter_mod4_COUNTS_temp_0 : X_SFF
    generic map(
      LOC => "SLICE_X5Y90",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_counter_mod4_COUNTS_temp_0_CLK,
      I => display_counter_mod4_Mcount_count_counter,
      O => display_counter_mod4_COUNTS_temp(0),
      SRST => GND,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  display_counter_mod4_Mcount_count_counter1_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X5Y90",
      INIT => X"00000000FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => display_counter_mod4_COUNTS_temp(0),
      ADR4 => '1',
      ADR3 => '1',
      O => display_counter_mod4_Mcount_count_counter
    );
  cathodes_0_OBUF_cathodes_0_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_3_OBUF_358,
      O => cathodes_3_OBUF_0
    );
  display_cathodes_instance_Mram_cathodes_for_digit11 : X_LUT6
    generic map(
      LOC => "SLICE_X4Y89",
      INIT => X"0AA0005A0AA0005A"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_cathodes_instance_nibble(0),
      ADR3 => display_cathodes_instance_nibble(1),
      ADR2 => display_cathodes_instance_nibble(2),
      ADR4 => display_cathodes_instance_nibble(3),
      ADR5 => '1',
      O => cathodes_0_OBUF_826
    );
  display_cathodes_instance_Mram_cathodes_for_digit31 : X_LUT5
    generic map(
      LOC => "SLICE_X4Y89",
      INIT => X"A500A05A"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_cathodes_instance_nibble(0),
      ADR3 => display_cathodes_instance_nibble(1),
      ADR2 => display_cathodes_instance_nibble(2),
      ADR4 => display_cathodes_instance_nibble(3),
      O => cathodes_3_OBUF_358
    );
  display_cathodes_instance_Mram_cathodes_for_digit111 : X_LUT6
    generic map(
      LOC => "SLICE_X6Y89",
      INIT => X"CCAA2288CCAA2288"
    )
    port map (
      ADR2 => '1',
      ADR5 => '1',
      ADR0 => display_cathodes_instance_nibble(2),
      ADR3 => display_cathodes_instance_nibble(0),
      ADR1 => display_cathodes_instance_nibble(1),
      ADR4 => display_cathodes_instance_nibble(3),
      O => cathodes_1_OBUF_895
    );
  display_cathodes_instance_Mmux_nibble_3_11 : X_LUT6
    generic map(
      LOC => "SLICE_X6Y89",
      INIT => X"000000000D0D0808"
    )
    port map (
      ADR3 => '1',
      ADR2 => display_counter_mod4_COUNTS_temp(1),
      ADR5 => display_counter_mod4_COUNTS_temp(2),
      ADR0 => display_counter_mod4_COUNTS_temp(0),
      ADR4 => uart_inst_output_buffer_buf_reg(3),
      ADR1 => uart_inst_output_buffer_buf_reg_7_0,
      O => display_cathodes_instance_nibble(3)
    );
  cathodes_6_OBUF_cathodes_6_OBUF_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_4_OBUF_376,
      O => cathodes_4_OBUF_0
    );
  display_cathodes_instance_Mram_cathodes_for_digit61 : X_LUT6
    generic map(
      LOC => "SLICE_X6Y90",
      INIT => X"0909212109092121"
    )
    port map (
      ADR3 => '1',
      ADR1 => display_cathodes_instance_nibble(1),
      ADR0 => display_cathodes_instance_nibble(2),
      ADR2 => display_cathodes_instance_nibble(3),
      ADR4 => display_cathodes_instance_nibble(0),
      ADR5 => '1',
      O => cathodes_6_OBUF_897
    );
  display_cathodes_instance_Mram_cathodes_for_digit41 : X_LUT5
    generic map(
      LOC => "SLICE_X6Y90",
      INIT => X"1F1F0202"
    )
    port map (
      ADR3 => '1',
      ADR1 => display_cathodes_instance_nibble(1),
      ADR0 => display_cathodes_instance_nibble(2),
      ADR2 => display_cathodes_instance_nibble(3),
      ADR4 => display_cathodes_instance_nibble(0),
      O => cathodes_4_OBUF_376
    );
  display_cathodes_instance_Mmux_nibble_0_11 : X_LUT6
    generic map(
      LOC => "SLICE_X6Y90",
      INIT => X"0000222200003030"
    )
    port map (
      ADR3 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      ADR1 => display_counter_mod4_COUNTS_temp(2),
      ADR5 => display_counter_mod4_COUNTS_temp(0),
      ADR2 => uart_inst_output_buffer_buf_reg(0),
      ADR0 => uart_inst_output_buffer_buf_reg_4_0,
      O => display_cathodes_instance_nibble(0)
    );
  anodes_6_OBUF_anodes_6_OBUF_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_7_OBUF_389,
      O => anodes_7_OBUF_0
    );
  display_anodes_instance_anodes_6_1 : X_LUT6
    generic map(
      LOC => "SLICE_X7Y86",
      INIT => X"F7F7F7F7F7F7F7F7"
    )
    port map (
      ADR4 => '1',
      ADR3 => '1',
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR0 => display_counter_mod4_COUNTS_temp(2),
      ADR5 => '1',
      O => anodes_6_OBUF_843
    );
  display_anodes_instance_anodes_7_1 : X_LUT5
    generic map(
      LOC => "SLICE_X7Y86",
      INIT => X"7F7F7F7F"
    )
    port map (
      ADR4 => '1',
      ADR3 => '1',
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR0 => display_counter_mod4_COUNTS_temp(2),
      O => anodes_7_OBUF_389
    );
  uart_inst_input_buffer_buf_reg_7 : X_FF
    generic map(
      LOC => "SLICE_X14Y89",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_7_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_7_IN,
      O => uart_inst_input_buffer_buf_reg(7),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_6 : X_FF
    generic map(
      LOC => "SLICE_X14Y89",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_6_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_6_IN,
      O => uart_inst_input_buffer_buf_reg(6),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_5 : X_FF
    generic map(
      LOC => "SLICE_X14Y89",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_5_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_5_IN,
      O => uart_inst_input_buffer_buf_reg(5),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_4 : X_FF
    generic map(
      LOC => "SLICE_X14Y89",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_4_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_4_IN,
      O => uart_inst_input_buffer_buf_reg(4),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_3 : X_FF
    generic map(
      LOC => "SLICE_X14Y90",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_3_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_3_IN,
      O => uart_inst_input_buffer_buf_reg(3),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_2 : X_FF
    generic map(
      LOC => "SLICE_X14Y90",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_2_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_2_IN,
      O => uart_inst_input_buffer_buf_reg(2),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_1 : X_FF
    generic map(
      LOC => "SLICE_X14Y90",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_1_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_1_IN,
      O => uart_inst_input_buffer_buf_reg(1),
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_buf_reg_0 : X_FF
    generic map(
      LOC => "SLICE_X14Y90",
      INIT => '0'
    )
    port map (
      CE => uart_inst_output_buffer_flag_reg_799,
      CLK => NlwBufferSignal_uart_inst_input_buffer_buf_reg_0_CLK,
      I => NlwBufferSignal_uart_inst_input_buffer_buf_reg_0_IN,
      O => uart_inst_input_buffer_buf_reg(0),
      RST => GND,
      SET => GND
    );
  uart_inst_output_buffer_buf_reg_3_uart_inst_output_buffer_buf_reg_3_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(7),
      O => uart_inst_output_buffer_buf_reg_7_0
    );
  uart_inst_output_buffer_buf_reg_3_uart_inst_output_buffer_buf_reg_3_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(6),
      O => uart_inst_output_buffer_buf_reg_6_0
    );
  uart_inst_output_buffer_buf_reg_3_uart_inst_output_buffer_buf_reg_3_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(5),
      O => uart_inst_output_buffer_buf_reg_5_0
    );
  uart_inst_output_buffer_buf_reg_3_uart_inst_output_buffer_buf_reg_3_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(4),
      O => uart_inst_output_buffer_buf_reg_4_0
    );
  uart_inst_output_buffer_buf_reg_3 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_3_CLK,
      I => NlwBufferSignal_uart_inst_output_buffer_buf_reg_3_IN,
      O => uart_inst_output_buffer_buf_reg(3),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_7_rt : X_LUT5
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => X"FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => uart_inst_uart_rx_inst_received_bits(7),
      O => uart_inst_uart_rx_inst_received_bits_7_rt_427
    );
  uart_inst_output_buffer_buf_reg_7 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_7_CLK,
      I => uart_inst_uart_rx_inst_received_bits_7_rt_427,
      O => uart_inst_output_buffer_buf_reg(7),
      RST => GND,
      SET => GND
    );
  uart_inst_output_buffer_buf_reg_2 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_2_CLK,
      I => NlwBufferSignal_uart_inst_output_buffer_buf_reg_2_IN,
      O => uart_inst_output_buffer_buf_reg(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_6_rt : X_LUT5
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => X"AAAAAAAA"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => uart_inst_uart_rx_inst_received_bits(6),
      O => uart_inst_uart_rx_inst_received_bits_6_rt_434
    );
  uart_inst_output_buffer_buf_reg_6 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_6_CLK,
      I => uart_inst_uart_rx_inst_received_bits_6_rt_434,
      O => uart_inst_output_buffer_buf_reg(6),
      RST => GND,
      SET => GND
    );
  uart_inst_output_buffer_buf_reg_1 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_1_CLK,
      I => NlwBufferSignal_uart_inst_output_buffer_buf_reg_1_IN,
      O => uart_inst_output_buffer_buf_reg(1),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_5_rt : X_LUT5
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => X"FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => uart_inst_uart_rx_inst_received_bits(5),
      O => uart_inst_uart_rx_inst_received_bits_5_rt_417
    );
  uart_inst_output_buffer_buf_reg_5 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_5_CLK,
      I => uart_inst_uart_rx_inst_received_bits_5_rt_417,
      O => uart_inst_output_buffer_buf_reg(5),
      RST => GND,
      SET => GND
    );
  uart_inst_output_buffer_buf_reg_0 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_0_CLK,
      I => NlwBufferSignal_uart_inst_output_buffer_buf_reg_0_IN,
      O => uart_inst_output_buffer_buf_reg(0),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_4_rt : X_LUT5
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => X"FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => uart_inst_uart_rx_inst_received_bits(4),
      O => uart_inst_uart_rx_inst_received_bits_4_rt_422
    );
  uart_inst_output_buffer_buf_reg_4 : X_FF
    generic map(
      LOC => "SLICE_X14Y108",
      INIT => '0'
    )
    port map (
      CE => uart_inst_rx_done_int,
      CLK => NlwBufferSignal_uart_inst_output_buffer_buf_reg_4_CLK,
      I => uart_inst_uart_rx_inst_received_bits_4_rt_422,
      O => uart_inst_output_buffer_buf_reg(4),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_current_state_FSM_FFd2 : X_FF
    generic map(
      LOC => "SLICE_X14Y111",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_current_state_FSM_FFd2_CLK,
      I => uart_inst_uart_rx_inst_current_state_FSM_FFd2_In,
      O => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_current_state_FSM_FFd2_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X14Y111",
      INIT => X"CCCCDDDDC0CCDDDD"
    )
    port map (
      ADR5 => uart_inst_uart_rx_inst_n0110_inv11_0,
      ADR2 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR1 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR3 => uart_inst_uart_rx_inst_tick_count(3),
      ADR0 => rx_IBUF_797,
      O => uart_inst_uart_rx_inst_current_state_FSM_FFd2_In
    );
  uart_inst_uart_rx_inst_current_state_FSM_FFd1_uart_inst_uart_rx_inst_current_state_FSM_FFd1_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_n0131_inv,
      O => uart_inst_uart_rx_inst_n0131_inv_0
    );
  uart_inst_uart_rx_inst_current_state_FSM_FFd1 : X_FF
    generic map(
      LOC => "SLICE_X14Y114",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_current_state_FSM_FFd1_CLK,
      I => uart_inst_uart_rx_inst_current_state_FSM_FFd1_In,
      O => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_current_state_FSM_FFd1_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X14Y114",
      INIT => X"F0F0C0FCF0F0C0FC"
    )
    port map (
      ADR0 => '1',
      ADR1 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR4 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      ADR2 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => uart_inst_uart_rx_inst_tick_count(3),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_current_state_FSM_FFd1_In
    );
  uart_inst_uart_rx_inst_n0131_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X14Y114",
      INIT => X"0000C00C"
    )
    port map (
      ADR0 => '1',
      ADR1 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR4 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      ADR2 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => uart_inst_uart_rx_inst_tick_count(3),
      O => uart_inst_uart_rx_inst_n0131_inv
    );
  uart_inst_input_buffer_flag_reg : X_FF
    generic map(
      LOC => "SLICE_X15Y77",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_input_buffer_flag_reg_CLK,
      I => uart_inst_input_buffer_flag_reg_rstpot_455,
      O => uart_inst_input_buffer_flag_reg_785,
      RST => GND,
      SET => GND
    );
  uart_inst_input_buffer_flag_reg_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X15Y77",
      INIT => X"FAF2FAFAFAFAFAFA"
    )
    port map (
      ADR4 => uart_inst_baud_generator_count_hit_temp_787,
      ADR5 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      ADR3 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR0 => uart_inst_input_buffer_flag_reg_785,
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR2 => uart_inst_output_buffer_flag_reg_799,
      O => uart_inst_input_buffer_flag_reg_rstpot_455
    );
  uart_inst_output_buffer_flag_reg : X_FF
    generic map(
      LOC => "SLICE_X15Y110",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_output_buffer_flag_reg_CLK,
      I => uart_inst_output_buffer_flag_reg_rstpot_464,
      O => uart_inst_output_buffer_flag_reg_799,
      RST => GND,
      SET => GND
    );
  uart_inst_output_buffer_flag_reg_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X15Y110",
      INIT => X"AAAA0000BAAA3000"
    )
    port map (
      ADR4 => uart_inst_input_buffer_flag_reg_785,
      ADR2 => uart_inst_uart_rx_inst_tick_count(3),
      ADR1 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR0 => uart_inst_output_buffer_flag_reg_799,
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR5 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      O => uart_inst_output_buffer_flag_reg_rstpot_464
    );
  uart_inst_uart_rx_inst_received_bits_6_uart_inst_uart_rx_inst_received_bits_6_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits_7_pack_9,
      O => uart_inst_uart_rx_inst_received_bits(7)
    );
  uart_inst_uart_rx_inst_received_bits_6_uart_inst_uart_rx_inst_received_bits_6_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits_5_pack_7,
      O => uart_inst_uart_rx_inst_received_bits(5)
    );
  uart_inst_uart_rx_inst_received_bits_6_uart_inst_uart_rx_inst_received_bits_6_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits_3_pack_5,
      O => uart_inst_uart_rx_inst_received_bits(3)
    );
  uart_inst_uart_rx_inst_received_bits_6_uart_inst_uart_rx_inst_received_bits_6_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits_1_pack_4,
      O => uart_inst_uart_rx_inst_received_bits(1)
    );
  uart_inst_uart_rx_inst_received_bits_6 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_6_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(6),
      O => uart_inst_uart_rx_inst_received_bits(6),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next71 : X_LUT6
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"AAAA0000AAAA0000"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR0 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR4 => uart_inst_uart_rx_inst_received_bits(7),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(6)
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next81 : X_LUT5
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"A0A0A0A0"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => rx_IBUF_797,
      ADR0 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR4 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(7)
    );
  uart_inst_uart_rx_inst_received_bits_7 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_7_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(7),
      O => uart_inst_uart_rx_inst_received_bits_7_pack_9,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_4 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_4_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(4),
      O => uart_inst_uart_rx_inst_received_bits(4),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next51 : X_LUT6
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"AAAA0000AAAA0000"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR0 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR4 => uart_inst_uart_rx_inst_received_bits(5),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(4)
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next61 : X_LUT5
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"A0A0A0A0"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => uart_inst_uart_rx_inst_received_bits(6),
      ADR0 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR4 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(5)
    );
  uart_inst_uart_rx_inst_received_bits_5 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_5_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(5),
      O => uart_inst_uart_rx_inst_received_bits_5_pack_7,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_2 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_2_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(2),
      O => uart_inst_uart_rx_inst_received_bits(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next31 : X_LUT6
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"AAAA0000AAAA0000"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR0 => uart_inst_uart_rx_inst_received_bits(3),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(2)
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next41 : X_LUT5
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"F0F00000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => uart_inst_uart_rx_inst_received_bits(4),
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(3)
    );
  uart_inst_uart_rx_inst_received_bits_3 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_3_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(3),
      O => uart_inst_uart_rx_inst_received_bits_3_pack_5,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_received_bits_0 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_0_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(0),
      O => uart_inst_uart_rx_inst_received_bits(0),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next11 : X_LUT6
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"F0F00000F0F00000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR2 => uart_inst_uart_rx_inst_received_bits(1),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(0)
    );
  uart_inst_uart_rx_inst_Mmux_received_bits_next21 : X_LUT5
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => X"CCCC0000"
    )
    port map (
      ADR0 => '1',
      ADR2 => '1',
      ADR1 => uart_inst_uart_rx_inst_received_bits(2),
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => '1',
      O => uart_inst_uart_rx_inst_received_bits_next(1)
    );
  uart_inst_uart_rx_inst_received_bits_1 : X_FF
    generic map(
      LOC => "SLICE_X15Y114",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0131_inv_0,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_1_CLK,
      I => uart_inst_uart_rx_inst_received_bits_next(1),
      O => uart_inst_uart_rx_inst_received_bits_1_pack_4,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next4_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y78",
      INIT => X"33FFFFFF33FFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR5 => '1',
      ADR2 => '1',
      ADR3 => uart_inst_uart_tx_inst_tick_count(2),
      ADR1 => uart_inst_uart_tx_inst_tick_count(1),
      ADR4 => uart_inst_uart_tx_inst_tick_count(0),
      O => N8
    );
  uart_inst_uart_tx_inst_n0122_inv_uart_inst_uart_tx_inst_n0122_inv_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_Mmux_tick_count_next211,
      O => uart_inst_uart_tx_inst_Mmux_tick_count_next211_0
    );
  uart_inst_uart_tx_inst_n0122_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y79",
      INIT => X"9810101098101010"
    )
    port map (
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR2 => uart_inst_input_buffer_flag_reg_785,
      ADR3 => uart_inst_baud_generator_count_hit_temp_787,
      ADR4 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_n0122_inv
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next2111 : X_LUT5
    generic map(
      LOC => "SLICE_X28Y79",
      INIT => X"EEEEEEEE"
    )
    port map (
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => uart_inst_uart_tx_inst_Mmux_tick_count_next211
    );
  uart_inst_uart_tx_inst_send_bits_6_uart_inst_uart_tx_inst_send_bits_6_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_send_bits_7_pack_9,
      O => uart_inst_uart_tx_inst_send_bits(7)
    );
  uart_inst_uart_tx_inst_send_bits_6_uart_inst_uart_tx_inst_send_bits_6_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_send_bits_5_pack_7,
      O => uart_inst_uart_tx_inst_send_bits(5)
    );
  uart_inst_uart_tx_inst_send_bits_6_uart_inst_uart_tx_inst_send_bits_6_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_send_bits_3_pack_5,
      O => uart_inst_uart_tx_inst_send_bits(3)
    );
  uart_inst_uart_tx_inst_send_bits_6_uart_inst_uart_tx_inst_send_bits_6_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_send_bits_1_pack_4,
      O => uart_inst_uart_tx_inst_send_bits(1)
    );
  uart_inst_uart_tx_inst_send_bits_6 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_6_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(6),
      O => uart_inst_uart_tx_inst_send_bits(6),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next71 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"CCF0CCF0CCF0CCF0"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR3 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR2 => uart_inst_input_buffer_buf_reg(6),
      ADR1 => uart_inst_uart_tx_inst_send_bits(7),
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(6)
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next81 : X_LUT5
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"00FF0000"
    )
    port map (
      ADR0 => '1',
      ADR4 => uart_inst_input_buffer_buf_reg(7),
      ADR3 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR2 => '1',
      ADR1 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(7)
    );
  uart_inst_uart_tx_inst_send_bits_7 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_7_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(7),
      O => uart_inst_uart_tx_inst_send_bits_7_pack_9,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_send_bits_4 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_4_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(4),
      O => uart_inst_uart_tx_inst_send_bits(4),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next51 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"BB88BB88BB88BB88"
    )
    port map (
      ADR4 => '1',
      ADR2 => '1',
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR3 => uart_inst_input_buffer_buf_reg(4),
      ADR0 => uart_inst_uart_tx_inst_send_bits(5),
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(4)
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next61 : X_LUT5
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"F3F3C0C0"
    )
    port map (
      ADR4 => uart_inst_input_buffer_buf_reg(5),
      ADR2 => uart_inst_uart_tx_inst_send_bits(6),
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR3 => '1',
      ADR0 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(5)
    );
  uart_inst_uart_tx_inst_send_bits_5 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_5_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(5),
      O => uart_inst_uart_tx_inst_send_bits_5_pack_7,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_send_bits_2 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_2_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(2),
      O => uart_inst_uart_tx_inst_send_bits(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next31 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"F3C0F3C0F3C0F3C0"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR3 => uart_inst_input_buffer_buf_reg(2),
      ADR2 => uart_inst_uart_tx_inst_send_bits(3),
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(2)
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next41 : X_LUT5
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"EEEE2222"
    )
    port map (
      ADR0 => uart_inst_input_buffer_buf_reg(3),
      ADR4 => uart_inst_uart_tx_inst_send_bits(4),
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR3 => '1',
      ADR2 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(3)
    );
  uart_inst_uart_tx_inst_send_bits_3 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_3_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(3),
      O => uart_inst_uart_tx_inst_send_bits_3_pack_5,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_send_bits_0 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_0_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(0),
      O => uart_inst_uart_tx_inst_send_bits(0),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next11 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"F3F3C0C0F3F3C0C0"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR4 => uart_inst_input_buffer_buf_reg(0),
      ADR2 => uart_inst_uart_tx_inst_send_bits(1),
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(0)
    );
  uart_inst_uart_tx_inst_Mmux_send_bits_next21 : X_LUT5
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => X"BB88BB88"
    )
    port map (
      ADR3 => uart_inst_input_buffer_buf_reg(1),
      ADR0 => uart_inst_uart_tx_inst_send_bits(2),
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR2 => '1',
      ADR4 => '1',
      O => uart_inst_uart_tx_inst_send_bits_next(1)
    );
  uart_inst_uart_tx_inst_send_bits_1 : X_FF
    generic map(
      LOC => "SLICE_X28Y81",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0122_inv,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_1_CLK,
      I => uart_inst_uart_tx_inst_send_bits_next(1),
      O => uart_inst_uart_tx_inst_send_bits_1_pack_4,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_n0110_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y110",
      INIT => X"0C00000003000300"
    )
    port map (
      ADR0 => '1',
      ADR5 => uart_inst_uart_rx_inst_tick_count(3),
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR1 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR4 => uart_inst_uart_rx_inst_n0110_inv11_0,
      ADR2 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      O => uart_inst_uart_rx_inst_n0110_inv
    );
  uart_inst_uart_rx_inst_tick_count_3 : X_FF
    generic map(
      LOC => "SLICE_X28Y112",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_3_CLK,
      I => uart_inst_uart_rx_inst_tick_count_next(3),
      O => uart_inst_uart_rx_inst_tick_count(3),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_rx_done11 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y112",
      INIT => X"000000C0000000C0"
    )
    port map (
      ADR0 => '1',
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR2 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR1 => uart_inst_uart_rx_inst_tick_count(3),
      ADR4 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      ADR5 => '1',
      O => uart_inst_rx_done_int
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next41 : X_LUT5
    generic map(
      LOC => "SLICE_X28Y112",
      INIT => X"CCC830F8"
    )
    port map (
      ADR0 => rx_IBUF_797,
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR2 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR1 => uart_inst_uart_rx_inst_tick_count(3),
      ADR4 => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810,
      O => uart_inst_uart_rx_inst_tick_count_next(3)
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next411 : X_LUT6
    generic map(
      LOC => "SLICE_X28Y112",
      INIT => X"0FFFFFFFFFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => uart_inst_uart_rx_inst_tick_count(2),
      ADR3 => uart_inst_uart_rx_inst_tick_count(1),
      ADR4 => uart_inst_uart_rx_inst_tick_count(0),
      ADR5 => uart_inst_baud_generator_count_hit_temp_787,
      O => uart_inst_uart_rx_inst_Mmux_tick_count_next41_810
    );
  uart_inst_uart_tx_inst_current_state_FSM_FFd2_In_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y75",
      INIT => X"FF00000000000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => uart_inst_baud_generator_count_hit_temp_787,
      ADR4 => uart_inst_uart_tx_inst_n_sended_bits(1),
      ADR3 => uart_inst_uart_tx_inst_n_sended_bits(0),
      O => N12
    );
  uart_inst_uart_tx_inst_current_state_FSM_FFd2 : X_FF
    generic map(
      LOC => "SLICE_X29Y75",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_current_state_FSM_FFd2_CLK,
      I => uart_inst_uart_tx_inst_current_state_FSM_FFd2_In_586,
      O => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_current_state_FSM_FFd2_In : X_LUT6
    generic map(
      LOC => "SLICE_X29Y75",
      INIT => X"44FCCCFCCCFCCCFC"
    )
    port map (
      ADR3 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR0 => uart_inst_uart_tx_inst_n_sended_bits(2),
      ADR4 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR5 => N12,
      ADR2 => uart_inst_input_buffer_flag_reg_785,
      O => uart_inst_uart_tx_inst_current_state_FSM_FFd2_In_586
    );
  uart_inst_uart_tx_inst_tick_count_1 : X_FF
    generic map(
      LOC => "SLICE_X29Y77",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_1_CLK,
      I => uart_inst_uart_tx_inst_tick_count_next(1),
      O => uart_inst_uart_tx_inst_tick_count(1),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next21 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y77",
      INIT => X"ECECECCC60606000"
    )
    port map (
      ADR2 => uart_inst_baud_generator_count_hit_temp_787,
      ADR0 => uart_inst_uart_tx_inst_tick_count(0),
      ADR4 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR1 => uart_inst_uart_tx_inst_tick_count(1),
      ADR3 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR5 => uart_inst_uart_tx_inst_Mmux_tick_count_next21_905,
      O => uart_inst_uart_tx_inst_tick_count_next(1)
    );
  uart_inst_uart_tx_inst_tick_count_0 : X_FF
    generic map(
      LOC => "SLICE_X29Y77",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_0_CLK,
      I => uart_inst_uart_tx_inst_tick_count_next(0),
      O => uart_inst_uart_tx_inst_tick_count(0),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next11 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y77",
      INIT => X"55CE5546AA8AAA8A"
    )
    port map (
      ADR5 => uart_inst_baud_generator_count_hit_temp_787,
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR3 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR0 => uart_inst_uart_tx_inst_tick_count(0),
      ADR2 => uart_inst_input_buffer_flag_reg_785,
      ADR4 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      O => uart_inst_uart_tx_inst_tick_count_next(0)
    );
  uart_inst_uart_tx_inst_current_state_FSM_FFd1_uart_inst_uart_tx_inst_current_state_FSM_FFd1_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_Mmux_tick_count_next21_pack_7,
      O => uart_inst_uart_tx_inst_Mmux_tick_count_next21_905
    );
  uart_inst_uart_tx_inst_current_state_FSM_FFd1 : X_FF
    generic map(
      LOC => "SLICE_X29Y78",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_current_state_FSM_FFd1_CLK,
      I => uart_inst_uart_tx_inst_current_state_FSM_FFd1_In,
      O => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_current_state_FSM_FFd1_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y78",
      INIT => X"AACCCCCCAACCCCCC"
    )
    port map (
      ADR2 => '1',
      ADR4 => uart_inst_baud_generator_count_hit_temp_787,
      ADR3 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_current_state_FSM_FFd1_In
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next212 : X_LUT5
    generic map(
      LOC => "SLICE_X29Y78",
      INIT => X"4501EFEF"
    )
    port map (
      ADR2 => uart_inst_input_buffer_flag_reg_785,
      ADR4 => uart_inst_baud_generator_count_hit_temp_787,
      ADR3 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      ADR1 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      O => uart_inst_uart_tx_inst_Mmux_tick_count_next21_pack_7
    );
  uart_inst_uart_tx_inst_tick_count_2 : X_FF
    generic map(
      LOC => "SLICE_X29Y78",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_2_CLK,
      I => uart_inst_uart_tx_inst_tick_count_next(2),
      O => uart_inst_uart_tx_inst_tick_count(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next31 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y78",
      INIT => X"F8F048C0F0F00000"
    )
    port map (
      ADR3 => uart_inst_uart_tx_inst_tick_count(1),
      ADR0 => uart_inst_uart_tx_inst_tick_count(0),
      ADR1 => uart_inst_baud_generator_count_hit_temp_787,
      ADR2 => uart_inst_uart_tx_inst_tick_count(2),
      ADR5 => uart_inst_uart_tx_inst_Mmux_tick_count_next211_0,
      ADR4 => uart_inst_uart_tx_inst_Mmux_tick_count_next21_905,
      O => uart_inst_uart_tx_inst_tick_count_next(2)
    );
  uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o_3_1 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y78",
      INIT => X"F000000000000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => uart_inst_uart_tx_inst_tick_count(3),
      ADR5 => uart_inst_uart_tx_inst_tick_count(2),
      ADR3 => uart_inst_uart_tx_inst_tick_count(1),
      ADR4 => uart_inst_uart_tx_inst_tick_count(0),
      O => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o
    );
  uart_inst_uart_tx_inst_tick_count_3 : X_FF
    generic map(
      LOC => "SLICE_X29Y79",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_3_CLK,
      I => uart_inst_uart_tx_inst_tick_count_next(3),
      O => uart_inst_uart_tx_inst_tick_count(3),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mmux_tick_count_next4 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y79",
      INIT => X"AAAAAEAA08000400"
    )
    port map (
      ADR2 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      ADR1 => uart_inst_uart_tx_inst_Mmux_tick_count_next211_0,
      ADR3 => uart_inst_baud_generator_count_hit_temp_787,
      ADR0 => uart_inst_uart_tx_inst_tick_count(3),
      ADR4 => N8,
      ADR5 => uart_inst_uart_tx_inst_Mmux_tick_count_next21_905,
      O => uart_inst_uart_tx_inst_tick_count_next(3)
    );
  uart_inst_baud_generator_count_hit_temp : X_FF
    generic map(
      LOC => "SLICE_X29Y104",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_hit_temp_CLK,
      I => uart_inst_baud_generator_Mcount_count_counter_val,
      O => uart_inst_baud_generator_count_hit_temp_787,
      RST => GND,
      SET => GND
    );
  uart_inst_baud_generator_count_hit_temp_PWR_7_o_MUX_11_o_9_Q : X_LUT6
    generic map(
      LOC => "SLICE_X29Y104",
      INIT => X"0000000020000000"
    )
    port map (
      ADR1 => uart_inst_baud_generator_count_counter(0),
      ADR4 => uart_inst_baud_generator_count_counter(9),
      ADR2 => uart_inst_baud_generator_count_counter(7),
      ADR0 => uart_inst_baud_generator_count_counter(3),
      ADR3 => uart_inst_baud_generator_count_counter(1),
      ADR5 => N4,
      O => uart_inst_baud_generator_Mcount_count_counter_val
    );
  uart_inst_baud_generator_count_counter_0 : X_FF
    generic map(
      LOC => "SLICE_X29Y104",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_baud_generator_count_counter_0_CLK,
      I => uart_inst_baud_generator_count_counter_0_rstpot_652,
      O => uart_inst_baud_generator_count_counter(0),
      RST => GND,
      SET => GND
    );
  uart_inst_baud_generator_count_counter_0_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X29Y104",
      INIT => X"00FF00FF00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR5 => Result_0_0,
      ADR3 => uart_inst_baud_generator_Mcount_count_counter_val,
      O => uart_inst_baud_generator_count_counter_0_rstpot_652
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next34 : X_MUX2
    generic map(
      LOC => "SLICE_X29Y111"
    )
    port map (
      IA => N14,
      IB => N15,
      O => uart_inst_uart_rx_inst_tick_count_next(2),
      SEL => uart_inst_uart_rx_inst_tick_count(2)
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next34_F : X_LUT6
    generic map(
      LOC => "SLICE_X29Y111",
      INIT => X"AAA0000000000000"
    )
    port map (
      ADR1 => '1',
      ADR4 => uart_inst_baud_generator_count_hit_temp_787,
      ADR0 => uart_inst_uart_rx_inst_tick_count(0),
      ADR5 => uart_inst_uart_rx_inst_tick_count(1),
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR2 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      O => N14
    );
  uart_inst_uart_rx_inst_tick_count_2 : X_FF
    generic map(
      LOC => "SLICE_X29Y111",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_2_CLK,
      I => uart_inst_uart_rx_inst_tick_count_next(2),
      O => uart_inst_uart_rx_inst_tick_count(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next34_G : X_LUT6
    generic map(
      LOC => "SLICE_X29Y111",
      INIT => X"FFFFFFAA00F000AA"
    )
    port map (
      ADR1 => '1',
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR5 => uart_inst_uart_rx_inst_Mmux_tick_count_next3,
      ADR2 => uart_inst_uart_rx_inst_tick_count(3),
      ADR0 => rx_IBUF_797,
      O => N15
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next31 : X_LUT6
    generic map(
      LOC => "SLICE_X29Y111",
      INIT => X"00FFFFFFFFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => uart_inst_uart_rx_inst_tick_count(1),
      ADR5 => uart_inst_baud_generator_count_hit_temp_787,
      ADR4 => uart_inst_uart_rx_inst_tick_count(0),
      O => uart_inst_uart_rx_inst_Mmux_tick_count_next3
    );
  uart_inst_baud_generator_count_hit_temp_PWR_7_o_MUX_11_o_9_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X31Y101",
      INIT => X"FFFFFFFFFFFFFFFC"
    )
    port map (
      ADR0 => '1',
      ADR1 => uart_inst_baud_generator_count_counter(5),
      ADR2 => uart_inst_baud_generator_count_counter(4),
      ADR5 => uart_inst_baud_generator_count_counter(6),
      ADR3 => uart_inst_baud_generator_count_counter(2),
      ADR4 => uart_inst_baud_generator_count_counter(8),
      O => N4
    );
  uart_inst_uart_rx_inst_n_received_bits_2_uart_inst_uart_rx_inst_n_received_bits_2_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_n0110_inv11,
      O => uart_inst_uart_rx_inst_n0110_inv11_0
    );
  uart_inst_uart_rx_inst_n_received_bits_2_uart_inst_uart_rx_inst_n_received_bits_2_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_n_received_bits_0_pack_4,
      O => uart_inst_uart_rx_inst_n_received_bits(0)
    );
  uart_inst_uart_rx_inst_n_received_bits_2 : X_FF
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0110_inv,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_2_CLK,
      I => uart_inst_uart_rx_inst_Mcount_n_received_bits2,
      O => uart_inst_uart_rx_inst_n_received_bits(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mcount_n_received_bits_xor_2_11 : X_LUT6
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => X"3CCC00003CCC0000"
    )
    port map (
      ADR0 => '1',
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => uart_inst_uart_rx_inst_n_received_bits(0),
      ADR1 => uart_inst_uart_rx_inst_n_received_bits(2),
      ADR2 => uart_inst_uart_rx_inst_n_received_bits(1),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_Mcount_n_received_bits2
    );
  uart_inst_uart_rx_inst_n0110_inv111 : X_LUT5
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => X"3FFF3FFF"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR3 => uart_inst_uart_rx_inst_n_received_bits(0),
      ADR1 => uart_inst_uart_rx_inst_n_received_bits(2),
      ADR2 => uart_inst_uart_rx_inst_n_received_bits(1),
      O => uart_inst_uart_rx_inst_n0110_inv11
    );
  uart_inst_uart_rx_inst_n_received_bits_1 : X_FF
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0110_inv,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_1_CLK,
      I => uart_inst_uart_rx_inst_Mcount_n_received_bits1,
      O => uart_inst_uart_rx_inst_n_received_bits(1),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mcount_n_received_bits_xor_1_11 : X_LUT6
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => X"3C3C00003C3C0000"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR2 => uart_inst_uart_rx_inst_n_received_bits(1),
      ADR1 => uart_inst_uart_rx_inst_n_received_bits(0),
      ADR5 => '1',
      O => uart_inst_uart_rx_inst_Mcount_n_received_bits1
    );
  uart_inst_uart_rx_inst_Mcount_n_received_bits_xor_0_11 : X_LUT5
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => X"33330000"
    )
    port map (
      ADR0 => '1',
      ADR2 => '1',
      ADR4 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => '1',
      ADR1 => uart_inst_uart_rx_inst_n_received_bits(0),
      O => uart_inst_uart_rx_inst_Mcount_n_received_bits
    );
  uart_inst_uart_rx_inst_n_received_bits_0 : X_FF
    generic map(
      LOC => "SLICE_X31Y110",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_rx_inst_n0110_inv,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_0_CLK,
      I => uart_inst_uart_rx_inst_Mcount_n_received_bits,
      O => uart_inst_uart_rx_inst_n_received_bits_0_pack_4,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next23 : X_MUX2
    generic map(
      LOC => "SLICE_X31Y112"
    )
    port map (
      IA => N16,
      IB => N17,
      O => uart_inst_uart_rx_inst_tick_count_next(1),
      SEL => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next23_F : X_LUT6
    generic map(
      LOC => "SLICE_X31Y112",
      INIT => X"3C3CCCCC88888888"
    )
    port map (
      ADR3 => '1',
      ADR5 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR1 => uart_inst_uart_rx_inst_tick_count(1),
      ADR4 => uart_inst_uart_rx_inst_tick_count(0),
      ADR2 => uart_inst_baud_generator_count_hit_temp_787,
      ADR0 => rx_IBUF_797,
      O => N16
    );
  uart_inst_uart_rx_inst_tick_count_1 : X_FF
    generic map(
      LOC => "SLICE_X31Y112",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_1_CLK,
      I => uart_inst_uart_rx_inst_tick_count_next(1),
      O => uart_inst_uart_rx_inst_tick_count(1),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next23_G : X_LUT6
    generic map(
      LOC => "SLICE_X31Y112",
      INIT => X"7333CCCCCCCCCCCC"
    )
    port map (
      ADR5 => uart_inst_baud_generator_count_hit_temp_787,
      ADR4 => uart_inst_uart_rx_inst_tick_count(0),
      ADR0 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR1 => uart_inst_uart_rx_inst_tick_count(1),
      ADR3 => uart_inst_uart_rx_inst_tick_count(3),
      ADR2 => uart_inst_uart_rx_inst_tick_count(2),
      O => N17
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next1_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X31Y112",
      INIT => X"A000A000A000A000"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR5 => '1',
      ADR0 => uart_inst_uart_rx_inst_tick_count(3),
      ADR2 => uart_inst_uart_rx_inst_tick_count(2),
      ADR3 => uart_inst_uart_rx_inst_tick_count(1),
      O => N6
    );
  uart_inst_uart_rx_inst_tick_count_0 : X_FF
    generic map(
      LOC => "SLICE_X31Y112",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_0_CLK,
      I => uart_inst_uart_rx_inst_tick_count_next(0),
      O => uart_inst_uart_rx_inst_tick_count(0),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_rx_inst_Mmux_tick_count_next1 : X_LUT6
    generic map(
      LOC => "SLICE_X31Y112",
      INIT => X"3CBC3CBC3CF03C00"
    )
    port map (
      ADR1 => uart_inst_baud_generator_count_hit_temp_787,
      ADR5 => uart_inst_uart_rx_inst_current_state_FSM_FFd1_794,
      ADR3 => uart_inst_uart_rx_inst_current_state_FSM_FFd2_795,
      ADR2 => uart_inst_uart_rx_inst_tick_count(0),
      ADR0 => N6,
      ADR4 => rx_IBUF_797,
      O => uart_inst_uart_rx_inst_tick_count_next(0)
    );
  uart_inst_uart_tx_inst_n_sended_bits_2_uart_inst_uart_tx_inst_n_sended_bits_2_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_n_sended_bits_1_pack_1,
      O => uart_inst_uart_tx_inst_n_sended_bits(1)
    );
  uart_inst_uart_tx_inst_n_sended_bits_2 : X_FF
    generic map(
      LOC => "SLICE_X32Y74",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0104_inv_790,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_2_CLK,
      I => uart_inst_uart_tx_inst_Mcount_n_sended_bits2,
      O => uart_inst_uart_tx_inst_n_sended_bits(2),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mcount_n_sended_bits_xor_2_11 : X_LUT6
    generic map(
      LOC => "SLICE_X32Y74",
      INIT => X"2828888828288888"
    )
    port map (
      ADR3 => '1',
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR4 => uart_inst_uart_tx_inst_n_sended_bits(0),
      ADR1 => uart_inst_uart_tx_inst_n_sended_bits(2),
      ADR2 => uart_inst_uart_tx_inst_n_sended_bits(1),
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_Mcount_n_sended_bits2
    );
  uart_inst_uart_tx_inst_Mcount_n_sended_bits_xor_1_11 : X_LUT5
    generic map(
      LOC => "SLICE_X32Y74",
      INIT => X"0A0AA0A0"
    )
    port map (
      ADR1 => '1',
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR4 => uart_inst_uart_tx_inst_n_sended_bits(0),
      ADR3 => '1',
      ADR2 => uart_inst_uart_tx_inst_n_sended_bits(1),
      O => uart_inst_uart_tx_inst_Mcount_n_sended_bits1
    );
  uart_inst_uart_tx_inst_n_sended_bits_1 : X_FF
    generic map(
      LOC => "SLICE_X32Y74",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0104_inv_790,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_1_CLK,
      I => uart_inst_uart_tx_inst_Mcount_n_sended_bits1,
      O => uart_inst_uart_tx_inst_n_sended_bits_1_pack_1,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_n_sended_bits_0_uart_inst_uart_tx_inst_n_sended_bits_0_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N10,
      O => N10_0
    );
  uart_inst_uart_tx_inst_n_sended_bits_0 : X_FF
    generic map(
      LOC => "SLICE_X32Y76",
      INIT => '0'
    )
    port map (
      CE => uart_inst_uart_tx_inst_n0104_inv_790,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_0_CLK,
      I => uart_inst_uart_tx_inst_Mcount_n_sended_bits,
      O => uart_inst_uart_tx_inst_n_sended_bits(0),
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_Mcount_n_sended_bits_xor_0_11 : X_LUT6
    generic map(
      LOC => "SLICE_X32Y76",
      INIT => X"0F0F00000F0F0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => uart_inst_uart_tx_inst_n_sended_bits(0),
      ADR4 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      ADR5 => '1',
      O => uart_inst_uart_tx_inst_Mcount_n_sended_bits
    );
  uart_inst_uart_tx_inst_n0104_inv_SW0 : X_LUT5
    generic map(
      LOC => "SLICE_X32Y76",
      INIT => X"F0F00000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => uart_inst_uart_tx_inst_n_sended_bits(0),
      ADR4 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      O => N10
    );
  uart_inst_uart_tx_inst_n0104_inv : X_LUT6
    generic map(
      LOC => "SLICE_X33Y75",
      INIT => X"70000000F0000000"
    )
    port map (
      ADR0 => uart_inst_uart_tx_inst_n_sended_bits(2),
      ADR1 => uart_inst_uart_tx_inst_n_sended_bits(1),
      ADR2 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR3 => uart_inst_baud_generator_count_hit_temp_787,
      ADR5 => N10_0,
      ADR4 => uart_inst_uart_tx_inst_tick_count_3_PWR_13_o_equal_30_o,
      O => uart_inst_uart_tx_inst_n0104_inv_790
    );
  uart_inst_uart_tx_inst_tx_current : X_FF
    generic map(
      LOC => "SLICE_X35Y81",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_uart_inst_uart_tx_inst_tx_current_CLK,
      I => uart_inst_uart_tx_inst_tx_next,
      O => uart_inst_uart_tx_inst_tx_current_898,
      RST => GND,
      SET => GND
    );
  uart_inst_uart_tx_inst_tx_next1 : X_LUT6
    generic map(
      LOC => "SLICE_X35Y81",
      INIT => X"DDDDDDDD55555555"
    )
    port map (
      ADR3 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR0 => uart_inst_uart_tx_inst_current_state_FSM_FFd2_784,
      ADR1 => uart_inst_uart_tx_inst_send_bits(0),
      ADR5 => uart_inst_uart_tx_inst_current_state_FSM_FFd1_781,
      O => uart_inst_uart_tx_inst_tx_next
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_3_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_2_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_1_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_7_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_6_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_5_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_4_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_9_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_9_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_8_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_8_CLK
    );
  NlwBufferBlock_cathodes_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_0_OBUF_826,
      O => NlwBufferSignal_cathodes_0_OBUF_I
    );
  NlwBufferBlock_anodes_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_0_OBUF_832,
      O => NlwBufferSignal_anodes_0_OBUF_I
    );
  NlwBufferBlock_cathodes_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_1_OBUF_895,
      O => NlwBufferSignal_cathodes_1_OBUF_I
    );
  NlwBufferBlock_anodes_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_1_OBUF_0,
      O => NlwBufferSignal_anodes_1_OBUF_I
    );
  NlwBufferBlock_cathodes_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_2_OBUF_0,
      O => NlwBufferSignal_cathodes_2_OBUF_I
    );
  NlwBufferBlock_anodes_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_2_OBUF_837,
      O => NlwBufferSignal_anodes_2_OBUF_I
    );
  NlwBufferBlock_cathodes_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_3_OBUF_0,
      O => NlwBufferSignal_cathodes_3_OBUF_I
    );
  NlwBufferBlock_anodes_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_3_OBUF_0,
      O => NlwBufferSignal_anodes_3_OBUF_I
    );
  NlwBufferBlock_cathodes_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_4_OBUF_0,
      O => NlwBufferSignal_cathodes_4_OBUF_I
    );
  NlwBufferBlock_anodes_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_4_OBUF_839,
      O => NlwBufferSignal_anodes_4_OBUF_I
    );
  NlwBufferBlock_cathodes_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_5_OBUF_845,
      O => NlwBufferSignal_cathodes_5_OBUF_I
    );
  NlwBufferBlock_anodes_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_5_OBUF_0,
      O => NlwBufferSignal_anodes_5_OBUF_I
    );
  NlwBufferBlock_cathodes_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_6_OBUF_897,
      O => NlwBufferSignal_cathodes_6_OBUF_I
    );
  NlwBufferBlock_anodes_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_6_OBUF_843,
      O => NlwBufferSignal_anodes_6_OBUF_I
    );
  NlwBufferBlock_anodes_7_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_7_OBUF_0,
      O => NlwBufferSignal_anodes_7_OBUF_I
    );
  NlwBufferBlock_tx_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_tx_inst_tx_current_898,
      O => NlwBufferSignal_tx_OBUF_I
    );
  NlwBufferBlock_tx_full_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_input_buffer_flag_reg_785,
      O => NlwBufferSignal_tx_full_OBUF_I
    );
  NlwBufferBlock_clock_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP_IBUFG_899,
      O => NlwBufferSignal_clock_BUFGP_BUFG_IN
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_4_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_3_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_2_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_1_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_out_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_out_temp_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_0_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_8_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_8_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_7_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_6_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_5_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_12_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_12_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_11_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_11_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_10_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_10_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_9_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_9_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_13_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_13_CLK
    );
  NlwBufferBlock_display_counter_mod4_COUNTS_temp_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_out_temp_841,
      O => NlwBufferSignal_display_counter_mod4_COUNTS_temp_2_CLK
    );
  NlwBufferBlock_display_counter_mod4_COUNTS_temp_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_out_temp_841,
      O => NlwBufferSignal_display_counter_mod4_COUNTS_temp_1_CLK
    );
  NlwBufferBlock_display_counter_mod4_COUNTS_temp_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_out_temp_841,
      O => NlwBufferSignal_display_counter_mod4_COUNTS_temp_0_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_7_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_7_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg_7_0,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_7_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_6_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_6_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg_6_0,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_6_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_5_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_5_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg_5_0,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_5_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_4_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_4_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg_4_0,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_4_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_3_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(3),
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_3_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_2_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(2),
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_2_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_1_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(1),
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_1_IN
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_0_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_buf_reg_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_output_buffer_buf_reg(0),
      O => NlwBufferSignal_uart_inst_input_buffer_buf_reg_0_IN
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_3_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits(3),
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_3_IN
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_7_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_2_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits(2),
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_2_IN
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_6_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_1_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits(1),
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_1_IN
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_5_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_0_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => uart_inst_uart_rx_inst_received_bits(0),
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_0_IN
    );
  NlwBufferBlock_uart_inst_output_buffer_buf_reg_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_buf_reg_4_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_current_state_FSM_FFd2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_current_state_FSM_FFd2_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_current_state_FSM_FFd1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_current_state_FSM_FFd1_CLK
    );
  NlwBufferBlock_uart_inst_input_buffer_flag_reg_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_input_buffer_flag_reg_CLK
    );
  NlwBufferBlock_uart_inst_output_buffer_flag_reg_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_output_buffer_flag_reg_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_6_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_7_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_4_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_5_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_2_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_3_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_received_bits_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_received_bits_1_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_6_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_7_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_4_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_5_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_2_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_3_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_send_bits_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_send_bits_1_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_tick_count_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_3_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_current_state_FSM_FFd2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_current_state_FSM_FFd2_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_tick_count_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_1_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_tick_count_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_current_state_FSM_FFd1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_current_state_FSM_FFd1_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_tick_count_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_2_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_tick_count_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_tick_count_3_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_hit_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_hit_temp_CLK
    );
  NlwBufferBlock_uart_inst_baud_generator_count_counter_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_baud_generator_count_counter_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_tick_count_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_2_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_n_received_bits_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_2_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_n_received_bits_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_1_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_n_received_bits_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_n_received_bits_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_tick_count_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_1_CLK
    );
  NlwBufferBlock_uart_inst_uart_rx_inst_tick_count_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_rx_inst_tick_count_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_n_sended_bits_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_2_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_n_sended_bits_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_1_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_n_sended_bits_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_n_sended_bits_0_CLK
    );
  NlwBufferBlock_uart_inst_uart_tx_inst_tx_current_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_uart_inst_uart_tx_inst_tx_current_CLK
    );
  NlwBlock_uart_onBoard_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_uart_onBoard_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

