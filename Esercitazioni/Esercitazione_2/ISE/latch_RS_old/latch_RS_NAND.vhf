--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : latch_RS_NAND.vhf
-- /___/   /\     Timestamp : 01/21/2019 20:47:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS/latch_RS_NAND.vhf -w /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS/latch_RS_NAND.sch
--Design Name: latch_RS_NAND
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

entity latch_RS_NAND is
   port ( R  : in    std_logic; 
          S  : in    std_logic; 
          NQ : out   std_logic; 
          Q  : out   std_logic);
end latch_RS_NAND;

architecture BEHAVIORAL of latch_RS_NAND is
   attribute BOX_TYPE   : string ;
   signal Q_DUMMY  : std_logic;
   signal NQ_DUMMY : std_logic;
   component NAND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND2 : component is "BLACK_BOX";
   
begin
   NQ <= NQ_DUMMY;
   Q <= Q_DUMMY;
   XLXI_2 : NAND2
      port map (I0=>NQ_DUMMY,
                I1=>S,
                O=>Q_DUMMY);
   
   XLXI_3 : NAND2
      port map (I0=>R,
                I1=>Q_DUMMY,
                O=>NQ_DUMMY);
   
end BEHAVIORAL;


