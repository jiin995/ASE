--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: booth_multiplier_onBoard_timesim.vhd
-- /___/   /\     Timestamp: Tue Feb 26 18:36:36 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf booth_multiplier_onBoard.pcf -rpw 100 -tpw 0 -ar Structure -tm booth_multiplier_onBoard -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim booth_multiplier_onBoard.ncd booth_multiplier_onBoard_timesim.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
-- Input file	: booth_multiplier_onBoard.ncd
-- Output file	: /home/simone/Scrivania/ASE/Esercitazioni/Esercitazione_11/ISE/BoothMultiplier/netgen/par/booth_multiplier_onBoard_timesim.vhd
-- # of Entities	: 1
-- Design Name	: booth_multiplier_onBoard
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

entity booth_multiplier_onBoard is
  port (
    clock : in STD_LOGIC := 'X'; 
    start : in STD_LOGIC := 'X'; 
    enable_a : in STD_LOGIC := 'X'; 
    enable_b : in STD_LOGIC := 'X'; 
    subtract : in STD_LOGIC := 'X'; 
    start_led : out STD_LOGIC; 
    stop : out STD_LOGIC; 
    overflow : out STD_LOGIC; 
    c_out : out STD_LOGIC; 
    input : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    anodes : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    cathodes : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end booth_multiplier_onBoard;

architecture Structure of booth_multiplier_onBoard is
  signal stop_OBUF_0 : STD_LOGIC; 
  signal stop_OBUF_BUFG_1048 : STD_LOGIC; 
  signal clock_BUFGP_IBUFG_1049 : STD_LOGIC; 
  signal clock_BUFGP : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056 : STD_LOGIC; 
  signal N31_0 : STD_LOGIC; 
  signal N32_0 : STD_LOGIC; 
  signal N33_0 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061 : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q : STD_LOGIC; 
  signal N28_0 : STD_LOGIC; 
  signal booth_multiplier_onBoard_subtract : STD_LOGIC; 
  signal N29_0 : STD_LOGIC; 
  signal value_int_5_LDC_1069 : STD_LOGIC; 
  signal value_int_5_C_5_0 : STD_LOGIC; 
  signal value_int_5_P_5_0 : STD_LOGIC; 
  signal value_int_13_1072 : STD_LOGIC; 
  signal display_cathodes_instance_nibble_1_0 : STD_LOGIC; 
  signal value_int_1_LDC_1075 : STD_LOGIC; 
  signal value_int_1_C_1_1076 : STD_LOGIC; 
  signal value_int_1_P_1_1077 : STD_LOGIC; 
  signal value_int_9_1078 : STD_LOGIC; 
  signal value_int_6_LDC_1079 : STD_LOGIC; 
  signal value_int_6_C_6_0 : STD_LOGIC; 
  signal value_int_6_P_6_1081 : STD_LOGIC; 
  signal value_int_14_1082 : STD_LOGIC; 
  signal display_cathodes_instance_nibble_2_0 : STD_LOGIC; 
  signal value_int_2_LDC_1084 : STD_LOGIC; 
  signal value_int_2_C_2_1085 : STD_LOGIC; 
  signal value_int_2_P_2_0 : STD_LOGIC; 
  signal value_int_10_1087 : STD_LOGIC; 
  signal booth_multiplier_onBoard_count_up : STD_LOGIC; 
  signal booth_multiplier_onBoard_counter_inst_Mcount_count_counter_val : STD_LOGIC; 
  signal display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093 : STD_LOGIC; 
  signal display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q : STD_LOGIC; 
  signal Result_1_0 : STD_LOGIC; 
  signal Result_2_0 : STD_LOGIC; 
  signal Result_3_0 : STD_LOGIC; 
  signal Result_4_0 : STD_LOGIC; 
  signal Result_5_0 : STD_LOGIC; 
  signal Result_6_0 : STD_LOGIC; 
  signal Result_7_0 : STD_LOGIC; 
  signal Result_8_0 : STD_LOGIC; 
  signal Result_9_0 : STD_LOGIC; 
  signal booth_multiplier_onBoard_en_a : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114 : STD_LOGIC; 
  signal booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118 : STD_LOGIC; 
  signal booth_multiplier_onBoard_counter_inst_reset_n_inv : STD_LOGIC; 
  signal N21_0 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X12 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1122 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X1 : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o : STD_LOGIC; 
  signal Result_10_0 : STD_LOGIC; 
  signal Result_11_0 : STD_LOGIC; 
  signal Result_12_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_out_temp_1129 : STD_LOGIC; 
  signal booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132 : STD_LOGIC; 
  signal booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133 : STD_LOGIC; 
  signal booth_multiplier_onBoard_counter_inst_count_hit_temp_1134 : STD_LOGIC; 
  signal start_led_OBUF_1135 : STD_LOGIC; 
  signal booth_multiplier_onBoard_en_m : STD_LOGIC; 
  signal enable_a_IBUF_1139 : STD_LOGIC; 
  signal input_0_IBUF_1141 : STD_LOGIC; 
  signal input_1_IBUF_1144 : STD_LOGIC; 
  signal input_2_IBUF_1147 : STD_LOGIC; 
  signal input_3_IBUF_1151 : STD_LOGIC; 
  signal input_4_IBUF_1155 : STD_LOGIC; 
  signal input_5_IBUF_1159 : STD_LOGIC; 
  signal input_6_IBUF_1163 : STD_LOGIC; 
  signal input_7_IBUF_1165 : STD_LOGIC; 
  signal enable_b_IBUF_1166 : STD_LOGIC; 
  signal enable_b_internal_b_4_AND_29_o : STD_LOGIC; 
  signal value_int_4_LDC_1168 : STD_LOGIC; 
  signal enable_b_internal_b_4_AND_30_o : STD_LOGIC; 
  signal value_int_4_C_4_1171 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1172 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1173 : STD_LOGIC; 
  signal enable_b_internal_b_1_AND_35_o : STD_LOGIC; 
  signal value_int_7_P_7_1175 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_1176 : STD_LOGIC; 
  signal enable_b_internal_b_7_AND_23_o : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_5_Q : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal enable_b_internal_b_5_AND_27_o : STD_LOGIC; 
  signal enable_b_internal_b_5_AND_28_o_0 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_6_Q : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1185 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1186 : STD_LOGIC; 
  signal enable_b_internal_b_2_AND_33_o : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_adders_0_rippleCarry_adder_instance_rippleCarry_adder_2_f_adder_X_Y_XOR_26_o : STD_LOGIC;
 
  signal enable_b_internal_b_6_AND_25_o : STD_LOGIC; 
  signal enable_b_internal_b_6_AND_26_o_0 : STD_LOGIC; 
  signal value_int_0_C_0_1191 : STD_LOGIC; 
  signal enable_b_internal_b_0_AND_38_o_0 : STD_LOGIC; 
  signal enable_b_internal_b_0_AND_37_o : STD_LOGIC; 
  signal value_int_0_LDC_1194 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1195 : STD_LOGIC; 
  signal value_int_3_P_3_1196 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1197 : STD_LOGIC; 
  signal enable_b_internal_b_3_AND_31_o : STD_LOGIC; 
  signal enable_b_enable_a_OR_52_o : STD_LOGIC; 
  signal value_int_11_1200 : STD_LOGIC; 
  signal value_int_12_1201 : STD_LOGIC; 
  signal value_int_15_1202 : STD_LOGIC; 
  signal Result_0_0 : STD_LOGIC; 
  signal enable_b_internal_b_7_AND_24_o_0 : STD_LOGIC; 
  signal value_int_8_1206 : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X21_0 : STD_LOGIC; 
  signal value_int_7 : STD_LOGIC; 
  signal value_int_7_C_7_1211 : STD_LOGIC; 
  signal enable_b_internal_b_1_AND_36_o_0 : STD_LOGIC; 
  signal booth_multiplier_onBoard_en_q : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal value_int_4_P_4_1215 : STD_LOGIC; 
  signal value_int_0_P_0_1216 : STD_LOGIC; 
  signal cathodes_1_OBUF_1218 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal enable_b_internal_b_2_AND_34_o_0 : STD_LOGIC; 
  signal cathodes_0_OBUF_1222 : STD_LOGIC; 
  signal cathodes_3_OBUF_0 : STD_LOGIC; 
  signal value_int_3_LDC_1224 : STD_LOGIC; 
  signal value_int_3_C_3_1225 : STD_LOGIC; 
  signal cathodes_5_OBUF_1226 : STD_LOGIC; 
  signal cathodes_2_OBUF_0 : STD_LOGIC; 
  signal enable_b_internal_b_3_AND_32_o : STD_LOGIC; 
  signal cathodes_6_OBUF_1229 : STD_LOGIC; 
  signal cathodes_4_OBUF_0 : STD_LOGIC; 
  signal anodes_0_OBUF_1231 : STD_LOGIC; 
  signal anodes_1_OBUF_0 : STD_LOGIC; 
  signal anodes_2_OBUF_1233 : STD_LOGIC; 
  signal anodes_3_OBUF_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q_1235 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q_1236 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q_1237 : STD_LOGIC; 
  signal value_int_0 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal value_int_7_LDC_1245 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_1_rt_16 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_2_rt_13 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_3_rt_4 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_4_rt_41 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_5_rt_38 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_6_rt_35 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_7_rt_26 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_8_rt_63 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_9_rt_60 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_10_rt_57 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_11_rt_48 : STD_LOGIC; 
  signal anodes_3_OBUF_131 : STD_LOGIC; 
  signal anodes_1_OBUF_137 : STD_LOGIC; 
  signal cathodes_4_OBUF_155 : STD_LOGIC; 
  signal cathodes_3_OBUF_149 : STD_LOGIC; 
  signal cathodes_2_OBUF_143 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal enable_b_internal_b_7_AND_24_o : STD_LOGIC; 
  signal enable_b_internal_b_4_AND_30_o_pack_3 : STD_LOGIC; 
  signal enable_b_internal_b_5_AND_28_o : STD_LOGIC; 
  signal display_counter_mod4_Mcount_count_counter : STD_LOGIC; 
  signal display_counter_mod4_COUNTS_temp_1_pack_3 : STD_LOGIC; 
  signal display_counter_mod4_Mcount_count_counter1 : STD_LOGIC; 
  signal display_counter_mod4_Mcount_count_counter2 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_0_pack_2 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_0 : STD_LOGIC; 
  signal display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_13 : STD_LOGIC; 
  signal Result_13_pack_3 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_12_rt_282 : STD_LOGIC; 
  signal display_clock_divisor_instance_clock_division_counter_13_rt_280 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_m_Q_temp_2_pack_1 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X21 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_pack_2 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal value_int_0_pack_3 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal enable_b_internal_b_6_AND_26_o : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_1 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_4 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_6 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_7 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_8 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_5 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_9 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_10 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_11 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_12 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_3 : STD_LOGIC; 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_eqn_2 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal N47 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N34_pack_8 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal booth_multiplier_onBoard_control_unit_current_FSM_FFd1_In : STD_LOGIC; 
  signal booth_multiplier_onBoard_control_unit_current_FSM_FFd3_In : STD_LOGIC; 
  signal enable_b_internal_b_1_AND_36_o : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal N14_pack_8 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal booth_multiplier_onBoard_counter_inst_reset_n_inv_pack_7 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_control_unit_current_FSM_FFd2_In : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1 : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_ff_input : STD_LOGIC; 
  signal value_int_6_C_6_862 : STD_LOGIC; 
  signal stop_OBUF_874 : STD_LOGIC; 
  signal value_int_5_C_5_884 : STD_LOGIC; 
  signal value_int_5_P_5_888 : STD_LOGIC; 
  signal enable_b_internal_b_0_AND_38_o : STD_LOGIC; 
  signal N53 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal enable_b_internal_b_2_AND_34_o : STD_LOGIC; 
  signal value_int_2_P_2_962 : STD_LOGIC; 
  signal enable_b_internal_b_3_AND_32_o_pack_1 : STD_LOGIC; 
  signal booth_multiplier_onBoard_counter_inst_count_hit_temp_PWR_32_o_MUX_57_o : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal booth_multiplier_onBoard_counter_inst_count_counter_2_pack_3 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal NlwBufferSignal_stop_OBUF_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_clock_BUFGP_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_stop_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_start_led_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anodes_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cathodes_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_7_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_7_P_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_7_P_7_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_4_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_7_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_b_Q_temp_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_display_counter_mod4_COUNTS_temp_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_counter_mod4_COUNTS_temp_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_counter_mod4_COUNTS_temp_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_out_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_13_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_4_P_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_4_P_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_7_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_reg_a_Q_temp_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_12_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_11_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_10_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_15_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_15_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_14_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_14_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_13_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_13_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_12_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_12_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_7_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_4_C_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_4_C_4_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_6_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_0_P_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_0_P_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_5_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_1_C_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_1_C_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_2_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_3_C_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_3_C_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_3_P_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_3_P_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_7_C_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_7_C_7_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_6_C_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_6_C_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_6_P_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_6_P_6_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_0_C_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_0_C_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_0_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_5_C_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_5_C_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_5_P_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_5_P_5_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_11_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_11_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_10_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_10_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_9_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_8_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_1_P_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_1_P_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_1_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_2_P_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_2_P_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_value_int_3_LDC_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_2_C_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_value_int_2_C_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_hit_temp_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_0_CLK : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_5_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp55_CYINITGND_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_4_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_3_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_anodes_7_OBUF_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_9_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_8_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_7_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_6_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_13_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_12_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_11_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_display_clock_divisor_instance_reset_n_inv_10_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
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
  signal NLW_display_clock_divisor_instance_reset_n_inv_14_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal booth_multiplier_onBoard_register_m_Q_temp : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal display_counter_mod4_COUNTS_temp : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal booth_multiplier_onBoard_counter_inst_count_counter : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal display_clock_divisor_instance_clock_division_counter : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal reg_b_Q_temp : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_a_Q_temp : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal display_cathodes_instance_nibble : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal display_clock_divisor_instance_Mcount_clock_division_counter_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
begin
  stop_OBUF_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGCTRL_X0Y0",
      PATHPULSE => 50 ps
    )
    port map (
      I => NlwBufferSignal_stop_OBUF_BUFG_IN,
      O => stop_OBUF_BUFG_1048
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
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(3),
      O => Result_3_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(2),
      O => Result_2_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(1),
      O => Result_1_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(0),
      O => Result_0_0
    );
  display_clock_divisor_instance_clock_division_counter_3_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(3),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_3_rt_4
    );
  display_clock_divisor_instance_reset_n_inv_5_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_5_D5LUT_O_UNCONNECTED
    );
  ProtoComp55_CYINITGND : X_ZERO
    generic map(
      LOC => "SLICE_X8Y131"
    )
    port map (
      O => NLW_ProtoComp55_CYINITGND_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X8Y131"
    )
    port map (
      CI => '0',
      CYINIT => '0',
      CO(3) => display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q_1235,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => Result(3),
      O(2) => Result(2),
      O(1) => Result(1),
      O(0) => Result(0),
      S(3) => display_clock_divisor_instance_clock_division_counter_3_rt_4,
      S(2) => display_clock_divisor_instance_clock_division_counter_2_rt_13,
      S(1) => display_clock_divisor_instance_clock_division_counter_1_rt_16,
      S(0) => display_clock_divisor_instance_Mcount_clock_division_counter_lut(0)
    );
  display_clock_divisor_instance_clock_division_counter_2_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(2),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_2_rt_13
    );
  display_clock_divisor_instance_reset_n_inv_4_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_4_C5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_1_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(1),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_1_rt_16
    );
  display_clock_divisor_instance_reset_n_inv_3_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_3_B5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_lut_0_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y131",
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
  anodes_7_OBUF_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y131",
      INIT => X"FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_anodes_7_OBUF_A5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(7),
      O => Result_7_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(6),
      O => Result_6_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(5),
      O => Result_5_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(4),
      O => Result_4_0
    );
  display_clock_divisor_instance_clock_division_counter_7_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => display_clock_divisor_instance_clock_division_counter(7),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_7_rt_26
    );
  display_clock_divisor_instance_reset_n_inv_9_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_9_D5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X8Y132"
    )
    port map (
      CI => display_clock_divisor_instance_Mcount_clock_division_counter_cy_3_Q_1235,
      CYINIT => '0',
      CO(3) => display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q_1236,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => Result(7),
      O(2) => Result(6),
      O(1) => Result(5),
      O(0) => Result(4),
      S(3) => display_clock_divisor_instance_clock_division_counter_7_rt_26,
      S(2) => display_clock_divisor_instance_clock_division_counter_6_rt_35,
      S(1) => display_clock_divisor_instance_clock_division_counter_5_rt_38,
      S(0) => display_clock_divisor_instance_clock_division_counter_4_rt_41
    );
  display_clock_divisor_instance_clock_division_counter_6_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(6),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_6_rt_35
    );
  display_clock_divisor_instance_reset_n_inv_8_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_8_C5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_5_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(5),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_5_rt_38
    );
  display_clock_divisor_instance_reset_n_inv_7_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_7_B5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_4_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(4),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_4_rt_41
    );
  display_clock_divisor_instance_reset_n_inv_6_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y132",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_6_A5LUT_O_UNCONNECTED
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
      I => Result(9),
      O => Result_9_0
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result(8),
      O => Result_8_0
    );
  display_clock_divisor_instance_clock_division_counter_11_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => display_clock_divisor_instance_clock_division_counter(11),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_11_rt_48
    );
  display_clock_divisor_instance_reset_n_inv_13_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_13_D5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X8Y133"
    )
    port map (
      CI => display_clock_divisor_instance_Mcount_clock_division_counter_cy_7_Q_1236,
      CYINIT => '0',
      CO(3) => display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q_1237,
      CO(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_2_UNCONNECTED,
      CO(1) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_1_UNCONNECTED,
      CO(0) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => Result(11),
      O(2) => Result(10),
      O(1) => Result(9),
      O(0) => Result(8),
      S(3) => display_clock_divisor_instance_clock_division_counter_11_rt_48,
      S(2) => display_clock_divisor_instance_clock_division_counter_10_rt_57,
      S(1) => display_clock_divisor_instance_clock_division_counter_9_rt_60,
      S(0) => display_clock_divisor_instance_clock_division_counter_8_rt_63
    );
  display_clock_divisor_instance_clock_division_counter_10_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(10),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_10_rt_57
    );
  display_clock_divisor_instance_reset_n_inv_12_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_12_C5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_9_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(9),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_9_rt_60
    );
  display_clock_divisor_instance_reset_n_inv_11_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_11_B5LUT_O_UNCONNECTED
    );
  display_clock_divisor_instance_clock_division_counter_8_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(8),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_8_rt_63
    );
  display_clock_divisor_instance_reset_n_inv_10_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y133",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_10_A5LUT_O_UNCONNECTED
    );
  input_4_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y75",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_4_IBUF_1155,
      I => input(4)
    );
  stop_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y57"
    )
    port map (
      I => NlwBufferSignal_stop_OBUF_I,
      O => stop
    );
  input_5_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y85",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_5_IBUF_1159,
      I => input(5)
    );
  input_6_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y65",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_6_IBUF_1163,
      I => input(6)
    );
  input_7_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y89",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_7_IBUF_1165,
      I => input(7)
    );
  start_led_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y114"
    )
    port map (
      I => NlwBufferSignal_start_led_OBUF_I,
      O => start_led
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
  enable_a_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y76",
      PATHPULSE => 50 ps
    )
    port map (
      O => enable_a_IBUF_1139,
      I => enable_a
    );
  enable_b_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y79",
      PATHPULSE => 50 ps
    )
    port map (
      O => enable_b_IBUF_1166,
      I => enable_b
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
      I => '1',
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
      I => '1',
      O => anodes(5)
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
      I => '1',
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
      I => '1',
      O => anodes(7)
    );
  start_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y82",
      PATHPULSE => 50 ps
    )
    port map (
      O => start_led_OBUF_1135,
      I => start
    );
  clock_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "IOB_X1Y126",
      PATHPULSE => 50 ps
    )
    port map (
      O => clock_BUFGP_IBUFG_1049,
      I => clock
    );
  input_0_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y101",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_0_IBUF_1141,
      I => input(0)
    );
  input_1_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y93",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_1_IBUF_1144,
      I => input(1)
    );
  input_2_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y87",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_2_IBUF_1147,
      I => input(2)
    );
  input_3_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y73",
      PATHPULSE => 50 ps
    )
    port map (
      O => input_3_IBUF_1151,
      I => input(3)
    );
  anodes_2_OBUF_anodes_2_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_3_OBUF_131,
      O => anodes_3_OBUF_0
    );
  display_anodes_instance_n0016_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y78",
      INIT => X"FFF0FFFFFFF0FFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR3 => display_counter_mod4_COUNTS_temp(2),
      ADR5 => '1',
      O => anodes_2_OBUF_1233
    );
  display_anodes_instance_n0016_3_1 : X_LUT5
    generic map(
      LOC => "SLICE_X1Y78",
      INIT => X"FF0FFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR3 => display_counter_mod4_COUNTS_temp(2),
      O => anodes_3_OBUF_131
    );
  anodes_0_OBUF_anodes_0_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_1_OBUF_137,
      O => anodes_1_OBUF_0
    );
  display_anodes_instance_n0016_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y103",
      INIT => X"FFFFFAFAFFFFFAFA"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR0 => display_counter_mod4_COUNTS_temp(2),
      ADR5 => '1',
      O => anodes_0_OBUF_1231
    );
  display_anodes_instance_n0016_1_1 : X_LUT5
    generic map(
      LOC => "SLICE_X1Y103",
      INIT => X"FFFFAFAF"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR0 => display_counter_mod4_COUNTS_temp(2),
      O => anodes_1_OBUF_137
    );
  cathodes_5_OBUF_cathodes_5_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_2_OBUF_143,
      O => cathodes_2_OBUF_0
    );
  cathodes_5_OBUF_cathodes_5_OBUF_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_3_OBUF_149,
      O => cathodes_3_OBUF_0
    );
  cathodes_5_OBUF_cathodes_5_OBUF_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_4_OBUF_155,
      O => cathodes_4_OBUF_0
    );
  display_cathodes_instance_Mram_cathodes_for_digit51 : X_LUT6
    generic map(
      LOC => "SLICE_X2Y74",
      INIT => X"6032603260326032"
    )
    port map (
      ADR4 => '1',
      ADR1 => display_cathodes_instance_nibble(3),
      ADR0 => display_cathodes_instance_nibble_1_0,
      ADR2 => display_cathodes_instance_nibble(0),
      ADR3 => display_cathodes_instance_nibble_2_0,
      ADR5 => '1',
      O => cathodes_5_OBUF_1226
    );
  display_cathodes_instance_Mram_cathodes_for_digit21 : X_LUT5
    generic map(
      LOC => "SLICE_X2Y74",
      INIT => X"8C028C02"
    )
    port map (
      ADR4 => '1',
      ADR1 => display_cathodes_instance_nibble(3),
      ADR0 => display_cathodes_instance_nibble_1_0,
      ADR2 => display_cathodes_instance_nibble(0),
      ADR3 => display_cathodes_instance_nibble_2_0,
      O => cathodes_2_OBUF_143
    );
  display_cathodes_instance_Mram_cathodes_for_digit11 : X_LUT6
    generic map(
      LOC => "SLICE_X2Y74",
      INIT => X"4499110044991100"
    )
    port map (
      ADR2 => '1',
      ADR4 => display_cathodes_instance_nibble(0),
      ADR0 => display_cathodes_instance_nibble_1_0,
      ADR3 => display_cathodes_instance_nibble_2_0,
      ADR1 => display_cathodes_instance_nibble(3),
      ADR5 => '1',
      O => cathodes_0_OBUF_1222
    );
  display_cathodes_instance_Mram_cathodes_for_digit31 : X_LUT5
    generic map(
      LOC => "SLICE_X2Y74",
      INIT => X"AA111188"
    )
    port map (
      ADR2 => '1',
      ADR4 => display_cathodes_instance_nibble(0),
      ADR0 => display_cathodes_instance_nibble_1_0,
      ADR3 => display_cathodes_instance_nibble_2_0,
      ADR1 => display_cathodes_instance_nibble(3),
      O => cathodes_3_OBUF_149
    );
  display_cathodes_instance_Mram_cathodes_for_digit61 : X_LUT6
    generic map(
      LOC => "SLICE_X2Y74",
      INIT => X"0088443300884433"
    )
    port map (
      ADR2 => '1',
      ADR4 => display_cathodes_instance_nibble_1_0,
      ADR1 => display_cathodes_instance_nibble_2_0,
      ADR3 => display_cathodes_instance_nibble(3),
      ADR0 => display_cathodes_instance_nibble(0),
      ADR5 => '1',
      O => cathodes_6_OBUF_1229
    );
  display_cathodes_instance_Mram_cathodes_for_digit41 : X_LUT5
    generic map(
      LOC => "SLICE_X2Y74",
      INIT => X"00AA22EE"
    )
    port map (
      ADR2 => '1',
      ADR4 => display_cathodes_instance_nibble_1_0,
      ADR1 => display_cathodes_instance_nibble_2_0,
      ADR3 => display_cathodes_instance_nibble(3),
      ADR0 => display_cathodes_instance_nibble(0),
      O => cathodes_4_OBUF_155
    );
  reg_a_Q_temp_7 : X_FF
    generic map(
      LOC => "SLICE_X4Y57",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_7_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_7_IN,
      O => reg_a_Q_temp(7),
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_6 : X_FF
    generic map(
      LOC => "SLICE_X4Y57",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_6_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_6_IN,
      O => reg_a_Q_temp(6),
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_5 : X_FF
    generic map(
      LOC => "SLICE_X4Y57",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_5_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_5_IN,
      O => reg_a_Q_temp(5),
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_4 : X_FF
    generic map(
      LOC => "SLICE_X4Y57",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_4_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_4_IN,
      O => reg_a_Q_temp(4),
      RST => GND,
      SET => GND
    );
  value_int_7_P_7_value_int_7_P_7_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N32,
      O => N32_0
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW1 : X_MUX2
    generic map(
      LOC => "SLICE_X8Y51"
    )
    port map (
      IA => N42,
      IB => N43,
      O => N32,
      SEL => booth_multiplier_onBoard_register_m_Q_temp(1)
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW1_F : X_LUT6
    generic map(
      LOC => "SLICE_X8Y51",
      INIT => X"FCE8FCC0FCC0FCC0"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N42
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW1_G : X_LUT6
    generic map(
      LOC => "SLICE_X8Y51",
      INIT => X"FCFCFCFCFCE8FCC0"
    )
    port map (
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N43
    );
  value_int_7_P_7 : X_FF
    generic map(
      LOC => "SLICE_X8Y51",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_7_P_7_CLK,
      I => NlwBufferSignal_value_int_7_P_7_IN,
      O => value_int_7_P_7_1175,
      SET => enable_b_internal_b_7_AND_23_o,
      RST => GND
    );
  value_int_4_LDC_value_int_4_LDC_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_4_AND_30_o_pack_3,
      O => enable_b_internal_b_4_AND_30_o
    );
  value_int_4_LDC_value_int_4_LDC_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_7_AND_24_o,
      O => enable_b_internal_b_7_AND_24_o_0
    );
  enable_b_internal_b_4_AND_29_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y52",
      INIT => X"AACCAA00AACCAA00"
    )
    port map (
      ADR2 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR0 => reg_a_Q_temp(4),
      ADR1 => reg_b_Q_temp(4),
      ADR4 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_4_AND_29_o
    );
  enable_b_internal_b_4_AND_30_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X8Y52",
      INIT => X"55335500"
    )
    port map (
      ADR2 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR0 => reg_a_Q_temp(4),
      ADR1 => reg_b_Q_temp(4),
      ADR4 => enable_b_IBUF_1166,
      O => enable_b_internal_b_4_AND_30_o_pack_3
    );
  value_int_4_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X8Y52",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_4_LDC_CLK,
      I => '1',
      O => value_int_4_LDC_1168,
      RST => enable_b_internal_b_4_AND_30_o,
      SET => GND
    );
  enable_b_internal_b_7_AND_23_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y52",
      INIT => X"F0AAF000F0AAF000"
    )
    port map (
      ADR1 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR2 => reg_a_Q_temp(7),
      ADR0 => reg_b_Q_temp(7),
      ADR4 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_7_AND_23_o
    );
  enable_b_internal_b_7_AND_24_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X8Y52",
      INIT => X"0F550F00"
    )
    port map (
      ADR1 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR2 => reg_a_Q_temp(7),
      ADR0 => reg_b_Q_temp(7),
      ADR4 => enable_b_IBUF_1166,
      O => enable_b_internal_b_7_AND_24_o
    );
  reg_b_Q_temp_7 : X_FF
    generic map(
      LOC => "SLICE_X8Y56",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_7_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_7_IN,
      O => reg_b_Q_temp(7),
      RST => GND,
      SET => GND
    );
  reg_b_Q_temp_6 : X_FF
    generic map(
      LOC => "SLICE_X8Y56",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_6_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_6_IN,
      O => reg_b_Q_temp(6),
      RST => GND,
      SET => GND
    );
  reg_b_Q_temp_5 : X_FF
    generic map(
      LOC => "SLICE_X8Y56",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_5_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_5_IN,
      O => reg_b_Q_temp(5),
      RST => GND,
      SET => GND
    );
  reg_b_Q_temp_4 : X_FF
    generic map(
      LOC => "SLICE_X8Y56",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_4_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_4_IN,
      O => reg_b_Q_temp(4),
      RST => GND,
      SET => GND
    );
  enable_b_internal_b_5_AND_27_o_enable_b_internal_b_5_AND_27_o_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_5_AND_28_o,
      O => enable_b_internal_b_5_AND_28_o_0
    );
  enable_b_internal_b_5_AND_27_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y58",
      INIT => X"E4A0E4A0E4A0E4A0"
    )
    port map (
      ADR4 => '1',
      ADR0 => enable_a_IBUF_1139,
      ADR2 => reg_a_Q_temp(5),
      ADR1 => reg_b_Q_temp(5),
      ADR3 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_5_AND_27_o
    );
  enable_b_internal_b_5_AND_28_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X8Y58",
      INIT => X"1B0A1B0A"
    )
    port map (
      ADR4 => '1',
      ADR0 => enable_a_IBUF_1139,
      ADR2 => reg_a_Q_temp(5),
      ADR1 => reg_b_Q_temp(5),
      ADR3 => enable_b_IBUF_1166,
      O => enable_b_internal_b_5_AND_28_o
    );
  display_cathodes_instance_Mram_cathodes_for_digit111 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y71",
      INIT => X"C3FCC3FCC000C000"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR5 => display_cathodes_instance_nibble_2_0,
      ADR3 => display_cathodes_instance_nibble(0),
      ADR2 => display_cathodes_instance_nibble_1_0,
      ADR1 => display_cathodes_instance_nibble(3),
      O => cathodes_1_OBUF_1218
    );
  display_cathodes_instance_Mmux_nibble_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y71",
      INIT => X"3033202300032023"
    )
    port map (
      ADR1 => display_counter_mod4_COUNTS_temp(2),
      ADR2 => display_counter_mod4_COUNTS_temp(1),
      ADR0 => value_int_8_1206,
      ADR4 => display_counter_mod4_COUNTS_temp(0),
      ADR5 => value_int_12_1201,
      ADR3 => N4,
      O => display_cathodes_instance_nibble(0)
    );
  reg_b_Q_temp_3 : X_FF
    generic map(
      LOC => "SLICE_X8Y73",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_3_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_3_IN,
      O => reg_b_Q_temp(3),
      RST => GND,
      SET => GND
    );
  reg_b_Q_temp_2 : X_FF
    generic map(
      LOC => "SLICE_X8Y73",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_2_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_2_IN,
      O => reg_b_Q_temp(2),
      RST => GND,
      SET => GND
    );
  reg_b_Q_temp_1 : X_FF
    generic map(
      LOC => "SLICE_X8Y73",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_1_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_1_IN,
      O => reg_b_Q_temp(1),
      RST => GND,
      SET => GND
    );
  reg_b_Q_temp_0 : X_FF
    generic map(
      LOC => "SLICE_X8Y73",
      INIT => '0'
    )
    port map (
      CE => enable_b_IBUF_1166,
      CLK => NlwBufferSignal_reg_b_Q_temp_0_CLK,
      I => NlwBufferSignal_reg_b_Q_temp_0_IN,
      O => reg_b_Q_temp(0),
      RST => GND,
      SET => GND
    );
  display_counter_mod4_COUNTS_temp_2_display_counter_mod4_COUNTS_temp_2_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_counter_mod4_COUNTS_temp_1_pack_3,
      O => display_counter_mod4_COUNTS_temp(1)
    );
  display_counter_mod4_COUNTS_temp_2 : X_SFF
    generic map(
      LOC => "SLICE_X8Y129",
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
  display_counter_mod4_Mcount_count_counter_xor_2_11 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y129",
      INIT => X"3C3CCCCC3C3CCCCC"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR1 => display_counter_mod4_COUNTS_temp(2),
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      ADR5 => '1',
      O => display_counter_mod4_Mcount_count_counter2
    );
  display_counter_mod4_Mcount_count_counter_xor_1_11 : X_LUT5
    generic map(
      LOC => "SLICE_X8Y129",
      INIT => X"0F0FF0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => display_counter_mod4_COUNTS_temp(0),
      ADR3 => '1',
      ADR4 => display_counter_mod4_COUNTS_temp(1),
      O => display_counter_mod4_Mcount_count_counter1
    );
  display_counter_mod4_COUNTS_temp_1 : X_SFF
    generic map(
      LOC => "SLICE_X8Y129",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_counter_mod4_COUNTS_temp_1_CLK,
      I => display_counter_mod4_Mcount_count_counter1,
      O => display_counter_mod4_COUNTS_temp_1_pack_3,
      SRST => GND,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  display_counter_mod4_COUNTS_temp_0 : X_SFF
    generic map(
      LOC => "SLICE_X8Y129",
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
      LOC => "SLICE_X8Y129",
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
  display_clock_divisor_instance_clock_out_temp_display_clock_divisor_instance_clock_out_temp_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_division_counter_0_pack_2,
      O => display_clock_divisor_instance_clock_division_counter(0)
    );
  display_clock_divisor_instance_clock_out_temp : X_FF
    generic map(
      LOC => "SLICE_X8Y130",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_out_temp_CLK,
      I => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o,
      O => display_clock_divisor_instance_clock_out_temp_1129,
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_3 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y130",
      INIT => X"1000100010001000"
    )
    port map (
      ADR4 => '1',
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR5 => '1',
      O => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_01 : X_LUT5
    generic map(
      LOC => "SLICE_X8Y130",
      INIT => X"EFFF0000"
    )
    port map (
      ADR4 => Result_0_0,
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_0
    );
  display_clock_divisor_instance_clock_division_counter_0 : X_FF
    generic map(
      LOC => "SLICE_X8Y130",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_0_CLK,
      I => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_0,
      O => display_clock_divisor_instance_clock_division_counter_0_pack_2,
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_2 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y130",
      INIT => X"0000001000000000"
    )
    port map (
      ADR0 => display_clock_divisor_instance_clock_division_counter(4),
      ADR1 => display_clock_divisor_instance_clock_division_counter(5),
      ADR3 => display_clock_divisor_instance_clock_division_counter(6),
      ADR4 => display_clock_divisor_instance_clock_division_counter(7),
      ADR5 => display_clock_divisor_instance_clock_division_counter(1),
      ADR2 => display_clock_divisor_instance_clock_division_counter(0),
      O => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093
    );
  display_clock_divisor_instance_clock_division_counter_13_display_clock_divisor_instance_clock_division_counter_13_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Result_13_pack_3,
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
  display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y134",
      INIT => X"8000000000000000"
    )
    port map (
      ADR0 => display_clock_divisor_instance_clock_division_counter(3),
      ADR5 => display_clock_divisor_instance_clock_division_counter(2),
      ADR4 => display_clock_divisor_instance_clock_division_counter(9),
      ADR2 => display_clock_divisor_instance_clock_division_counter(8),
      ADR1 => display_clock_divisor_instance_clock_division_counter(13),
      ADR3 => display_clock_divisor_instance_clock_division_counter(10),
      O => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q
    );
  display_clock_divisor_instance_clock_division_counter_13 : X_FF
    generic map(
      LOC => "SLICE_X8Y134",
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
  display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X8Y134"
    )
    port map (
      CI => display_clock_divisor_instance_Mcount_clock_division_counter_cy_11_Q_1237,
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
      O(1) => Result_13_pack_3,
      O(0) => Result(12),
      S(3) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_S_3_UNCONNECTED,
      S(2) => NLW_display_clock_divisor_instance_Mcount_clock_division_counter_xor_13_S_2_UNCONNECTED,
      S(1) => display_clock_divisor_instance_clock_division_counter_13_rt_280,
      S(0) => display_clock_divisor_instance_clock_division_counter_12_rt_282
    );
  display_clock_divisor_instance_Mcount_clock_division_counter_eqn_131 : X_LUT6
    generic map(
      LOC => "SLICE_X8Y134",
      INIT => X"FFFF0000CFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR5 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result(13),
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_13
    );
  display_clock_divisor_instance_clock_division_counter_13_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y134",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR5 => '1',
      ADR3 => '1',
      ADR4 => '1',
      ADR2 => display_clock_divisor_instance_clock_division_counter(13),
      O => display_clock_divisor_instance_clock_division_counter_13_rt_280
    );
  display_clock_divisor_instance_clock_division_counter_12_rt : X_LUT6
    generic map(
      LOC => "SLICE_X8Y134",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR5 => '1',
      O => display_clock_divisor_instance_clock_division_counter_12_rt_282
    );
  display_clock_divisor_instance_reset_n_inv_14_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X8Y134",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_display_clock_divisor_instance_reset_n_inv_14_A5LUT_O_UNCONNECTED
    );
  N28_N28_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N28,
      O => N28_0
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW2 : X_MUX2
    generic map(
      LOC => "SLICE_X9Y50"
    )
    port map (
      IA => N36,
      IB => N37,
      O => N28,
      SEL => booth_multiplier_onBoard_subtract
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW2_F : X_LUT6
    generic map(
      LOC => "SLICE_X9Y50",
      INIT => X"01150555577F5FFF"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR3 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => N36
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW2_G : X_LUT6
    generic map(
      LOC => "SLICE_X9Y50",
      INIT => X"1051505575F7F5FF"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => N37
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_m_Q_temp_2_pack_1,
      O => booth_multiplier_onBoard_register_m_Q_temp(2)
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_Mxor_internal_B_2_xo_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y51",
      INIT => X"F00FF0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(2),
      ADR3 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW1 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y51",
      INIT => X"0F2DA5B40F1E5A78"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR5 => booth_multiplier_onBoard_subtract,
      ADR3 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      O => N26
    );
  booth_multiplier_onBoard_register_m_Q_temp_2 : X_FF
    generic map(
      LOC => "SLICE_X9Y51",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_2_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_2_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp_2_pack_1,
      RST => GND,
      SET => GND
    );
  value_int_4_P_4_value_int_4_P_4_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N33,
      O => N33_0
    );
  value_int_4_P_4_value_int_4_P_4_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X21,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X21_0
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW2 : X_MUX2
    generic map(
      LOC => "SLICE_X9Y52"
    )
    port map (
      IA => N44,
      IB => N45,
      O => N33,
      SEL => booth_multiplier_onBoard_register_m_Q_temp(1)
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW2_F : X_LUT6
    generic map(
      LOC => "SLICE_X9Y52",
      INIT => X"FFF7333333310000"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N44
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW2_G : X_LUT6
    generic map(
      LOC => "SLICE_X9Y52",
      INIT => X"C400FFC40000FF00"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR4 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N45
    );
  booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_mux_Mmux_X1_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y52",
      INIT => X"AFFF50005000AFFF"
    )
    port map (
      ADR1 => '1',
      ADR5 => booth_multiplier_onBoard_register_m_Q_temp(5),
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR0 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      O => N16
    );
  value_int_4_P_4 : X_FF
    generic map(
      LOC => "SLICE_X9Y52",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_4_P_4_CLK,
      I => NlwBufferSignal_value_int_4_P_4_IN,
      O => value_int_4_P_4_1215,
      SET => enable_b_internal_b_4_AND_29_o,
      RST => GND
    );
  booth_multiplier_onBoard_control_unit_current_n0040_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y52",
      INIT => X"00FF000000FF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR5 => '1',
      O => booth_multiplier_onBoard_en_m
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X211 : X_LUT5
    generic map(
      LOC => "SLICE_X9Y52",
      INIT => X"2E3F3F3F"
    )
    port map (
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR0 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X21
    );
  booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => value_int_0_pack_3,
      O => value_int_0
    );
  booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_pack_2,
      O => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_1176
    );
  booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => X"FF000000FF000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR5 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_ff_input
    );
  value_int_01 : X_LUT5
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => X"CACACACA"
    )
    port map (
      ADR2 => value_int_0_LDC_1194,
      ADR0 => value_int_0_C_0_1191,
      ADR1 => value_int_0_P_0_1216,
      ADR3 => '1',
      ADR4 => '1',
      O => value_int_0_pack_3
    );
  display_cathodes_instance_Mmux_nibble_0_1_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => X"4400770044FF77FF"
    )
    port map (
      ADR2 => '1',
      ADR3 => display_counter_mod4_COUNTS_temp(0),
      ADR1 => value_int_4_LDC_1168,
      ADR4 => value_int_4_C_4_1171,
      ADR0 => value_int_4_P_4_1215,
      ADR5 => value_int_0,
      O => N4
    );
  booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1195,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => X"FFCC00CCFFCC00CC"
    )
    port map (
      ADR0 => '1',
      ADR2 => '1',
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => reg_a_Q_temp(6),
      ADR4 => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_1176,
      ADR5 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT5
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => X"F0AAF0AA"
    )
    port map (
      ADR0 => reg_a_Q_temp(7),
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => '1',
      ADR4 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X9Y53",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_pack_2,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_m_Q_temp_7_booth_multiplier_onBoard_register_m_Q_temp_7_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_6_AND_26_o,
      O => enable_b_internal_b_6_AND_26_o_0
    );
  booth_multiplier_onBoard_register_m_Q_temp_7 : X_FF
    generic map(
      LOC => "SLICE_X9Y54",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_7_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_7_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(7),
      RST => GND,
      SET => GND
    );
  enable_b_internal_b_6_AND_25_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y54",
      INIT => X"CCCCF000CCCCF000"
    )
    port map (
      ADR0 => '1',
      ADR4 => enable_a_IBUF_1139,
      ADR1 => reg_a_Q_temp(6),
      ADR3 => reg_b_Q_temp(6),
      ADR2 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_6_AND_25_o
    );
  enable_b_internal_b_6_AND_26_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X9Y54",
      INIT => X"333300F0"
    )
    port map (
      ADR0 => '1',
      ADR4 => enable_a_IBUF_1139,
      ADR1 => reg_a_Q_temp(6),
      ADR3 => reg_b_Q_temp(6),
      ADR2 => enable_b_IBUF_1166,
      O => enable_b_internal_b_6_AND_26_o
    );
  booth_multiplier_onBoard_register_m_Q_temp_6 : X_FF
    generic map(
      LOC => "SLICE_X9Y54",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_6_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_6_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(6),
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_m_Q_temp_4 : X_FF
    generic map(
      LOC => "SLICE_X9Y54",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_4_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_4_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(4),
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_m_Q_temp_5 : X_FF
    generic map(
      LOC => "SLICE_X9Y55",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_5_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_5_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(5),
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1,
      O => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1185
    );
  booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X9Y57",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1172,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X9Y57",
      INIT => X"AACCAACCAACCAACC"
    )
    port map (
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => reg_a_Q_temp(4),
      ADR0 => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1185,
      ADR5 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT5
    generic map(
      LOC => "SLICE_X9Y57",
      INIT => X"F0FFF000"
    )
    port map (
      ADR4 => reg_a_Q_temp(5),
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1195,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => '1',
      ADR0 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X9Y57",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1,
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_3 : X_FF
    generic map(
      LOC => "SLICE_X9Y73",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_3_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_3_IN,
      O => reg_a_Q_temp(3),
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_2 : X_FF
    generic map(
      LOC => "SLICE_X9Y73",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_2_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_2_IN,
      O => reg_a_Q_temp(2),
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_1 : X_FF
    generic map(
      LOC => "SLICE_X9Y73",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_1_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_1_IN,
      O => reg_a_Q_temp(1),
      RST => GND,
      SET => GND
    );
  reg_a_Q_temp_0 : X_FF
    generic map(
      LOC => "SLICE_X9Y73",
      INIT => '0'
    )
    port map (
      CE => enable_a_IBUF_1139,
      CLK => NlwBufferSignal_reg_a_Q_temp_0_CLK,
      I => NlwBufferSignal_reg_a_Q_temp_0_IN,
      O => reg_a_Q_temp(0),
      RST => GND,
      SET => GND
    );
  display_clock_divisor_instance_clock_division_counter_4 : X_FF
    generic map(
      LOC => "SLICE_X9Y131",
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
      LOC => "SLICE_X9Y131",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_4_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_4
    );
  display_clock_divisor_instance_clock_division_counter_1 : X_FF
    generic map(
      LOC => "SLICE_X9Y131",
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
      LOC => "SLICE_X9Y131",
      INIT => X"FFAFFFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR3 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR4 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_1_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_1
    );
  display_clock_divisor_instance_clock_division_counter_8 : X_FF
    generic map(
      LOC => "SLICE_X9Y132",
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
      LOC => "SLICE_X9Y132",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_8_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_8
    );
  display_clock_divisor_instance_clock_division_counter_7 : X_FF
    generic map(
      LOC => "SLICE_X9Y132",
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
      LOC => "SLICE_X9Y132",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_7_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_7
    );
  display_clock_divisor_instance_clock_division_counter_6 : X_FF
    generic map(
      LOC => "SLICE_X9Y132",
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
      LOC => "SLICE_X9Y132",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_6_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_6
    );
  display_clock_divisor_instance_clock_division_counter_5 : X_FF
    generic map(
      LOC => "SLICE_X9Y132",
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
      LOC => "SLICE_X9Y132",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR1 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_5_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_5
    );
  display_clock_divisor_instance_clock_division_counter_12 : X_FF
    generic map(
      LOC => "SLICE_X9Y133",
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
      LOC => "SLICE_X9Y133",
      INIT => X"FFFFAFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_12_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_12
    );
  display_clock_divisor_instance_clock_division_counter_11 : X_FF
    generic map(
      LOC => "SLICE_X9Y133",
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
      LOC => "SLICE_X9Y133",
      INIT => X"FFFFAFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR0 => display_clock_divisor_instance_clock_division_counter(12),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_11_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_11
    );
  display_clock_divisor_instance_clock_division_counter_10 : X_FF
    generic map(
      LOC => "SLICE_X9Y133",
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
      LOC => "SLICE_X9Y133",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => display_clock_divisor_instance_clock_division_counter(12),
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_10_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_10
    );
  display_clock_divisor_instance_clock_division_counter_9 : X_FF
    generic map(
      LOC => "SLICE_X9Y133",
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
      LOC => "SLICE_X9Y133",
      INIT => X"FFFFCFFF00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => display_clock_divisor_instance_clock_division_counter(12),
      ADR4 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_9_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_9
    );
  display_clock_divisor_instance_clock_division_counter_3 : X_FF
    generic map(
      LOC => "SLICE_X9Y134",
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
      LOC => "SLICE_X9Y134",
      INIT => X"FFFFAFFF00000000"
    )
    port map (
      ADR1 => '1',
      ADR4 => display_clock_divisor_instance_clock_division_counter(12),
      ADR0 => display_clock_divisor_instance_clock_division_counter(11),
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR5 => Result_3_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_3
    );
  display_clock_divisor_instance_clock_division_counter_2 : X_FF
    generic map(
      LOC => "SLICE_X9Y134",
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
      LOC => "SLICE_X9Y134",
      INIT => X"FFFF0000CFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => display_clock_divisor_instance_clock_division_counter(12),
      ADR5 => display_clock_divisor_instance_clock_division_counter(11),
      ADR2 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_1_1093,
      ADR3 => display_clock_divisor_instance_PWR_8_o_clock_division_counter_13_equal_1_o_13_Q,
      ADR4 => Result_2_0,
      O => display_clock_divisor_instance_Mcount_clock_division_counter_eqn_2
    );
  booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N29,
      O => N29_0
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW3 : X_MUX2
    generic map(
      LOC => "SLICE_X11Y50"
    )
    port map (
      IA => N38,
      IB => N39,
      O => N29,
      SEL => booth_multiplier_onBoard_subtract
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW3_F : X_LUT6
    generic map(
      LOC => "SLICE_X11Y50",
      INIT => X"010101155757577F"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => N38
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW3_G : X_LUT6
    generic map(
      LOC => "SLICE_X11Y50",
      INIT => X"10101051757575F7"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => N39
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y50",
      INIT => X"2DB41E78A5F05AF0"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR4 => booth_multiplier_onBoard_subtract,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      O => N25
    );
  booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X11Y50",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y50",
      INIT => X"A3A3ACACA3ACA3AC"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      ADR5 => N12,
      ADR4 => N26,
      ADR3 => N25,
      O => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N34_pack_8,
      O => N34
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW3 : X_MUX2
    generic map(
      LOC => "SLICE_X11Y51"
    )
    port map (
      IA => N46,
      IB => N47,
      O => N34_pack_8,
      SEL => booth_multiplier_onBoard_register_m_Q_temp(1)
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW3_F : X_LUT6
    generic map(
      LOC => "SLICE_X11Y51",
      INIT => X"FFFF0F0FFFBF0F0B"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N46
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW3_G : X_LUT6
    generic map(
      LOC => "SLICE_X11Y51",
      INIT => X"FFBF0F0BFF0F0F00"
    )
    port map (
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N47
    );
  booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X11Y51",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_mux_Mmux_X12 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y51",
      INIT => X"AAAAAAAA0FF033CC"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1122,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR3 => 
booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_adders_0_rippleCarry_adder_instance_rippleCarry_adder_2_f_adder_X_Y_XOR_26_o
,
      ADR1 => N18,
      ADR2 => N19,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o,
      O => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y51",
      INIT => X"018945CD23AB67EF"
    )
    port map (
      ADR1 => booth_multiplier_onBoard_subtract,
      ADR0 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR4 => N33_0,
      ADR3 => N34,
      ADR2 => N31_0,
      ADR5 => N32_0,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o
    );
  booth_multiplier_onBoard_register_m_Q_temp_3 : X_FF
    generic map(
      LOC => "SLICE_X11Y52",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_3_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_3_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(3),
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_mux_Mmux_X11_SW1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y52",
      INIT => X"FFF0F0F0F0000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_5_Q,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => N19
    );
  booth_multiplier_onBoard_register_m_Q_temp_1 : X_FF
    generic map(
      LOC => "SLICE_X11Y52",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_1_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_1_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(1),
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_mux_Mmux_X11_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y52",
      INIT => X"FFFFFFF0FF00F000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_5_Q,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => N18
    );
  booth_multiplier_onBoard_register_m_Q_temp_0 : X_FF
    generic map(
      LOC => "SLICE_X11Y52",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_m,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_0_CLK,
      I => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_0_IN,
      O => booth_multiplier_onBoard_register_m_Q_temp(0),
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_Mxor_internal_B_4_xo_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y52",
      INIT => X"F00FF0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(4),
      ADR3 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q
    );
  booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X11Y53",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1122,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X15 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y53",
      INIT => X"FCCFEEDD03301122"
    )
    port map (
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR3 => N21_0,
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X12,
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1122,
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X1,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_mux2_1_sum_select_SEL_INV_28_o,
      O => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X13 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y54",
      INIT => X"FEE0F880FAA0F000"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114,
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR3 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_6_Q,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_5_Q,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X12
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd1_booth_multiplier_onBoard_control_unit_current_FSM_FFd1_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N21,
      O => N21_0
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd1 : X_FF
    generic map(
      LOC => "SLICE_X11Y55",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd1_CLK,
      I => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_In,
      O => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd1_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y55",
      INIT => X"FC00CF00FC00CF00"
    )
    port map (
      ADR0 => '1',
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR4 => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR5 => '1',
      O => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_In
    );
  booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X15_SW0 : X_LUT5
    generic map(
      LOC => "SLICE_X11Y55",
      INIT => X"A6AAA6AA"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(7),
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR4 => '1',
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => N21
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd3 : X_FF
    generic map(
      LOC => "SLICE_X11Y56",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd3_CLK,
      I => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_In,
      O => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd3_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y56",
      INIT => X"0300032230003022"
    )
    port map (
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR5 => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR0 => start_led_OBUF_1135,
      O => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_In
    );
  enable_b_internal_b_1_AND_35_o_enable_b_internal_b_1_AND_35_o_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_1_AND_36_o,
      O => enable_b_internal_b_1_AND_36_o_0
    );
  enable_b_internal_b_1_AND_35_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y72",
      INIT => X"F0F08888F0F08888"
    )
    port map (
      ADR3 => '1',
      ADR4 => enable_a_IBUF_1139,
      ADR2 => reg_a_Q_temp(1),
      ADR1 => reg_b_Q_temp(1),
      ADR0 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_1_AND_35_o
    );
  enable_b_internal_b_1_AND_36_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X11Y72",
      INIT => X"0F0F2222"
    )
    port map (
      ADR3 => '1',
      ADR4 => enable_a_IBUF_1139,
      ADR2 => reg_a_Q_temp(1),
      ADR1 => reg_b_Q_temp(1),
      ADR0 => enable_b_IBUF_1166,
      O => enable_b_internal_b_1_AND_36_o
    );
  booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N14_pack_8,
      O => N14
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => X"8ECFE8C08ECFE8C0"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(1),
      ADR3 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR4 => booth_multiplier_onBoard_subtract,
      ADR5 => '1',
      O => N12
    );
  booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_mux_Mmux_X1_SW0 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => X"7130173F"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(1),
      ADR3 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR4 => booth_multiplier_onBoard_subtract,
      O => N14_pack_8
    );
  booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_mux_Mmux_X1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => X"FF3C003CFFC300C3"
    )
    port map (
      ADR0 => '1',
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR2 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR5 => N14,
      O => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => X"F5F60506F6FA060A"
    )
    port map (
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR3 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_2_Q,
      ADR0 => N23,
      ADR5 => N12,
      O => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_mux_Mmux_X1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y50",
      INIT => X"8D8D8DD8D88DD8D8"
    )
    port map (
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114,
      ADR0 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR2 => N16,
      ADR3 => N12,
      ADR4 => N28_0,
      ADR5 => N29_0,
      O => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N31,
      O => N31_0
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW0 : X_MUX2
    generic map(
      LOC => "SLICE_X10Y51"
    )
    port map (
      IA => N40,
      IB => N41,
      O => N31,
      SEL => booth_multiplier_onBoard_register_m_Q_temp(1)
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW0_F : X_LUT6
    generic map(
      LOC => "SLICE_X10Y51",
      INIT => X"FFFF800080000000"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR4 => booth_multiplier_onBoard_register_m_Q_temp(3),
      O => N40
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X41_SW0_SW0_G : X_LUT6
    generic map(
      LOC => "SLICE_X10Y51",
      INIT => X"FFFFF800F8000000"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR4 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR5 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => N41
    );
  booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X10Y51",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_control_unit_Mmux_count_up11 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y51",
      INIT => X"2222222222222222"
    )
    port map (
      ADR4 => '1',
      ADR2 => '1',
      ADR1 => booth_multiplier_onBoard_counter_inst_count_hit_temp_1134,
      ADR3 => '1',
      ADR0 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR5 => '1',
      O => booth_multiplier_onBoard_count_up
    );
  booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y51",
      INIT => X"AF05FA50"
    )
    port map (
      ADR4 => booth_multiplier_onBoard_register_m_Q_temp(0),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      ADR0 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      O => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_counter_inst_reset_n_inv_pack_7,
      O => booth_multiplier_onBoard_counter_inst_reset_n_inv
    );
  booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_mux_Mmux_X11_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y52",
      INIT => X"3C33C3CC3333CCCC"
    )
    port map (
      ADR0 => '1',
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR1 => booth_multiplier_onBoard_register_m_Q_temp(3),
      ADR4 => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      O => N23
    );
  booth_multiplier_onBoard_control_unit_Mmux_subtract11 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y52",
      INIT => X"0F0F000000000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => booth_multiplier_onBoard_subtract
    );
  booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X10Y52",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_a,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      RST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND
    );
  booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y52",
      INIT => X"ACA3A3ACA3ACACA3"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_0_cell_mux2_1_sum_select_Mmux_X21_0,
      ADR3 => booth_multiplier_onBoard_register_m_Q_temp(1),
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      ADR4 => booth_multiplier_onBoard_subtract,
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_control_unit_current_n0035_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y52",
      INIT => X"FFF0F0F0FFF0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR5 => '1',
      O => booth_multiplier_onBoard_en_a
    );
  booth_multiplier_onBoard_counter_inst_reset_n_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y52",
      INIT => X"000F0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      O => booth_multiplier_onBoard_counter_inst_reset_n_inv_pack_7
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd2 : X_FF
    generic map(
      LOC => "SLICE_X10Y53",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd2_CLK,
      I => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_In,
      O => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_control_unit_current_FSM_FFd2_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y53",
      INIT => X"737350DC7373DC50"
    )
    port map (
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR3 => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      ADR5 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR0 => booth_multiplier_onBoard_counter_inst_count_hit_temp_1134,
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      O => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_In
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_adders_0_rippleCarry_adder_instance_rippleCarry_adder_2_f_adder_X_Y_XOR_26_o1 : 
X_LUT6
    generic map(
      LOC => "SLICE_X10Y53",
      INIT => X"0CF300FFF30CFF00"
    )
    port map (
      ADR0 => '1',
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR5 => booth_multiplier_onBoard_register_m_Q_temp(6),
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      O => 
booth_multiplier_onBoard_carrySelect_addSub_inst_carrySelect_adder_inst_cells_1_cell_adders_0_rippleCarry_adder_instance_rippleCarry_adder_2_f_adder_X_Y_XOR_26_o

    );
  booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y54",
      INIT => X"FAFAFAA0FAE8E8A0"
    )
    port map (
      ADR0 => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114,
      ADR3 => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      ADR1 => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      ADR2 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_6_Q,
      ADR4 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_5_Q,
      ADR5 => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_4_Q,
      O => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_mux_Mmux_X1
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_Mxor_internal_B_6_xo_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y54",
      INIT => X"F00FFF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => booth_multiplier_onBoard_register_m_Q_temp(6),
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_6_Q
    );
  booth_multiplier_onBoard_carrySelect_addSub_inst_Mxor_internal_B_5_xo_0_1 : X_LUT6
    generic map(
      LOC => "SLICE_X10Y55",
      INIT => X"F0F00FF0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_register_m_Q_temp(5),
      ADR4 => booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1132,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR5 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      O => booth_multiplier_onBoard_carrySelect_addSub_inst_internal_B_5_Q
    );
  value_int_15 : X_FF
    generic map(
      LOC => "SLICE_X10Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_15_CLK,
      I => NlwBufferSignal_value_int_15_IN,
      O => value_int_15_1202,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_14 : X_FF
    generic map(
      LOC => "SLICE_X10Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_14_CLK,
      I => NlwBufferSignal_value_int_14_IN,
      O => value_int_14_1082,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_13 : X_FF
    generic map(
      LOC => "SLICE_X10Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_13_CLK,
      I => NlwBufferSignal_value_int_13_IN,
      O => value_int_13_1072,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_12 : X_FF
    generic map(
      LOC => "SLICE_X10Y69",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_12_CLK,
      I => NlwBufferSignal_value_int_12_IN,
      O => value_int_12_1201,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_7_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X13Y51",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_7_LDC_CLK,
      I => '1',
      O => value_int_7_LDC_1245,
      RST => enable_b_internal_b_7_AND_24_o_0,
      SET => GND
    );
  value_int_71 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y51",
      INIT => X"CFCFC0C0CFCFC0C0"
    )
    port map (
      ADR0 => '1',
      ADR5 => '1',
      ADR3 => '1',
      ADR2 => value_int_7_LDC_1245,
      ADR4 => value_int_7_C_7_1211,
      ADR1 => value_int_7_P_7_1175,
      O => value_int_7
    );
  value_int_4_C_4 : X_FF
    generic map(
      LOC => "SLICE_X13Y52",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_4_C_4_CLK,
      I => NlwBufferSignal_value_int_4_C_4_IN,
      O => value_int_4_C_4_1171,
      RST => enable_b_internal_b_4_AND_30_o,
      SET => GND
    );
  value_int_6_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X13Y54",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_6_LDC_CLK,
      I => '1',
      O => value_int_6_LDC_1079,
      RST => enable_b_internal_b_6_AND_26_o_0,
      SET => GND
    );
  value_int_0_P_0 : X_FF
    generic map(
      LOC => "SLICE_X13Y57",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_0_P_0_CLK,
      I => NlwBufferSignal_value_int_0_P_0_IN,
      O => value_int_0_P_0_1216,
      SET => enable_b_internal_b_0_AND_37_o,
      RST => GND
    );
  value_int_5_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X13Y58",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_5_LDC_CLK,
      I => '1',
      O => value_int_5_LDC_1069,
      RST => enable_b_internal_b_5_AND_28_o_0,
      SET => GND
    );
  value_int_1_C_1 : X_FF
    generic map(
      LOC => "SLICE_X13Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_1_C_1_CLK,
      I => NlwBufferSignal_value_int_1_C_1_IN,
      O => value_int_1_C_1_1076,
      RST => enable_b_internal_b_1_AND_36_o_0,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1,
      O => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1173
    );
  booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X13Y71",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y71",
      INIT => X"F0F0FF00F0F0FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR3 => reg_a_Q_temp(0),
      ADR2 => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1173,
      ADR5 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT5
    generic map(
      LOC => "SLICE_X13Y71",
      INIT => X"AAAACCCC"
    )
    port map (
      ADR1 => reg_a_Q_temp(1),
      ADR0 => booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1186,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR3 => '1',
      ADR2 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X13Y71",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1,
      O => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1197
    );
  booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X13Y72",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1186,
      RST => GND,
      SET => GND
    );
  booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT6
    generic map(
      LOC => "SLICE_X13Y72",
      INIT => X"CCCCAAAACCCCAAAA"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR0 => reg_a_Q_temp(2),
      ADR1 => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1197,
      ADR5 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_mux_Mmux_X11 : X_LUT5
    generic map(
      LOC => "SLICE_X13Y72",
      INIT => X"FF00F0F0"
    )
    port map (
      ADR2 => reg_a_Q_temp(3),
      ADR3 => booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1172,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR0 => '1',
      ADR1 => '1',
      O => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_ff_input
    );
  booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp : X_FF
    generic map(
      LOC => "SLICE_X13Y72",
      INIT => '0'
    )
    port map (
      CE => booth_multiplier_onBoard_en_q,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK,
      I => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_ff_input,
      O => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_pack_1,
      RST => GND,
      SET => GND
    );
  value_int_2_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X13Y73",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_2_LDC_CLK,
      I => '1',
      O => value_int_2_LDC_1084,
      RST => enable_b_internal_b_2_AND_34_o_0,
      SET => GND
    );
  value_int_3_C_3 : X_FF
    generic map(
      LOC => "SLICE_X13Y74",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_3_C_3_CLK,
      I => NlwBufferSignal_value_int_3_C_3_IN,
      O => value_int_3_C_3_1225,
      RST => enable_b_internal_b_3_AND_32_o,
      SET => GND
    );
  value_int_3_P_3 : X_FF
    generic map(
      LOC => "SLICE_X13Y75",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_3_P_3_CLK,
      I => NlwBufferSignal_value_int_3_P_3_IN,
      O => value_int_3_P_3_1196,
      SET => enable_b_internal_b_3_AND_31_o,
      RST => GND
    );
  value_int_7_C_7 : X_FF
    generic map(
      LOC => "SLICE_X12Y51",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_7_C_7_CLK,
      I => NlwBufferSignal_value_int_7_C_7_IN,
      O => value_int_7_C_7_1211,
      RST => enable_b_internal_b_7_AND_24_o_0,
      SET => GND
    );
  value_int_6_C_6_value_int_6_C_6_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => value_int_6_C_6_862,
      O => value_int_6_C_6_0
    );
  value_int_6_C_6 : X_FF
    generic map(
      LOC => "SLICE_X12Y54",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_6_C_6_CLK,
      I => NlwBufferSignal_value_int_6_C_6_IN,
      O => value_int_6_C_6_862,
      RST => enable_b_internal_b_6_AND_26_o_0,
      SET => GND
    );
  value_int_6_P_6 : X_FF
    generic map(
      LOC => "SLICE_X12Y55",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_6_P_6_CLK,
      I => NlwBufferSignal_value_int_6_P_6_IN,
      O => value_int_6_P_6_1081,
      SET => enable_b_internal_b_6_AND_25_o,
      RST => GND
    );
  value_int_0_C_0 : X_FF
    generic map(
      LOC => "SLICE_X12Y56",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_0_C_0_CLK,
      I => NlwBufferSignal_value_int_0_C_0_IN,
      O => value_int_0_C_0_1191,
      RST => enable_b_internal_b_0_AND_38_o_0,
      SET => GND
    );
  value_int_0_LDC_value_int_0_LDC_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_874,
      O => stop_OBUF_0
    );
  booth_multiplier_onBoard_control_unit_current_n0035_1_1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y57",
      INIT => X"FF00FFF0FF00FFF0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR5 => '1',
      O => booth_multiplier_onBoard_en_q
    );
  booth_multiplier_onBoard_control_unit_current_n0035_0_1 : X_LUT5
    generic map(
      LOC => "SLICE_X12Y57",
      INIT => X"0000000F"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR4 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR3 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      O => stop_OBUF_874
    );
  value_int_0_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X12Y57",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_0_LDC_CLK,
      I => '1',
      O => value_int_0_LDC_1194,
      RST => enable_b_internal_b_0_AND_38_o_0,
      SET => GND
    );
  value_int_5_C_5_value_int_5_C_5_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => value_int_5_C_5_884,
      O => value_int_5_C_5_0
    );
  value_int_5_C_5 : X_FF
    generic map(
      LOC => "SLICE_X12Y58",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_5_C_5_CLK,
      I => NlwBufferSignal_value_int_5_C_5_IN,
      O => value_int_5_C_5_884,
      RST => enable_b_internal_b_5_AND_28_o_0,
      SET => GND
    );
  value_int_5_P_5_value_int_5_P_5_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => value_int_5_P_5_888,
      O => value_int_5_P_5_0
    );
  value_int_5_P_5 : X_FF
    generic map(
      LOC => "SLICE_X12Y59",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_5_P_5_CLK,
      I => NlwBufferSignal_value_int_5_P_5_IN,
      O => value_int_5_P_5_888,
      SET => enable_b_internal_b_5_AND_27_o,
      RST => GND
    );
  enable_b_internal_b_0_AND_37_o_enable_b_internal_b_0_AND_37_o_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_0_AND_38_o,
      O => enable_b_internal_b_0_AND_38_o_0
    );
  enable_b_internal_b_0_AND_37_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y60",
      INIT => X"FF008888FF008888"
    )
    port map (
      ADR2 => '1',
      ADR4 => enable_a_IBUF_1139,
      ADR3 => reg_a_Q_temp(0),
      ADR0 => reg_b_Q_temp(0),
      ADR1 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_0_AND_37_o
    );
  enable_b_internal_b_0_AND_38_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X12Y60",
      INIT => X"00FF4444"
    )
    port map (
      ADR2 => '1',
      ADR4 => enable_a_IBUF_1139,
      ADR3 => reg_a_Q_temp(0),
      ADR0 => reg_b_Q_temp(0),
      ADR1 => enable_b_IBUF_1166,
      O => enable_b_internal_b_0_AND_38_o
    );
  display_cathodes_instance_nibble_1_display_cathodes_instance_nibble_1_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_cathodes_instance_nibble(1),
      O => display_cathodes_instance_nibble_1_0
    );
  display_cathodes_instance_Mmux_nibble_1_1 : X_MUX2
    generic map(
      LOC => "SLICE_X12Y69"
    )
    port map (
      IA => N52,
      IB => N53,
      O => display_cathodes_instance_nibble(1),
      SEL => display_counter_mod4_COUNTS_temp(0)
    );
  display_cathodes_instance_Mmux_nibble_1_1_F : X_LUT6
    generic map(
      LOC => "SLICE_X12Y69",
      INIT => X"0000E2E20000F3C0"
    )
    port map (
      ADR4 => display_counter_mod4_COUNTS_temp(2),
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR5 => value_int_1_LDC_1075,
      ADR3 => value_int_1_C_1_1076,
      ADR0 => value_int_1_P_1_1077,
      ADR2 => value_int_9_1078,
      O => N52
    );
  display_cathodes_instance_Mmux_nibble_1_1_G : X_LUT6
    generic map(
      LOC => "SLICE_X12Y69",
      INIT => X"0000EFEC00002320"
    )
    port map (
      ADR4 => display_counter_mod4_COUNTS_temp(2),
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => value_int_5_LDC_1069,
      ADR3 => value_int_5_C_5_0,
      ADR0 => value_int_5_P_5_0,
      ADR5 => value_int_13_1072,
      O => N53
    );
  value_int_11 : X_FF
    generic map(
      LOC => "SLICE_X12Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_11_CLK,
      I => NlwBufferSignal_value_int_11_IN,
      O => value_int_11_1200,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_10 : X_FF
    generic map(
      LOC => "SLICE_X12Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_10_CLK,
      I => NlwBufferSignal_value_int_10_IN,
      O => value_int_10_1087,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_9 : X_FF
    generic map(
      LOC => "SLICE_X12Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_9_CLK,
      I => NlwBufferSignal_value_int_9_IN,
      O => value_int_9_1078,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_8 : X_FF
    generic map(
      LOC => "SLICE_X12Y70",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_8_CLK,
      I => NlwBufferSignal_value_int_8_IN,
      O => value_int_8_1206,
      RST => enable_b_enable_a_OR_52_o,
      SET => GND
    );
  value_int_1_P_1_value_int_1_P_1_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_cathodes_instance_nibble(2),
      O => display_cathodes_instance_nibble_2_0
    );
  display_cathodes_instance_Mmux_nibble_2_1 : X_MUX2
    generic map(
      LOC => "SLICE_X12Y71"
    )
    port map (
      IA => N54,
      IB => N55,
      O => display_cathodes_instance_nibble(2),
      SEL => display_counter_mod4_COUNTS_temp(0)
    );
  display_cathodes_instance_Mmux_nibble_2_1_F : X_LUT6
    generic map(
      LOC => "SLICE_X12Y71",
      INIT => X"0C0F0C0A0C050C00"
    )
    port map (
      ADR2 => display_counter_mod4_COUNTS_temp(2),
      ADR3 => display_counter_mod4_COUNTS_temp(1),
      ADR0 => value_int_2_LDC_1084,
      ADR4 => value_int_2_C_2_1085,
      ADR5 => value_int_2_P_2_0,
      ADR1 => value_int_10_1087,
      O => N54
    );
  display_cathodes_instance_Mmux_nibble_2_1_G : X_LUT6
    generic map(
      LOC => "SLICE_X12Y71",
      INIT => X"3322333000220030"
    )
    port map (
      ADR1 => display_counter_mod4_COUNTS_temp(2),
      ADR3 => display_counter_mod4_COUNTS_temp(1),
      ADR4 => value_int_6_LDC_1079,
      ADR2 => value_int_6_C_6_0,
      ADR0 => value_int_6_P_6_1081,
      ADR5 => value_int_14_1082,
      O => N55
    );
  value_int_1_P_1 : X_FF
    generic map(
      LOC => "SLICE_X12Y71",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_1_P_1_CLK,
      I => NlwBufferSignal_value_int_1_P_1_IN,
      O => value_int_1_P_1_1077,
      SET => enable_b_internal_b_1_AND_35_o,
      RST => GND
    );
  display_cathodes_instance_Mmux_nibble_3_1_SW1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y72",
      INIT => X"0C3F1D1D0C3F1D1D"
    )
    port map (
      ADR5 => '1',
      ADR1 => display_counter_mod4_COUNTS_temp(1),
      ADR4 => value_int_3_LDC_1224,
      ADR3 => value_int_3_P_3_1196,
      ADR0 => value_int_3_C_3_1225,
      ADR2 => value_int_11_1200,
      O => N50
    );
  display_cathodes_instance_Mmux_nibble_3_1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y72",
      INIT => X"2022200031333111"
    )
    port map (
      ADR1 => display_counter_mod4_COUNTS_temp(2),
      ADR0 => display_counter_mod4_COUNTS_temp(0),
      ADR4 => value_int_7,
      ADR3 => display_counter_mod4_COUNTS_temp(1),
      ADR2 => value_int_15_1202,
      ADR5 => N50,
      O => display_cathodes_instance_nibble(3)
    );
  value_int_1_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X12Y72",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_1_LDC_CLK,
      I => '1',
      O => value_int_1_LDC_1075,
      RST => enable_b_internal_b_1_AND_36_o_0,
      SET => GND
    );
  enable_b_internal_b_2_AND_33_o_enable_b_internal_b_2_AND_33_o_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => value_int_2_P_2_962,
      O => value_int_2_P_2_0
    );
  enable_b_internal_b_2_AND_33_o_enable_b_internal_b_2_AND_33_o_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_2_AND_34_o,
      O => enable_b_internal_b_2_AND_34_o_0
    );
  value_int_2_P_2 : X_FF
    generic map(
      LOC => "SLICE_X12Y73",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_2_P_2_CLK,
      I => NlwBufferSignal_value_int_2_P_2_IN,
      O => value_int_2_P_2_962,
      SET => enable_b_internal_b_2_AND_33_o,
      RST => GND
    );
  enable_b_internal_b_2_AND_33_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y73",
      INIT => X"CCAACC00CCAACC00"
    )
    port map (
      ADR2 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR1 => reg_a_Q_temp(2),
      ADR0 => reg_b_Q_temp(2),
      ADR4 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_2_AND_33_o
    );
  enable_b_internal_b_2_AND_34_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X12Y73",
      INIT => X"33553300"
    )
    port map (
      ADR2 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR1 => reg_a_Q_temp(2),
      ADR0 => reg_b_Q_temp(2),
      ADR4 => enable_b_IBUF_1166,
      O => enable_b_internal_b_2_AND_34_o
    );
  value_int_3_LDC_value_int_3_LDC_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_3_AND_32_o_pack_1,
      O => enable_b_internal_b_3_AND_32_o
    );
  value_int_3_LDC : X_LATCHE
    generic map(
      LOC => "SLICE_X12Y74",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_value_int_3_LDC_CLK,
      I => '1',
      O => value_int_3_LDC_1224,
      RST => enable_b_internal_b_3_AND_32_o,
      SET => GND
    );
  enable_b_internal_b_3_AND_31_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y74",
      INIT => X"AACCAA00AACCAA00"
    )
    port map (
      ADR2 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR0 => reg_a_Q_temp(3),
      ADR4 => reg_b_Q_temp(3),
      ADR1 => enable_b_IBUF_1166,
      ADR5 => '1',
      O => enable_b_internal_b_3_AND_31_o
    );
  enable_b_internal_b_3_AND_32_o1 : X_LUT5
    generic map(
      LOC => "SLICE_X12Y74",
      INIT => X"550055CC"
    )
    port map (
      ADR2 => '1',
      ADR3 => enable_a_IBUF_1139,
      ADR0 => reg_a_Q_temp(3),
      ADR4 => reg_b_Q_temp(3),
      ADR1 => enable_b_IBUF_1166,
      O => enable_b_internal_b_3_AND_32_o_pack_1
    );
  value_int_2_C_2 : X_FF
    generic map(
      LOC => "SLICE_X15Y72",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_value_int_2_C_2_CLK,
      I => NlwBufferSignal_value_int_2_C_2_IN,
      O => value_int_2_C_2_1085,
      RST => enable_b_internal_b_2_AND_34_o_0,
      SET => GND
    );
  booth_multiplier_onBoard_counter_inst_count_hit_temp : X_SFF
    generic map(
      LOC => "SLICE_X30Y56",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_hit_temp_CLK,
      I => booth_multiplier_onBoard_counter_inst_count_hit_temp_PWR_32_o_MUX_57_o,
      O => booth_multiplier_onBoard_counter_inst_count_hit_temp_1134,
      SRST => booth_multiplier_onBoard_counter_inst_reset_n_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  enable_b_enable_a_OR_52_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X30Y56",
      INIT => X"EEEEEEEEEEEEEEEE"
    )
    port map (
      ADR3 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR0 => enable_b_IBUF_1166,
      ADR1 => enable_a_IBUF_1139,
      ADR5 => '1',
      O => enable_b_enable_a_OR_52_o
    );
  booth_multiplier_onBoard_counter_inst_count_hit_temp_PWR_32_o_MUX_57_o_2_1 : X_LUT5
    generic map(
      LOC => "SLICE_X30Y56",
      INIT => X"F0000000"
    )
    port map (
      ADR4 => booth_multiplier_onBoard_counter_inst_count_counter(2),
      ADR2 => booth_multiplier_onBoard_counter_inst_count_counter(1),
      ADR3 => booth_multiplier_onBoard_counter_inst_count_counter(0),
      ADR1 => '1',
      ADR0 => '1',
      O => booth_multiplier_onBoard_counter_inst_count_hit_temp_PWR_32_o_MUX_57_o
    );
  booth_multiplier_onBoard_counter_inst_Mcount_count_counter_val1 : X_LUT6
    generic map(
      LOC => "SLICE_X32Y56",
      INIT => X"FF02020202020202"
    )
    port map (
      ADR2 => booth_multiplier_onBoard_control_unit_current_FSM_FFd1_1115,
      ADR1 => booth_multiplier_onBoard_control_unit_current_FSM_FFd2_1133,
      ADR0 => booth_multiplier_onBoard_control_unit_current_FSM_FFd3_1130,
      ADR3 => booth_multiplier_onBoard_counter_inst_count_counter(1),
      ADR5 => booth_multiplier_onBoard_counter_inst_count_counter(2),
      ADR4 => booth_multiplier_onBoard_counter_inst_count_counter(0),
      O => booth_multiplier_onBoard_counter_inst_Mcount_count_counter_val
    );
  booth_multiplier_onBoard_counter_inst_count_counter_1_booth_multiplier_onBoard_counter_inst_count_counter_1_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_counter_inst_count_counter_2_pack_3,
      O => booth_multiplier_onBoard_counter_inst_count_counter(2)
    );
  booth_multiplier_onBoard_counter_inst_count_counter_1 : X_SFF
    generic map(
      LOC => "SLICE_X33Y56",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_1_CLK,
      I => Result_1_1,
      O => booth_multiplier_onBoard_counter_inst_count_counter(1),
      SRST => booth_multiplier_onBoard_counter_inst_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  booth_multiplier_onBoard_counter_inst_Mcount_count_counter_xor_1_11 : X_LUT6
    generic map(
      LOC => "SLICE_X33Y56",
      INIT => X"0F0FF0F00F0FF0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => booth_multiplier_onBoard_counter_inst_count_counter(1),
      ADR2 => booth_multiplier_onBoard_counter_inst_count_counter(0),
      ADR5 => '1',
      O => Result_1_1
    );
  booth_multiplier_onBoard_counter_inst_Mcount_count_counter_xor_2_11 : X_LUT5
    generic map(
      LOC => "SLICE_X33Y56",
      INIT => X"0FF0FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => booth_multiplier_onBoard_counter_inst_count_counter(2),
      ADR4 => booth_multiplier_onBoard_counter_inst_count_counter(1),
      ADR2 => booth_multiplier_onBoard_counter_inst_count_counter(0),
      O => Result_2_1
    );
  booth_multiplier_onBoard_counter_inst_count_counter_2 : X_SFF
    generic map(
      LOC => "SLICE_X33Y56",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_2_CLK,
      I => Result_2_1,
      O => booth_multiplier_onBoard_counter_inst_count_counter_2_pack_3,
      SRST => booth_multiplier_onBoard_counter_inst_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  booth_multiplier_onBoard_counter_inst_count_counter_0 : X_SFF
    generic map(
      LOC => "SLICE_X33Y56",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_0_CLK,
      I => Result_0_1,
      O => booth_multiplier_onBoard_counter_inst_count_counter(0),
      SRST => booth_multiplier_onBoard_counter_inst_Mcount_count_counter_val,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  booth_multiplier_onBoard_counter_inst_Mcount_count_counter_xor_0_11_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X33Y56",
      INIT => X"00000000FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => booth_multiplier_onBoard_counter_inst_count_counter(0),
      ADR4 => '1',
      ADR3 => '1',
      O => Result_0_1
    );
  NlwBufferBlock_stop_OBUF_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_0,
      O => NlwBufferSignal_stop_OBUF_BUFG_IN
    );
  NlwBufferBlock_clock_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP_IBUFG_1049,
      O => NlwBufferSignal_clock_BUFGP_BUFG_IN
    );
  NlwBufferBlock_stop_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_0,
      O => NlwBufferSignal_stop_OBUF_I
    );
  NlwBufferBlock_start_led_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => start_led_OBUF_1135,
      O => NlwBufferSignal_start_led_OBUF_I
    );
  NlwBufferBlock_cathodes_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_0_OBUF_1222,
      O => NlwBufferSignal_cathodes_0_OBUF_I
    );
  NlwBufferBlock_anodes_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => anodes_0_OBUF_1231,
      O => NlwBufferSignal_anodes_0_OBUF_I
    );
  NlwBufferBlock_cathodes_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_1_OBUF_1218,
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
      I => anodes_2_OBUF_1233,
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
  NlwBufferBlock_cathodes_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_5_OBUF_1226,
      O => NlwBufferSignal_cathodes_5_OBUF_I
    );
  NlwBufferBlock_cathodes_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cathodes_6_OBUF_1229,
      O => NlwBufferSignal_cathodes_6_OBUF_I
    );
  NlwBufferBlock_reg_a_Q_temp_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_7_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_7_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_7_IBUF_1165,
      O => NlwBufferSignal_reg_a_Q_temp_7_IN
    );
  NlwBufferBlock_reg_a_Q_temp_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_6_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_6_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_6_IBUF_1163,
      O => NlwBufferSignal_reg_a_Q_temp_6_IN
    );
  NlwBufferBlock_reg_a_Q_temp_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_5_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_5_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_5_IBUF_1159,
      O => NlwBufferSignal_reg_a_Q_temp_5_IN
    );
  NlwBufferBlock_reg_a_Q_temp_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_4_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_4_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_4_IBUF_1155,
      O => NlwBufferSignal_reg_a_Q_temp_4_IN
    );
  NlwBufferBlock_value_int_7_P_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_7_P_7_CLK
    );
  NlwBufferBlock_value_int_7_P_7_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_1176,
      O => NlwBufferSignal_value_int_7_P_7_IN
    );
  NlwBufferBlock_value_int_4_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_4_AND_29_o,
      O => NlwBufferSignal_value_int_4_LDC_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_7_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_7_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_7_IBUF_1165,
      O => NlwBufferSignal_reg_b_Q_temp_7_IN
    );
  NlwBufferBlock_reg_b_Q_temp_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_6_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_6_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_6_IBUF_1163,
      O => NlwBufferSignal_reg_b_Q_temp_6_IN
    );
  NlwBufferBlock_reg_b_Q_temp_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_5_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_5_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_5_IBUF_1159,
      O => NlwBufferSignal_reg_b_Q_temp_5_IN
    );
  NlwBufferBlock_reg_b_Q_temp_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_4_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_4_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_4_IBUF_1155,
      O => NlwBufferSignal_reg_b_Q_temp_4_IN
    );
  NlwBufferBlock_reg_b_Q_temp_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_3_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_3_IBUF_1151,
      O => NlwBufferSignal_reg_b_Q_temp_3_IN
    );
  NlwBufferBlock_reg_b_Q_temp_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_2_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_2_IBUF_1147,
      O => NlwBufferSignal_reg_b_Q_temp_2_IN
    );
  NlwBufferBlock_reg_b_Q_temp_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_1_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_1_IBUF_1144,
      O => NlwBufferSignal_reg_b_Q_temp_1_IN
    );
  NlwBufferBlock_reg_b_Q_temp_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_b_Q_temp_0_CLK
    );
  NlwBufferBlock_reg_b_Q_temp_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_0_IBUF_1141,
      O => NlwBufferSignal_reg_b_Q_temp_0_IN
    );
  NlwBufferBlock_display_counter_mod4_COUNTS_temp_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_out_temp_1129,
      O => NlwBufferSignal_display_counter_mod4_COUNTS_temp_2_CLK
    );
  NlwBufferBlock_display_counter_mod4_COUNTS_temp_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_out_temp_1129,
      O => NlwBufferSignal_display_counter_mod4_COUNTS_temp_1_CLK
    );
  NlwBufferBlock_display_counter_mod4_COUNTS_temp_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => display_clock_divisor_instance_clock_out_temp_1129,
      O => NlwBufferSignal_display_counter_mod4_COUNTS_temp_0_CLK
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
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_13_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_13_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_2_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(2),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_2_IN
    );
  NlwBufferBlock_value_int_4_P_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_4_P_4_CLK
    );
  NlwBufferBlock_value_int_4_P_4_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1172,
      O => NlwBufferSignal_value_int_4_P_4_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_7_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_7_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(7),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_7_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_6_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_6_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(6),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_6_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_4_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_4_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(4),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_4_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_5_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_5_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(5),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_5_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_3_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_3_IBUF_1151,
      O => NlwBufferSignal_reg_a_Q_temp_3_IN
    );
  NlwBufferBlock_reg_a_Q_temp_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_2_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_2_IBUF_1147,
      O => NlwBufferSignal_reg_a_Q_temp_2_IN
    );
  NlwBufferBlock_reg_a_Q_temp_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_1_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_1_IBUF_1144,
      O => NlwBufferSignal_reg_a_Q_temp_1_IN
    );
  NlwBufferBlock_reg_a_Q_temp_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_reg_a_Q_temp_0_CLK
    );
  NlwBufferBlock_reg_a_Q_temp_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => input_0_IBUF_1141,
      O => NlwBufferSignal_reg_a_Q_temp_0_IN
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_4_CLK
    );
  NlwBufferBlock_display_clock_divisor_instance_clock_division_counter_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_display_clock_divisor_instance_clock_division_counter_1_CLK
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
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_3_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(3),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_3_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_1_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(1),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_1_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_0_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_m_Q_temp_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => reg_b_Q_temp(0),
      O => NlwBufferSignal_booth_multiplier_onBoard_register_m_Q_temp_0_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_control_unit_current_FSM_FFd1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd1_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_control_unit_current_FSM_FFd3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd3_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_control_unit_current_FSM_FFd2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_control_unit_current_FSM_FFd2_CLK
    );
  NlwBufferBlock_value_int_15_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_15_CLK
    );
  NlwBufferBlock_value_int_15_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1122,
      O => NlwBufferSignal_value_int_15_IN
    );
  NlwBufferBlock_value_int_14_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_14_CLK
    );
  NlwBufferBlock_value_int_14_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1114,
      O => NlwBufferSignal_value_int_14_IN
    );
  NlwBufferBlock_value_int_13_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_13_CLK
    );
  NlwBufferBlock_value_int_13_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1118,
      O => NlwBufferSignal_value_int_13_IN
    );
  NlwBufferBlock_value_int_12_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_12_CLK
    );
  NlwBufferBlock_value_int_12_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1061,
      O => NlwBufferSignal_value_int_12_IN
    );
  NlwBufferBlock_value_int_7_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_7_AND_23_o,
      O => NlwBufferSignal_value_int_7_LDC_CLK
    );
  NlwBufferBlock_value_int_4_C_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_4_C_4_CLK
    );
  NlwBufferBlock_value_int_4_C_4_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_5_shift_reg_right_flipflop_flipflop_d_q_temp_1172,
      O => NlwBufferSignal_value_int_4_C_4_IN
    );
  NlwBufferBlock_value_int_6_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_6_AND_25_o,
      O => NlwBufferSignal_value_int_6_LDC_CLK
    );
  NlwBufferBlock_value_int_0_P_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_0_P_0_CLK
    );
  NlwBufferBlock_value_int_0_P_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      O => NlwBufferSignal_value_int_0_P_0_IN
    );
  NlwBufferBlock_value_int_5_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_5_AND_27_o,
      O => NlwBufferSignal_value_int_5_LDC_CLK
    );
  NlwBufferBlock_value_int_1_C_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_1_C_1_CLK
    );
  NlwBufferBlock_value_int_1_C_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1173,
      O => NlwBufferSignal_value_int_1_C_1_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clock_BUFGP,
      O => NlwBufferSignal_booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_CLK
    );
  NlwBufferBlock_value_int_2_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_2_AND_33_o,
      O => NlwBufferSignal_value_int_2_LDC_CLK
    );
  NlwBufferBlock_value_int_3_C_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_3_C_3_CLK
    );
  NlwBufferBlock_value_int_3_C_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1197,
      O => NlwBufferSignal_value_int_3_C_3_IN
    );
  NlwBufferBlock_value_int_3_P_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_3_P_3_CLK
    );
  NlwBufferBlock_value_int_3_P_3_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_4_shift_reg_right_flipflop_flipflop_d_q_temp_1197,
      O => NlwBufferSignal_value_int_3_P_3_IN
    );
  NlwBufferBlock_value_int_7_C_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_7_C_7_CLK
    );
  NlwBufferBlock_value_int_7_C_7_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_8_shift_reg_right_flipflop_flipflop_d_q_temp_1176,
      O => NlwBufferSignal_value_int_7_C_7_IN
    );
  NlwBufferBlock_value_int_6_C_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_6_C_6_CLK
    );
  NlwBufferBlock_value_int_6_C_6_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1195,
      O => NlwBufferSignal_value_int_6_C_6_IN
    );
  NlwBufferBlock_value_int_6_P_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_6_P_6_CLK
    );
  NlwBufferBlock_value_int_6_P_6_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_7_shift_reg_right_flipflop_flipflop_d_q_temp_1195,
      O => NlwBufferSignal_value_int_6_P_6_IN
    );
  NlwBufferBlock_value_int_0_C_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_0_C_0_CLK
    );
  NlwBufferBlock_value_int_0_C_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1131,
      O => NlwBufferSignal_value_int_0_C_0_IN
    );
  NlwBufferBlock_value_int_0_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_0_AND_37_o,
      O => NlwBufferSignal_value_int_0_LDC_CLK
    );
  NlwBufferBlock_value_int_5_C_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_5_C_5_CLK
    );
  NlwBufferBlock_value_int_5_C_5_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1185,
      O => NlwBufferSignal_value_int_5_C_5_IN
    );
  NlwBufferBlock_value_int_5_P_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_5_P_5_CLK
    );
  NlwBufferBlock_value_int_5_P_5_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_6_shift_reg_right_flipflop_flipflop_d_q_temp_1185,
      O => NlwBufferSignal_value_int_5_P_5_IN
    );
  NlwBufferBlock_value_int_11_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_11_CLK
    );
  NlwBufferBlock_value_int_11_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1055,
      O => NlwBufferSignal_value_int_11_IN
    );
  NlwBufferBlock_value_int_10_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_10_CLK
    );
  NlwBufferBlock_value_int_10_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1056,
      O => NlwBufferSignal_value_int_10_IN
    );
  NlwBufferBlock_value_int_9_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_9_CLK
    );
  NlwBufferBlock_value_int_9_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_1_shift_reg_right_flipflop_flipflop_d_q_temp_1052,
      O => NlwBufferSignal_value_int_9_IN
    );
  NlwBufferBlock_value_int_8_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_8_CLK
    );
  NlwBufferBlock_value_int_8_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_a_shift_reg_0_shift_reg_right_flipflop_flipflop_d_q_temp_1053,
      O => NlwBufferSignal_value_int_8_IN
    );
  NlwBufferBlock_value_int_1_P_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_1_P_1_CLK
    );
  NlwBufferBlock_value_int_1_P_1_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_2_shift_reg_right_flipflop_flipflop_d_q_temp_1173,
      O => NlwBufferSignal_value_int_1_P_1_IN
    );
  NlwBufferBlock_value_int_1_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_1_AND_35_o,
      O => NlwBufferSignal_value_int_1_LDC_CLK
    );
  NlwBufferBlock_value_int_2_P_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_2_P_2_CLK
    );
  NlwBufferBlock_value_int_2_P_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1186,
      O => NlwBufferSignal_value_int_2_P_2_IN
    );
  NlwBufferBlock_value_int_3_LDC_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => enable_b_internal_b_3_AND_31_o,
      O => NlwBufferSignal_value_int_3_LDC_CLK
    );
  NlwBufferBlock_value_int_2_C_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => stop_OBUF_BUFG_1048,
      O => NlwBufferSignal_value_int_2_C_2_CLK
    );
  NlwBufferBlock_value_int_2_C_2_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_register_q_shift_reg_3_shift_reg_right_flipflop_flipflop_d_q_temp_1186,
      O => NlwBufferSignal_value_int_2_C_2_IN
    );
  NlwBufferBlock_booth_multiplier_onBoard_counter_inst_count_hit_temp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_count_up,
      O => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_hit_temp_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_counter_inst_count_counter_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_count_up,
      O => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_1_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_counter_inst_count_counter_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_count_up,
      O => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_2_CLK
    );
  NlwBufferBlock_booth_multiplier_onBoard_counter_inst_count_counter_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => booth_multiplier_onBoard_count_up,
      O => NlwBufferSignal_booth_multiplier_onBoard_counter_inst_count_counter_0_CLK
    );
  NlwBlock_booth_multiplier_onBoard_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_booth_multiplier_onBoard_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

