--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:49:21 02/19/2019
-- Design Name:   
-- Module Name:   /home/jiin995/ASE_WorkSpace/Test/RobertsonMultiplier/robertson_multiplier_testbench.vhd
-- Project Name:  RobertsonMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: robertson_multiplier
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
 
ENTITY robertson_multiplier_testbench IS
END robertson_multiplier_testbench;
 

ARCHITECTURE behavior OF robertson_multiplier_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	constant N :NATURAL := 4;
    COMPONENT robertson_multiplier
	 generic (N : natural :=N); 
    PORT(
         X : IN  std_logic_vector(N-1 downto 0);
         Y : IN  std_logic_vector(N-1 downto 0);
         start : IN  std_logic;
         clock : IN  std_logic;
         reset_n : IN  std_logic;
         stop : OUT  std_logic;
         Z : OUT  std_logic_vector(2*N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(N-1 downto 0) := (others => '0');
   signal Y : std_logic_vector(N-1 downto 0) := (others => '0');
   signal start : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset_n : std_logic := '1';

 	--Outputs
   signal stop : std_logic;
   signal Z : std_logic_vector(2*N-1 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: robertson_multiplier PORT MAP (
          X => X,
          Y => Y,
          start => start,
          clock => clock,
          reset_n => reset_n,
          stop => stop,
          Z => Z
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
		X <= x"4";
		Y <= x"F";
      wait for 10 ns;	
		start <= '1', '0' after 15 ns ;
	
      wait for clock_period*30;
		

      -- insert stimulus here 

      wait;
   end process;

END;
