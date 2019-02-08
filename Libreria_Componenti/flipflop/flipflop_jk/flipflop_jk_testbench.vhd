--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:01:38 02/08/2019
-- Design Name:   
-- Module Name:   /home/cris/ASE/Test/Latch_T/flipflop_jk_tb.vhd
-- Project Name:  Latch_T
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: flipflop_jk
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
 
ENTITY flipflop_jk_tb IS
END flipflop_jk_tb;
 
ARCHITECTURE behavior OF flipflop_jk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipflop_jk
    PORT(
         j : IN  std_logic;
         k : IN  std_logic;
         reset_n : IN  std_logic;
         clock : IN  std_logic;
         q : OUT  std_logic;
         not_q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal j : std_logic := '0';
   signal k : std_logic := '0';
   signal reset_n : std_logic := '1';
   signal clock : std_logic := '0';

 	--Outputs
   signal q : std_logic;
   signal not_q : std_logic;

   -- Clock period definitions
   constant clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipflop_jk PORT MAP (
          j => j,
          k => k,
          reset_n => reset_n,
          clock => clock,
          q => q,
          not_q => not_q
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
      wait for 100 ns;	

      -- insert stimulus here 
		j <= '1' after 10 ns, '0' after 70 ns, '1' after 290 ns;
		k <= '1' after 230 ns, '0' after 270 ns, '1' after 320 ns;
      wait;
   end process;

END;
