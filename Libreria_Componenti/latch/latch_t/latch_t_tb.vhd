--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:15:30 02/08/2019
-- Design Name:   
-- Module Name:   /home/gianluigi/ASE/Test/Latch_T/latch_t_tb.vhd
-- Project Name:  Latch_T
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Latch_T
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY latch_t_tb IS
END latch_t_tb;
 
ARCHITECTURE behavior OF latch_t_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Latch_T
    PORT(
         T : IN  std_logic;
         en : IN  std_logic;
         Q : OUT  std_logic;
         QN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal en : std_logic := '0';
	--signal clock : std_logic := '0';
 	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Latch_T PORT MAP (
          T => T,
          en => en,
          Q => Q,
          QN => QN
        );

   -- Clock process definitions
   --clock_process :process
   --begin
	--	clock <= '0';
	--	wait for clock_period/2;
	--	clock <= '1';
	--	wait for clock_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		T <= '1' after 10 ns, '0' after 20 ns, '1' after 50 ns, '0' after 100 ns;
		en <= '1' after 30 ns;

      wait;
   end process;

END;
