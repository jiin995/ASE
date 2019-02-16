--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: latch_T_map.vhd
-- /___/   /\     Timestamp: Sun Feb 10 16:55:59 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf latch_T.pcf -rpw 100 -tpw 0 -ar Structure -tm latch_T -w -dir netgen/map -ofmt vhdl -sim latch_T_map.ncd latch_T_map.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.10 2013-10-13)
-- Input file	: latch_T_map.ncd
-- Output file	: /home/simone/Scrivania/latch_T_Schematic/netgen/map/latch_T_map.vhd
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
    E : in STD_LOGIC := 'X'; 
    T : in STD_LOGIC := 'X'; 
    Q : out STD_LOGIC 
  );
end latch_T;

architecture Structure of latch_T is
  signal E_BUFGP_IBUFG_18 : STD_LOGIC; 
  signal Q_OBUF_19 : STD_LOGIC; 
  signal T_IBUF_20 : STD_LOGIC; 
  signal E_BUFGP : STD_LOGIC; 
  signal ProtoComp0_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal T_ProtoComp0_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal XLXN_4 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
begin
  ProtoComp0_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X1Y128"
    )
    port map (
      O => ProtoComp0_INTERMDISABLE_GND_0
    );
  E_BUFGP_IBUFG : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y128"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp0_INTERMDISABLE_GND_0,
      O => E_BUFGP_IBUFG_18,
      I => E,
      TPWRGT => '1'
    );
  Q_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X0Y149"
    )
    port map (
      I => Q_OBUF_19,
      O => Q
    );
  ProtoComp0_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      O => T_ProtoComp0_INTERMDISABLE_GND_0
    );
  T_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X0Y148"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => T_ProtoComp0_INTERMDISABLE_GND_0,
      O => T_IBUF_20,
      I => T,
      TPWRGT => '1'
    );
  E_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGCTRL_X0Y31",
      PATHPULSE => 50 ps
    )
    port map (
      I => E_BUFGP_IBUFG_18,
      O => E_BUFGP
    );
  XLXI_1 : X_LATCHE
    generic map(
      LOC => "SLICE_X0Y148",
      INIT => '0'
    )
    port map (
      GE => VCC,
      CLK => E_BUFGP,
      I => XLXN_4,
      O => Q_OBUF_19,
      RST => GND,
      SET => GND
    );
  XLXI_2 : X_LUT6
    generic map(
      LOC => "SLICE_X0Y148",
      INIT => X"00FF00FFFF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => Q_OBUF_19,
      ADR4 => '1',
      ADR5 => T_IBUF_20,
      O => XLXN_4
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

