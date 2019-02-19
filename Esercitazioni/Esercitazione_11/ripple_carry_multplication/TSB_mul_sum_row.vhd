--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:01:59 01/30/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ASE_ise/Mul_somma_per_righe/TSB_mul_sum_row.vhd
-- Project Name:  Mul_somma_per_righe
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ripple_carry_multiplier
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
 
ENTITY TSB_mul_sum_row IS
END TSB_mul_sum_row;
 
ARCHITECTURE behavior OF TSB_mul_sum_row IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_carry_multiplier
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         P : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_carry_multiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      a<="010";
		b<="110";
		wait for 20 ns;
		a<="110";
		b<="001";
		wait for 20 ns;
		b<="100";
		wait for 20 ns;
		a<="111";
		b<="111";

      wait;
   end process;

END;
