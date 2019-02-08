--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: FlipFlop_RS_MasterSlave_map.vhd
-- /___/   /\     Timestamp: Fri Feb  8 17:31:06 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf FlipFlop_RS_MasterSlave.pcf -rpw 100 -tpw 0 -ar Structure -tm FlipFlop_RS_MasterSlave -w -dir netgen/map -ofmt vhdl -sim FlipFlop_RS_MasterSlave_map.ncd FlipFlop_RS_MasterSlave_map.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
-- Input file	: FlipFlop_RS_MasterSlave_map.ncd
-- Output file	: /home/simone/Scrivania/ASE/Esercitazioni/Esercitazione_2/ISE/FlipFlop_RS_MasterSlave/netgen/map/FlipFlop_RS_MasterSlave_map.vhd
-- # of Entities	: 1
-- Design Name	: FlipFlop_RS_MasterSlave
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

entity FlipFlop_RS_MasterSlave is
  port (
    CLK : in STD_LOGIC := 'X'; 
    R : in STD_LOGIC := 'X'; 
    S : in STD_LOGIC := 'X'; 
    NQ : out STD_LOGIC; 
    Q : out STD_LOGIC 
  );
end FlipFlop_RS_MasterSlave;

architecture Structure of FlipFlop_RS_MasterSlave is
  signal NQ_OBUF_34 : STD_LOGIC; 
  signal Q_OBUF_35 : STD_LOGIC; 
  signal R_IBUF_36 : STD_LOGIC; 
  signal S_IBUF_37 : STD_LOGIC; 
  signal CLK_IBUF_38 : STD_LOGIC; 
  signal XLXN_13 : STD_LOGIC; 
  signal XLXN_14 : STD_LOGIC; 
  signal ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal S_ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal CLK_ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
begin
  NQ_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y146"
    )
    port map (
      I => NQ_OBUF_34,
      O => NQ
    );
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y145"
    )
    port map (
      I => Q_OBUF_35,
      O => Q
    );
  ProtoComp1_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X0Y147"
    )
    port map (
      O => ProtoComp1_INTERMDISABLE_GND_0
    );
  R_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y147"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp1_INTERMDISABLE_GND_0,
      O => R_IBUF_36,
      I => R,
      TPWRGT => '1'
    );
  ProtoComp1_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X0Y149"
    )
    port map (
      O => S_ProtoComp1_INTERMDISABLE_GND_0
    );
  S_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y149"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => S_ProtoComp1_INTERMDISABLE_GND_0,
      O => S_IBUF_37,
      I => S,
      TPWRGT => '1'
    );
  ProtoComp1_INTERMDISABLE_GND_2 : X_ZERO
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      O => CLK_ProtoComp1_INTERMDISABLE_GND_0
    );
  CLK_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => CLK_ProtoComp1_INTERMDISABLE_GND_0,
      O => CLK_IBUF_38,
      I => CLK,
      TPWRGT => '1'
    );
  XLXI_5 : X_LUT6
    generic map(
      LOC => "SLICE_X1Y147",
      INIT => X"000000FF00FF00FF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => XLXN_14,
      ADR4 => CLK_IBUF_38,
      ADR5 => R_IBUF_36,
      O => XLXN_13
    );
  XLXI_8 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y146",
      INIT => X"00FF00FF000000FF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => NQ_OBUF_34,
      ADR4 => XLXN_14,
      ADR5 => CLK_IBUF_38,
      O => Q_OBUF_35
    );
  XLXI_7 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y146",
      INIT => X"00FF000000FF00FF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => Q_OBUF_35,
      ADR4 => CLK_IBUF_38,
      ADR5 => XLXN_13,
      O => NQ_OBUF_34
    );
  XLXI_6 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => X"000000FF00FF00FF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => XLXN_13,
      ADR4 => S_IBUF_37,
      ADR5 => CLK_IBUF_38,
      O => XLXN_14
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

