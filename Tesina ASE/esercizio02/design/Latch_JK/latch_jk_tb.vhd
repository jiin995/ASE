--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:41:25 02/08/2019
-- Design Name:   
-- Project Name:  Latch_JK_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: latch_jk
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
 
ENTITY latch_jk_tb IS
END latch_jk_tb;
 
ARCHITECTURE behavior OF latch_jk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latch_jk
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         Q : OUT  std_logic;
         Qnot : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
	
 	--Outputs
   signal Q : std_logic;
   signal Qnot : std_logic;
	
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: latch_jk PORT MAP (
          J => J,
          K => K,
          Q => Q,
          Qnot => Qnot
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

      -- insert stimulus here 
		J<='1' after 240 ns;
		K<='1' after 160 ns, '0' after 500 ns;
		
      wait;
   end process;


END;
