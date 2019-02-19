--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:29:27 02/19/2019
-- Design Name:   
-- Module Name:   /home/mirko/Desktop/ASE/ASE/Esercitazioni/Esercitazione_11/mac_multiplier/mac_multiplier_testbench.vhd
-- Project Name:  mac_multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mac_multiplier
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
 
ENTITY mac_multiplier_testbench IS
    generic ( N : NATURAL := 8;
              M : NATURAL := 8
    );
END mac_multiplier_testbench;
 
ARCHITECTURE behavior OF mac_multiplier_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mac_multiplier
        generic (
                    N    : NATURAL := N;
                    M    : NATURAL := M
        );
    PORT(
         X : IN  std_logic_vector(N-1 downto 0);
         Y : IN  std_logic_vector(M-1 downto 0);
         P : OUT  std_logic_vector(N+M-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(N-1 downto 0) := (others => '0');
   signal Y : std_logic_vector(M-1 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(N+M-1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mac_multiplier PORT MAP (
          X => X,
          Y => Y,
          P => P
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		X <= x"11";
		Y <= x"A6";
		
		wait for 30 ns;
		
		X <= x"2E";
		Y <= x"89";
		
		wait for 30 ns;
		
		Y <= x"29";
		
		wait for 30 ns;
		
		X <= x"18";

      -- insert stimulus here 

      wait;
   end process;
END;
