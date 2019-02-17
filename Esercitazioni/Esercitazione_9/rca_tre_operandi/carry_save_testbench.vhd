--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:58:02 01/29/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/OK/rca_tre_operandi/rca_tre_operandi_testbench.vhd
-- Project Name:  rca_tre_operandi
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rca_tre_operandi
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
 
ENTITY rca_tre_operandi_testbench IS
END rca_tre_operandi_testbench;
 
ARCHITECTURE behavior OF rca_tre_operandi_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rca_tre_operandi
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : IN  std_logic_vector(3 downto 0);
         Z : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');
   signal Y : std_logic_vector(3 downto 0) := (others => '0');
   signal Z : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(5 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rca_tre_operandi PORT MAP (
          X => X,
          Y => Y,
          Z => Z,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		X <= x"4";
		Y <= x"6";
		Z <= x"7";
		
		wait for 30 ns;
		
		X <= x"E";
		Y <= x"9";
		
		wait for 30 ns;
		
		Y <= x"9";
		Z <= x"8";
		
		wait for 30 ns;
		
		Z <= x"7";
		X <= x"8";

      -- insert stimulus here 

      wait;
   end process;

END;
