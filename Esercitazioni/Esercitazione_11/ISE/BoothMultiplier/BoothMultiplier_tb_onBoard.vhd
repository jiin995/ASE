--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:29:39 02/26/2019
-- Design Name:   
-- Module Name:   /home/simone/Scrivania/ASE/Esercitazioni/Esercitazione_11/ISE/BoothMultiplier/BoothMultiplier_tb_onBoard.vhd
-- Project Name:  BoothMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: booth_multiplier_onBoard
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
 
ENTITY BoothMultiplier_tb_onBoard IS
END BoothMultiplier_tb_onBoard;
 
ARCHITECTURE behavior OF BoothMultiplier_tb_onBoard IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT booth_multiplier_onBoard
    PORT(
         clock : IN  std_logic;
         start : IN  std_logic;
         start_led : OUT  std_logic;
         stop : OUT  std_logic;
         enable_a : IN  std_logic;
         enable_b : IN  std_logic;
         subtract : IN  std_logic;
         input : IN  std_logic_vector(7 downto 0);
         overflow : OUT  std_logic;
         c_out : OUT  std_logic;
         anodes : OUT  std_logic_vector(7 downto 0);
         cathodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
   signal enable_a : std_logic := '0';
   signal enable_b : std_logic := '0';
   signal subtract : std_logic := '0';
   signal input : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal start_led : std_logic;
   signal stop : std_logic;
   signal overflow : std_logic;
   signal c_out : std_logic;
   signal anodes : std_logic_vector(7 downto 0);
   signal cathodes : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: booth_multiplier_onBoard PORT MAP (
          clock => clock,
          start => start,
          start_led => start_led,
          stop => stop,
          enable_a => enable_a,
          enable_b => enable_b,
          subtract => subtract,
          input => input,
          overflow => overflow,
          c_out => c_out,
          anodes => anodes,
          cathodes => cathodes
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
		input <= x"82", x"06" after 40 ns ;
		enable_a <= '1' after 20 ns , '0' after 40 ns ;
		enable_b <= '1' after 40 ns , '0' after 60 ns ;
		
		start <= '1' after 60 ns , '0' after 80 ns ;
		
      wait for clock_period*10;


      wait;
   end process;
	
	END;
