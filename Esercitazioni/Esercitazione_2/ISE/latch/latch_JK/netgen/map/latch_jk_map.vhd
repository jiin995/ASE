--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_jk_map.vhd
-- /___/   /\     Timestamp: Sat Feb  9 15:52:21 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf latch_jk.pcf -rpw 100 -tpw 0 -ar Structure -tm latch_jk -w -dir netgen/map -ofmt vhdl -sim latch_jk_map.ncd latch_jk_map.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
-- Input file	: latch_jk_map.ncd
-- Output file	: /home/simone/Scrivania/latch_JK/netgen/map/latch_jk_map.vhd
-- # of Entities	: 1
-- Design Name	: latch_jk
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

entity latch_jk is
  port (
    J : in STD_LOGIC := 'X'; 
    K : in STD_LOGIC := 'X'; 
    Q : out STD_LOGIC; 
    Qnot : out STD_LOGIC 
  );
end latch_jk;

architecture Structure of latch_jk is
  signal K_IBUF_24 : STD_LOGIC; 
  signal Qtemp_25 : STD_LOGIC; 
  signal J_IBUF_26 : STD_LOGIC; 
  signal Qnot_OBUF_0 : STD_LOGIC; 
  signal Qtemp_G_28 : STD_LOGIC; 
  signal ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal K_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal Qnot_OBUF_10 : STD_LOGIC; 
  signal Qtemp_G_pack_1 : STD_LOGIC; 
  signal Qtemp_D_14 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
begin
  Qnot_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y149"
    )
    port map (
      I => Qnot_OBUF_0,
      O => Qnot
    );
  ProtoComp2_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      O => ProtoComp2_INTERMDISABLE_GND_0
    );
  J_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp2_INTERMDISABLE_GND_0,
      O => J_IBUF_26,
      I => J,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X0Y146"
    )
    port map (
      O => K_ProtoComp2_INTERMDISABLE_GND_0
    );
  K_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y146"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => K_ProtoComp2_INTERMDISABLE_GND_0,
      O => K_IBUF_24,
      I => K,
      TPWRGT => '1'
    );
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y147"
    )
    port map (
      I => Qtemp_25,
      O => Q
    );
  Qnot_OBUF_Qnot_OBUF_OQ_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Qnot_OBUF_10,
      O => Qnot_OBUF_0
    );
  Qnot1_INV_0 : X_INV
    generic map(
      LOC => "OLOGIC_X0Y149",
      PATHPULSE => 50 ps
    )
    port map (
      I => Qtemp_25,
      O => Qnot_OBUF_10
    );
  Qtemp_Qtemp_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Qtemp_G_pack_1,
      O => Qtemp_G_28
    );
  Qtemp : X_LATCHE
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => Qtemp_G_28,
      I => Qtemp_D_14,
      O => Qtemp_25,
      RST => GND,
      SET => GND
    );
  Qtemp_D : X_LUT6
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => X"0FFF000F0FFF000F"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => K_IBUF_24,
      ADR3 => Qtemp_25,
      ADR4 => J_IBUF_26,
      ADR5 => '1',
      O => Qtemp_D_14
    );
  Qtemp_G : X_LUT5
    generic map(
      LOC => "SLICE_X0Y147",
      INIT => X"FFFFF0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => K_IBUF_24,
      ADR3 => '1',
      ADR4 => J_IBUF_26,
      O => Qtemp_G_pack_1
    );
  NlwBlock_latch_jk_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_latch_jk_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

