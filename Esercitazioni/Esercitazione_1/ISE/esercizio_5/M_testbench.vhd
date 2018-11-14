--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:55:18 11/14/2018
-- Design Name:   
-- Module Name:   /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_1/ISE/esercizio_5/M_testbench.vhd
-- Project Name:  esercizio_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: M
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
 
ENTITY M_testbench IS
END M_testbench;
 
ARCHITECTURE behavior OF M_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT M
    PORT(
         X : IN  std_logic_vector(5 downto 0);
         Y : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: M PORT MAP (
          X => X,
          Y => Y
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		
		for i in 0 to 5 loop
			X(i) <= '1';
			wait for 10 ns;
		end loop;
      --X(1) <= '1';
		
      wait;
   end process;

END;
