--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:26:01 01/26/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ASE_ise/Booth_1_Multiplier/TSB_booth_mul.vhd
-- Project Name:  Booth_1_Multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BoothMultiplier
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
 
ENTITY TSB_booth_mul IS
END TSB_booth_mul;
 
ARCHITECTURE behavior OF TSB_booth_mul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BoothMultiplier
    PORT(
         Multiplier : IN  std_logic_vector(3 downto 0);
         Multiplicand : IN  std_logic_vector(3 downto 0);
         Start_mul : IN  std_logic;
         reset_n : IN  std_logic;
         clk : IN  std_logic;
         Result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Multiplier : std_logic_vector(3 downto 0) := (others => '0');
   signal Multiplicand : std_logic_vector(3 downto 0) := (others => '0');
   signal Start_mul : std_logic := '0';
   signal reset_n : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BoothMultiplier PORT MAP (
          Multiplier => Multiplier,
          Multiplicand => Multiplicand,
          Start_mul => Start_mul,
          reset_n => reset_n,
          clk => clk,
          Result => Result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		reset_n<='1';
		
		multiplier<="0111";
		multiplicand<="0101";
		wait for 20 ns;
		start_mul<='1';
		wait for 50 ns;
		start_mul<='0';
		
		wait for 300 ns;
		multiplier<="1011";
		multiplicand<="0011";
		wait for 20 ns;
		start_mul<='1';
		wait for 50 ns;
		start_mul<='0';
		wait for 200 ns;
		multiplier<="0101";
		multiplicand<="1011";
		wait for 20 ns;
		start_mul<='1';
		wait for 50 ns;
		start_mul<='0';
--		wait for 200 ns;
--		multiplier<="0011";
--		multiplicand<="1010";
--		wait for 20 ns;
--		start_mul<='1';
--		wait for 50 ns;
--		start_mul<='0';		
		
		wait;
   end process;

END;
