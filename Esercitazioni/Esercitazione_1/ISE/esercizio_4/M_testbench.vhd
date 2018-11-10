--------------------------------------------------------------------------------
-- Company: Gruppo 14
-- Engineer: Gabriele Previtera, Mirko Pennone, Simone Penna
--
-- Create Date:   13:01:03 11/10/2018
-- Design Name:   
-- Module Name:   /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_1/ISE/esercizio_4/M_testbench.vhd
-- Project Name:  esercizio_4
-- Target Device:  
-- Tool versions:  
-- Description: Testbench for machine M.
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
 
ENTITY M_testbench IS
END M_testbench;
 
ARCHITECTURE behavior OF M_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT M
    PORT(
         x0 : IN  std_logic;
         x1 : IN  std_logic;
         x2 : IN  std_logic;
         x3 : IN  std_logic;
         x4 : IN  std_logic;
         x5 : IN  std_logic;
         y0 : OUT  std_logic;
         y1 : OUT  std_logic;
         y2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x0 : std_logic := '0';
   signal x1 : std_logic := '0';
   signal x2 : std_logic := '0';
   signal x3 : std_logic := '0';
   signal x4 : std_logic := '0';
   signal x5 : std_logic := '0';

 	--Outputs
   signal y0 : std_logic;
   signal y1 : std_logic;
   signal y2 : std_logic;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: M PORT MAP (
          x0 => x0,
          x1 => x1,
          x2 => x2,
          x3 => x3,
          x4 => x4,
          x5 => x5,
          y0 => y0,
          y1 => y1,
          y2 => y2
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- update the xi inputs from 0 to 1, one by one, waiting 10 ns between each one.
		
		x0 <= '1';
		wait for 10 ns;
		x1 <= '1';
		wait for 10 ns;
		x2 <= '1';
		wait for 10 ns;
		x3 <= '1';
		wait for 10 ns;
		x4 <= '1';
		wait for 10 ns;
		x5 <= '1';
		wait for 10 ns;

      wait;
   end process;

END;
