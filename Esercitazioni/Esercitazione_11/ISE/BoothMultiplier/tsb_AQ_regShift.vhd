--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:11:36 01/23/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ASE_ise/moltiplicatore_Robertson/tsb_AQ_regShift.vhd
-- Project Name:  moltiplicatore_Robertson
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Accumulator_Quotient
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
 
ENTITY tsb_AQ_regShift IS
END tsb_AQ_regShift;
 
ARCHITECTURE behavior OF tsb_AQ_regShift IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Accumulator_Quotient
    PORT(
         High_Reg : IN  std_logic_vector(7 downto 0);
         Load_data_n : IN  std_logic;
         Low_Reg : IN  std_logic_vector(7 downto 0);
         H_read : OUT  std_logic_vector(7 downto 0);
         L_read : OUT  std_logic_vector(7 downto 0);
         F : IN  std_logic;
         clk : IN  std_logic;
			en	: in std_logic;
			reset_n	: in std_logic;
         Q0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal High_Reg: std_logic_vector(7 downto 0) := (others => '0');
   signal Load_data_n : std_logic := '0';
   signal Low_Reg : std_logic_vector(7 downto 0) := (others => '0');
   signal F : std_logic := '0';
	signal en : std_logic:='0';
	signal reset_n : std_logic:='0';
   signal clk : std_logic := '0';

 	--Outputs
   signal H_read : std_logic_vector(7 downto 0);
   signal L_read : std_logic_vector(7 downto 0);
   signal Q0 : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Accumulator_Quotient PORT MAP (
          High_Reg => High_Reg,
          Load_data_n => Load_data_n,
          Low_Reg => Low_Reg,
          H_read => H_read,
          L_read => L_read,
          F => F,
          clk => clk,
			 en=>en,
			 reset_n=>reset_n,
          Q0 => Q0
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
			en<='1';

		--inizializzazione A
		High_Reg<="11011101";
		--inizializzazione Q
		Low_reg<="00001110";
		wait for 20 ns;
		reset_n<='1';

      wait for 20 ns;	
		load_data_n<='1';
		wait for 60 ns;
		load_data_n<='0';
		wait for 100 ns;
		en<='0';

      wait;
   end process;

END;
