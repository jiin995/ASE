--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_RS_NOR_timesim.vhd
-- /___/   /\     Timestamp: Mon Jan 21 21:34:28 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 1 -pcf latch_RS_NOR.pcf -rpw 100 -tpw 0 -ar Structure -tm latch_RS_NOR -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim latch_RS_NOR.ncd latch_RS_NOR_timesim.vhd 
-- Device	: 7a100tcsg324-1 (PRODUCTION 1.10 2013-10-13)
-- Input file	: latch_RS_NOR.ncd
-- Output file	: /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS/netgen/par/latch_RS_NOR_timesim.vhd
-- # of Entities	: 1
-- Design Name	: latch_RS_NOR
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

entity latch_RS_NOR is
  port (
    R : in STD_LOGIC := 'X'; 
    S : in STD_LOGIC := 'X'; 
    NQ : out STD_LOGIC; 
    Q : out STD_LOGIC 
  );
end latch_RS_NOR;

architecture Structure of latch_RS_NOR is
  signal NQ_OBUF_18 : STD_LOGIC; 
  signal Q_OBUF_19 : STD_LOGIC; 
  signal R_IBUF_20 : STD_LOGIC; 
  signal S_IBUF_21 : STD_LOGIC; 
  signal NlwBufferSignal_NQ_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Q_OBUF_I : STD_LOGIC; 
begin
  NQ_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y102"
    )
    port map (
      I => NlwBufferSignal_NQ_OBUF_I,
      O => NQ
    );
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y114"
    )
    port map (
      I => NlwBufferSignal_Q_OBUF_I,
      O => Q
    );
  R_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y101",
      PATHPULSE => 50 ps
    )
    port map (
      O => R_IBUF_20,
      I => R
    );
  S_IBUF : X_BUF
    generic map(
      LOC => "IOB_X0Y93",
      PATHPULSE => 50 ps
    )
    port map (
      O => S_IBUF_21,
      I => S
    );
  XLXI_2 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y101",
      INIT => X"0055005500550055"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => '1',
      ADR0 => R_IBUF_20,
      ADR3 => NQ_OBUF_18,
      O => Q_OBUF_19
    );
  XLXI_1 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y101",
      INIT => X"1111111111111111"
    )
    port map (
      ADR4 => '1',
      ADR5 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => Q_OBUF_19,
      ADR1 => S_IBUF_21,
      O => NQ_OBUF_18
    );
  NlwBufferBlock_NQ_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => NQ_OBUF_18,
      O => NlwBufferSignal_NQ_OBUF_I
    );
  NlwBufferBlock_Q_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Q_OBUF_19,
      O => NlwBufferSignal_Q_OBUF_I
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

