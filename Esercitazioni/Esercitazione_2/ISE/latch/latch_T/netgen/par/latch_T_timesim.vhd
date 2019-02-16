--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_T_timesim.vhd
-- /___/   /\     Timestamp: Sat Feb  9 18:15:12 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf latch_T.pcf -rpw 100 -tpw 0 -ar Structure -tm latch_T -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim latch_T.ncd latch_T_timesim.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
-- Input file	: latch_T.ncd
-- Output file	: /home/simone/Scrivania/latch_T/netgen/par/latch_T_timesim.vhd
-- # of Entities	: 1
-- Design Name	: latch_T
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

entity latch_T is
  port (
    en : in STD_LOGIC := 'X'; 
    T : in STD_LOGIC := 'X'; 
    Q : out STD_LOGIC; 
    QN : out STD_LOGIC 
  );
end latch_T;

architecture Structure of latch_T is
  signal en_IBUF_21 : STD_LOGIC; 
  signal QN_OBUF_22 : STD_LOGIC; 
  signal Qtemp_23 : STD_LOGIC; 
  signal T_IBUF_24 : STD_LOGIC; 
  signal T_T_AND_3_o : STD_LOGIC; 
  signal ProtoComp0_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal T_ProtoComp0_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal NlwBufferSignal_QN_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Q_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Qtemp_CLK : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
begin
  ProtoComp0_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X0Y149"
    )
    port map (
      O => ProtoComp0_INTERMDISABLE_GND_0
    );
  en_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y149"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp0_INTERMDISABLE_GND_0,
      O => en_IBUF_21,
      I => en,
      TPWRGT => '1'
    );
  QN_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      I => NlwBufferSignal_QN_OBUF_I,
      O => QN
    );
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y146"
    )
    port map (
      I => NlwBufferSignal_Q_OBUF_I,
      O => Q
    );
  ProtoComp0_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X0Y147"
    )
    port map (
      O => T_ProtoComp0_INTERMDISABLE_GND_0
    );
  T_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y147"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => T_ProtoComp0_INTERMDISABLE_GND_0,
      O => T_IBUF_24,
      I => T,
      TPWRGT => '1'
    );
  T_T_AND_3_o1 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => X"8888888888888888"
    )
    port map (
      ADR4 => '1',
      ADR5 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => T_IBUF_24,
      ADR1 => en_IBUF_21,
      O => T_T_AND_3_o
    );
  Qtemp : X_LATCHE
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => NlwBufferSignal_Qtemp_CLK,
      I => QN_OBUF_22,
      O => Qtemp_23,
      RST => GND,
      SET => GND
    );
  QN1_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => X"00000000FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => Qtemp_23,
      ADR4 => '1',
      ADR3 => '1',
      O => QN_OBUF_22
    );
  NlwBufferBlock_QN_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => QN_OBUF_22,
      O => NlwBufferSignal_QN_OBUF_I
    );
  NlwBufferBlock_Q_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Qtemp_23,
      O => NlwBufferSignal_Q_OBUF_I
    );
  NlwBufferBlock_Qtemp_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => T_T_AND_3_o,
      O => NlwBufferSignal_Qtemp_CLK
    );
  NlwBlock_latch_T_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_latch_T_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

