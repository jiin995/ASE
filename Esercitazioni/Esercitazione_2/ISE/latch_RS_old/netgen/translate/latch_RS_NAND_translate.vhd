--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_RS_NAND_translate.vhd
-- /___/   /\     Timestamp: Mon Jan 21 21:00:12 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm latch_RS_NAND -w -dir netgen/translate -ofmt vhdl -sim latch_RS_NAND.ngd latch_RS_NAND_translate.vhd 
-- Device	: 7a100tcsg324-1
-- Input file	: latch_RS_NAND.ngd
-- Output file	: /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS/netgen/translate/latch_RS_NAND_translate.vhd
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
  signal R_IBUF_0 : STD_LOGIC; 
  signal S_IBUF_1 : STD_LOGIC; 
  signal NQ_OBUF_2 : STD_LOGIC; 
  signal Q_OBUF_3 : STD_LOGIC; 
  signal NlwInverterSignal_XLXI_3_O : STD_LOGIC; 
  signal NlwInverterSignal_XLXI_2_O : STD_LOGIC; 
begin
  XLXI_3 : X_AND2
    port map (
      I0 => R_IBUF_0,
      I1 => Q_OBUF_3,
      O => NlwInverterSignal_XLXI_3_O
    );
  XLXI_2 : X_AND2
    port map (
      I0 => NQ_OBUF_2,
      I1 => S_IBUF_1,
      O => NlwInverterSignal_XLXI_2_O
    );
  R_IBUF : X_BUF
    port map (
      I => R,
      O => R_IBUF_0
    );
  S_IBUF : X_BUF
    port map (
      I => S,
      O => S_IBUF_1
    );
  NQ_OBUF : X_OBUF
    port map (
      I => NQ_OBUF_2,
      O => NQ
    );
  Q_OBUF : X_OBUF
    port map (
      I => Q_OBUF_3,
      O => Q
    );
  NlwInverterBlock_XLXI_3_O : X_INV
    port map (
      I => NlwInverterSignal_XLXI_3_O,
      O => NQ_OBUF_2
    );
  NlwInverterBlock_XLXI_2_O : X_INV
    port map (
      I => NlwInverterSignal_XLXI_2_O,
      O => Q_OBUF_3
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

