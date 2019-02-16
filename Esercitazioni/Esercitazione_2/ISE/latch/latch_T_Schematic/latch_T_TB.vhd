-- Vhdl test bench created from schematic /home/simone/Scrivania/latch_T_Schematic/latch_T.sch - Sun Feb 10 16:45:31 2019
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
ENTITY latch_T_latch_T_sch_tb IS
END latch_T_latch_T_sch_tb;
ARCHITECTURE behavioral OF latch_T_latch_T_sch_tb IS 

   COMPONENT latch_T
   PORT( T	:	IN	STD_LOGIC; 
          E	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL T	:	STD_LOGIC;
   SIGNAL E	:	STD_LOGIC;
   SIGNAL Q	:	STD_LOGIC;

BEGIN

   UUT: latch_T PORT MAP(
		T => T, 
		E => E, 
		Q => Q
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		WAIT for 10 ns;
		E <= '1', '0' after 20 ns;
		T <= '1', '0' after 10 ns, '1' after 20 ns;
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
