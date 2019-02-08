--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : latch_RS_NOR.vhf
-- /___/   /\     Timestamp : 02/08/2019 12:41:00
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS_NOR.vhf -w /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS_NOR.sch
--Design Name: latch_RS_NOR
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

entity latch_RS_NOR is
   port ( R      : in    std_logic; 
          S      : in    std_logic; 
          XLXN_2 : in    std_logic; 
          NQ     : out   std_logic; 
          Q      : out   std_logic);
end latch_RS_NOR;

architecture BEHAVIORAL of latch_RS_NOR is
   attribute BOX_TYPE   : string ;
   signal in_R     : std_logic;
   signal XLXN_1   : std_logic;
   signal Q_DUMMY  : std_logic;
   signal NQ_DUMMY : std_logic;
   component NOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   NQ <= NQ_DUMMY;
   Q <= Q_DUMMY;
   XLXI_1 : NOR2
      port map (I0=>Q_DUMMY,
                I1=>XLXN_1,
                O=>NQ_DUMMY);
   
   XLXI_2 : NOR2
      port map (I0=>in_R,
                I1=>NQ_DUMMY,
                O=>Q_DUMMY);
   
   XLXI_4 : AND2
      port map (I0=>XLXN_2,
                I1=>S,
                O=>XLXN_1);
   
   XLXI_5 : AND2
      port map (I0=>R,
                I1=>XLXN_2,
                O=>in_R);
   
end BEHAVIORAL;


