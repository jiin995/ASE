-- Vhdl test bench created from schematic /home/simone/Scrivania/ASE/Esercitazioni/Esercitazione_2/ISE/FlipFlop_RS_MasterSlave/FlipFlop_RS_MasterSlave.sch - Fri Feb  8 16:56:20 2019
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
ENTITY FlipFlop_RS_MasterSlave_FlipFlop_RS_MasterSlave_sch_tb IS
END FlipFlop_RS_MasterSlave_FlipFlop_RS_MasterSlave_sch_tb;
ARCHITECTURE behavioral OF 
      FlipFlop_RS_MasterSlave_FlipFlop_RS_MasterSlave_sch_tb IS 

   COMPONENT FlipFlop_RS_MasterSlave
   PORT( R	:	IN	STD_LOGIC; 
          S	:	IN	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC; 
          NQ	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL R	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;
   SIGNAL CLK	:	STD_LOGIC;
   SIGNAL Q	:	STD_LOGIC;
   SIGNAL NQ	:	STD_LOGIC;
	
	-- Clock period definitions
   constant clock_period : time := 40 ns;

BEGIN

   UUT: FlipFlop_RS_MasterSlave PORT MAP(
		R => R, 
		S => S, 
		CLK => CLK, 
		Q => Q, 
		NQ => NQ
   );

-- Clock process definitions
   clock_process: process
   begin
		CLK <= '1';
		wait for clock_period/2;
		CLK <= '0';
		wait for clock_period/2;
   end process;
	
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		R <= '0' after 0 ns, '0' after 20 ns, '1' after 40 ns, '0' after 60 ns, '1' after 120 ns, '0' after 140 ns;
		S <= '1' after 0 ns, '0' after 20 ns, '0' after 40 ns, '0' after 60 ns, '1' after 120 ns, '0' after 140 ns;
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
