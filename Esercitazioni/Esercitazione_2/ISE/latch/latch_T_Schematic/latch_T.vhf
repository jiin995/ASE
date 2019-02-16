--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : latch_T.vhf
-- /___/   /\     Timestamp : 02/10/2019 16:54:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/simone/Scrivania/latch_T_Schematic/latch_T.vhf -w /home/simone/Scrivania/latch_T_Schematic/latch_T.sch
--Design Name: latch_T
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

entity latch_T is
   port ( E : in    std_logic; 
          T : in    std_logic; 
          Q : out   std_logic);
end latch_T;

architecture BEHAVIORAL of latch_T is
   attribute BOX_TYPE   : string ;
   signal XLXN_4  : std_logic;
   signal Q_DUMMY : std_logic;
   component LD
      generic( INIT : bit :=  '0');
      port ( D : in    std_logic; 
             G : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of LD : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
begin
   Q <= Q_DUMMY;
   XLXI_1 : LD
   generic map( INIT => '0')
      port map (D=>XLXN_4,
                G=>E,
                Q=>Q_DUMMY);
   
   XLXI_2 : XOR2
      port map (I0=>T,
                I1=>Q_DUMMY,
                O=>XLXN_4);
   
end BEHAVIORAL;


