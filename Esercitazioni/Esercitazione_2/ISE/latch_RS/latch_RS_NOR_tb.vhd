-- Vhdl test bench created from schematic /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS_NOR.sch - Mon Jan 21 21:41:21 2019
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY latch_RS_NOR_latch_RS_NOR_sch_tb IS
END latch_RS_NOR_latch_RS_NOR_sch_tb;
ARCHITECTURE behavioral OF latch_RS_NOR_latch_RS_NOR_sch_tb IS 

   COMPONENT latch_RS_NOR
   PORT( Q	:	OUT	STD_LOGIC; 
          NQ	:	OUT	STD_LOGIC; 
          S	:	IN	STD_LOGIC; 
          R	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL Q	:	STD_LOGIC;
   SIGNAL NQ	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;
   SIGNAL R	:	STD_LOGIC;

BEGIN

   UUT: latch_RS_NOR PORT MAP(
		Q => Q, 
		NQ => NQ, 
		S => S, 
		R => R
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	
		S <= '0' , '1' after 30 ns, '0' after 50 ns,'1' after 70 ns;
		R <= '0' , '1' after 40 ns, '0' after 50 ns;
      WAIT; -- will wait forever
   END PROCESS; 
-- *** End Test Bench - User Defined Section ***

END;
