--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_T_translate.vhd
-- /___/   /\     Timestamp: Sun Feb 10 17:47:13 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm latch_T -w -dir netgen/translate -ofmt vhdl -sim latch_T.ngd latch_T_translate.vhd 
-- Device	: 7a100tcsg324-3
-- Input file	: latch_T.ngd
-- Output file	: /home/simone/Scrivania/latch_T/netgen/translate/latch_T_translate.vhd
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
  signal en_IBUF_0 : STD_LOGIC; 
  signal T_IBUF_1 : STD_LOGIC; 
  signal T_T_AND_3_o : STD_LOGIC; 
  signal Qtemp_3 : STD_LOGIC; 
  signal QN_OBUF_4 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
begin
  Qtemp : X_LATCHE
    generic map(
      INIT => '0'
    )
    port map (
      I => QN_OBUF_4,
      CLK => T_T_AND_3_o,
      O => Qtemp_3,
      GE => VCC,
      SET => GND,
      RST => GND
    );
  T_T_AND_3_o1 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => T_IBUF_1,
      ADR1 => en_IBUF_0,
      O => T_T_AND_3_o
    );
  en_IBUF : X_BUF
    port map (
      I => en,
      O => en_IBUF_0
    );
  T_IBUF : X_BUF
    port map (
      I => T,
      O => T_IBUF_1
    );
  QN1_INV_0 : X_INV
    port map (
      I => Qtemp_3,
      O => QN_OBUF_4
    );
  Q_OBUF : X_OBUF
    port map (
      I => Qtemp_3,
      O => Q
    );
  QN_OBUF : X_OBUF
    port map (
      I => QN_OBUF_4,
      O => QN
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

