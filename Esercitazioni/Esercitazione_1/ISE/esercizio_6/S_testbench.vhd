--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:02:38 11/14/2018
-- Design Name:   
-- Module Name:   /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_1/ISE/esercizio_6/S_testbench.vhd
-- Project Name:  esercizio_6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: S
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
 
ENTITY S_testbench IS
END S_testbench;
 
ARCHITECTURE behavior OF S_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT S
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         C : IN  std_logic_vector(2 downto 0);
         D : IN  std_logic_vector(2 downto 0);
         E : IN  std_logic_vector(2 downto 0);
         F : IN  std_logic_vector(2 downto 0);
         W : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(2 downto 0) := (others => '0');
   signal C : std_logic_vector(2 downto 0) := (others => '0');
   signal D : std_logic_vector(2 downto 0) := (others => '0');
   signal E : std_logic_vector(2 downto 0) := (others => '0');
   signal F : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal W : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: S PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          W => W
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		A <= (others => '1');
		wait for 10 ns;
		B <= (others => '1');
		wait for 10 ns;
		C <= (others => '1');
		wait for 10 ns;
		D <= (others => '1');
		wait for 10 ns;
		E <= (others => '1');
		wait for 10 ns;
		F <= (others => '1');
		wait for 10 ns;

      wait;
   end process;

END;
