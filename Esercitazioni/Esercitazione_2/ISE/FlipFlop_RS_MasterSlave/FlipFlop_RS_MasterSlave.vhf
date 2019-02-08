--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : FlipFlop_RS_MasterSlave.vhf
-- /___/   /\     Timestamp : 02/08/2019 17:30:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/simone/Scrivania/ASE/Esercitazioni/Esercitazione_2/ISE/FlipFlop_RS_MasterSlave/FlipFlop_RS_MasterSlave.vhf -w /home/simone/Scrivania/ASE/Esercitazioni/Esercitazione_2/ISE/FlipFlop_RS_MasterSlave/FlipFlop_RS_MasterSlave.sch
--Design Name: FlipFlop_RS_MasterSlave
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity FlipFlop_RS_MasterSlave is
   port ( CLK : in    std_logic; 
          R   : in    std_logic; 
          S   : in    std_logic; 
          NQ  : out   std_logic; 
          Q   : out   std_logic);
end FlipFlop_RS_MasterSlave;

architecture BEHAVIORAL of FlipFlop_RS_MasterSlave is
   attribute BOX_TYPE   : string ;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_13  : std_logic;
   signal XLXN_14  : std_logic;
   signal XLXN_16  : std_logic;
   signal Q_DUMMY  : std_logic;
   signal NQ_DUMMY : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component NOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   NQ <= NQ_DUMMY;
   Q <= Q_DUMMY;
   XLXI_1 : AND2
      port map (I0=>CLK,
                I1=>R,
                O=>XLXN_4);
   
   XLXI_2 : AND2
      port map (I0=>S,
                I1=>CLK,
                O=>XLXN_5);
   
   XLXI_3 : AND2
      port map (I0=>XLXN_16,
                I1=>XLXN_13,
                O=>XLXN_11);
   
   XLXI_4 : AND2
      port map (I0=>XLXN_14,
                I1=>XLXN_16,
                O=>XLXN_12);
   
   XLXI_5 : NOR2
      port map (I0=>XLXN_14,
                I1=>XLXN_4,
                O=>XLXN_13);
   
   XLXI_6 : NOR2
      port map (I0=>XLXN_5,
                I1=>XLXN_13,
                O=>XLXN_14);
   
   XLXI_7 : NOR2
      port map (I0=>Q_DUMMY,
                I1=>XLXN_11,
                O=>NQ_DUMMY);
   
   XLXI_8 : NOR2
      port map (I0=>XLXN_12,
                I1=>NQ_DUMMY,
                O=>Q_DUMMY);
   
   XLXI_9 : INV
      port map (I=>CLK,
                O=>XLXN_16);
   
end BEHAVIORAL;


