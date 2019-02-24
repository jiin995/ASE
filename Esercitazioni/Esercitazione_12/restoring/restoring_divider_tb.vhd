--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:33:29 02/24/2019
-- Design Name:   
-- Module Name:   /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_12/restoring/restoring_divider_tb.vhd
-- Project Name:  R_division
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: restoring_divider
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
 
ENTITY restoring_divider_tb IS
END restoring_divider_tb;
 
ARCHITECTURE behavior OF restoring_divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT restoring_divider
    PORT(
         X : IN  std_logic_vector(7 downto 0);
         Y : IN  std_logic_vector(7 downto 0);
         Q : OUT  std_logic_vector(8 downto 0);
         R : OUT  std_logic_vector(7 downto 0);
         Reset_n : IN  std_logic;
         clock : IN  std_logic;
         start : IN  std_logic;
         stop : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(7 downto 0) := (others => '0');
   signal Y : std_logic_vector(7 downto 0) := (others => '0');
   signal Reset_n : std_logic := '0';
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
   signal stop : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(8 downto 0);
   signal R : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: restoring_divider PORT MAP (
          X => X,
          Y => Y,
          Q => Q,
          R => R,
          Reset_n => Reset_n,
          clock => clock,
          start => start,
          stop => stop
        );

    clock_process :process
   begin
		clock <= '0';
		wait for 10 ns;
		clock <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		reset_n<='1';
		X<="11001000";
		Y<="00010010";
      wait for 10 ns;
		start<='1';
		wait for 20 ns;
		start<='0';

      -- insert stimulus here 
	wait for 1000 ns;
      wait;
   end process;
END;
