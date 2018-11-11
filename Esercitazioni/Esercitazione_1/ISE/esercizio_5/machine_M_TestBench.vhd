--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:45:52 11/11/2018
-- Design Name:   
-- Module Name:   /home/jiin995/ASE_WorkSpace/Esercitazioni/Esercitazione_1/ISE/esercizio_5/machine_M_TestBench.vhd
-- Project Name:  esercizio_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: machine_M
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
 
ENTITY machine_M_TestBench IS
END machine_M_TestBench;
 
ARCHITECTURE behavior OF machine_M_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT machine_M
    PORT(
         X : IN  std_logic_vector(5 downto 0);
         Y : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(2 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: machine_M PORT MAP (
          X => X,
          Y => Y
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 20 ns.
      wait for 20 ns;	
		
		for i in 0 to 5 loop
			X(i) <= '1';
			wait for 10 ns;
		end loop;
      --X(1) <= '1';
		
      wait;
   end process;

END;
