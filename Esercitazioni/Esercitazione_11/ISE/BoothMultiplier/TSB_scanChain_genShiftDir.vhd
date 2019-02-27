--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:59:24 01/26/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ASE_ise/Booth_1_Multiplier/TSB_scanChain_genShiftDir.vhd
-- Project Name:  Booth_1_Multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Scan_chain
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
 
ENTITY TSB_scanChain_genShiftDir IS
END TSB_scanChain_genShiftDir;
 
ARCHITECTURE behavior OF TSB_scanChain_genShiftDir IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Scan_chain
    PORT(
         Din : IN  std_logic_vector(3 downto 0);
         Scan_in : IN  std_logic;
         en : IN  std_logic;
         clock : IN  std_logic;
         Scan_en : IN  std_logic;
         Scan_out : OUT  std_logic;
         reset_n : IN  std_logic;
         Dout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(3 downto 0) := (others => '0');
   signal Scan_in : std_logic := '0';
   signal en : std_logic := '0';
   signal clock : std_logic := '0';
   signal Scan_en : std_logic := '0';
   signal reset_n : std_logic := '0';

 	--Outputs
   signal Scan_out : std_logic;
   signal Dout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Scan_chain PORT MAP (
          Din => Din,
          Scan_in => Scan_in,
          en => en,
          clock => clock,
          Scan_en => Scan_en,
          Scan_out => Scan_out,
          reset_n => reset_n,
          Dout => Dout
        );

   -- Clock process definitions
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
      wait for 100 ns;	
		reset_n<='1';
		en<='1';
		din<="1011";
		scan_in<='1';
		wait for 60 ns;
		scan_en<='1';
		wait for 20 ns;
		scan_in<='0';
		wait for 20 ns;
		en<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
