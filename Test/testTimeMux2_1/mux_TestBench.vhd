--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:45:52 11/27/2018
-- Design Name:   
-- Module Name:   /home/jiin995/ASE_WorkSpace/Test/Test7Segmenti/testTimeMux2_1/mux_TestBench.vhd
-- Project Name:  testTimeMux2_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxOnBoard
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
 
ENTITY mux_TestBench IS
END mux_TestBench;
 
ARCHITECTURE behavior OF mux_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxOnBoard
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic;
         X : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal X : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
	signal clock :std_logic := '0';
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxOnBoard PORT MAP (
          A => A,
          B => B,
          sel => sel,
          X => X
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		
      wait for clock_period*10;
			A <= (others => '1');
			sel <= not sel;
      -- insert stimulus here 
      wait;
   end process;

END;
