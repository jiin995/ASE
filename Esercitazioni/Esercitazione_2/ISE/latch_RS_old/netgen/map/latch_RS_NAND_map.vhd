--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_RS_NAND_map.vhd
-- /___/   /\     Timestamp: Mon Jan 21 20:55:29 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 1 -pcf latch_RS_NAND.pcf -rpw 100 -tpw 0 -ar Structure -tm latch_RS_NAND -w -dir netgen/map -ofmt vhdl -sim latch_RS_NAND_map.ncd latch_RS_NAND_map.vhd 
-- Device	: 7a100tcsg324-1 (PRODUCTION 1.10 2013-10-13)
-- Input file	: latch_RS_NAND_map.ncd
-- Output file	: /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS/netgen/map/latch_RS_NAND_map.vhd
-- # of Entities	: 1
-- Design Name	: latch_RS_NAND
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

entity latch_RS_NAND is
  port (
    R : in STD_LOGIC := 'X'; 
    S : in STD_LOGIC := 'X'; 
    NQ : out STD_LOGIC; 
    Q : out STD_LOGIC 
  );
end latch_RS_NAND;

architecture Structure of latch_RS_NAND is
  signal NQ_OBUF_20 : STD_LOGIC; 
  signal Q_OBUF_21 : STD_LOGIC; 
  signal R_IBUF_22 : STD_LOGIC; 
  signal S_IBUF_23 : STD_LOGIC; 
  signal ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal S_ProtoComp1_INTERMDISABLE_GND_0 : STD_LOGIC; 
begin
  NQ_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      I => NQ_OBUF_20,
      O => NQ
    );
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y147"
    )
    port map (
      I => Q_OBUF_21,
      O => Q
    );
  ProtoComp1_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X0Y146"
    )
    port map (
      O => ProtoComp1_INTERMDISABLE_GND_0
    );
  R_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y146"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp1_INTERMDISABLE_GND_0,
      O => R_IBUF_22,
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
      O => S_IBUF_23,
      I => S,
      TPWRGT => '1'
    );
  XLXI_3 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y146",
      INIT => X"0000FFFFFFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => R_IBUF_22,
      ADR5 => Q_OBUF_21,
      O => NQ_OBUF_20
    );
  XLXI_2 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => X"0000FFFFFFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => NQ_OBUF_20,
      ADR5 => S_IBUF_23,
      O => Q_OBUF_21
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

