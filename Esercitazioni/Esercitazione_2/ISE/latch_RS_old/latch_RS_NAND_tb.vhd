-- Vhdl test bench created from schematic /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_2/ISE/latch_RS/latch_RS/latch_RS_NAND.sch - Mon Jan 21 20:48:33 2019
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
ENTITY latch_RS_NAND_latch_RS_NAND_sch_tb IS
END latch_RS_NAND_latch_RS_NAND_sch_tb;
ARCHITECTURE behavioral OF latch_RS_NAND_latch_RS_NAND_sch_tb IS 

   COMPONENT latch_RS_NAND
   PORT( NQ	:	OUT	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC; 
          S	:	IN	STD_LOGIC; 
          R	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL NQ	:	STD_LOGIC;
   SIGNAL Q	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;
   SIGNAL R	:	STD_LOGIC;

BEGIN

   UUT: latch_RS_NAND PORT MAP(
		NQ => NQ, 
		Q => Q, 
		S => S, 
		R => R
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		
		S <= '1', '1' after 15 ns, '1' after 40 ns, '0' after 60 ns, '1' after 80 ns, '0' after 100 ns, '1' after 120 ns;
		
		R <= '1', '0' after 15 ns, '1' after 40 ns, '1' after 60 ns, '1' after 80 ns, '0' after 100 ns, '1' after 120 ns;
		
		WAIT; -- will wait forever 
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
