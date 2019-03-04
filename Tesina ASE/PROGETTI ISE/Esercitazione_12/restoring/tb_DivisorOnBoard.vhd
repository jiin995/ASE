--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:02:06 02/10/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/Marco/Desktop/R_division/tb_DivisorOnBoard.vhd
-- Project Name:  R_division
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DivisorOnBoard
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
 
ENTITY tb_DivisorOnBoard IS
END tb_DivisorOnBoard;
 
ARCHITECTURE behavior OF tb_DivisorOnBoard IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DivisorOnBoard
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         load_divisor : IN  std_logic;
         load_dividend : IN  std_logic;
         start_division : IN  std_logic;
         in_byte : IN  std_logic_vector(7 downto 0);
         anodes : OUT  std_logic_vector(3 downto 0);
         cathodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal load_divisor : std_logic := '0';
   signal load_dividend : std_logic := '0';
   signal start_division : std_logic := '0';
   signal in_byte : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal anodes : std_logic_vector(3 downto 0);
   signal cathodes : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DivisorOnBoard PORT MAP (
          clk => clk,
          reset => reset,
          load_divisor => load_divisor,
          load_dividend => load_dividend,
          start_division => start_division,
          in_byte => in_byte,
          anodes => anodes,
          cathodes => cathodes
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset<='0';
		in_byte<="11001000";
		load_dividend <= '1', '0' after clk_period;
		wait for 5*clk_period;
		in_byte<="00010010";
		load_divisor <= '1', '0' after clk_period;
      wait for 10 ns;
		start_division<='1';
		wait for 20 ns;
		start_division<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
