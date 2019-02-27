--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:07:58 01/26/2018
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ASE_ise/Booth_1_Multiplier/TSB_AQ_shiftRegR.vhd
-- Project Name:  Booth_1_Multiplier
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
 
ENTITY TSB_AQ_shiftRegR IS
END TSB_AQ_shiftRegR;
 
ARCHITECTURE behavior OF TSB_AQ_shiftRegR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Accumulator_Quotient
    PORT(
         High_Reg : IN  std_logic_vector(7 downto 0);
         Load_data_n : IN  std_logic;
         Low_Reg : IN  std_logic_vector(8 downto 0);
         H_read : OUT  std_logic_vector(7 downto 0);
         L_read : OUT  std_logic_vector(8 downto 0);
         clk : IN  std_logic;
         en_a : IN  std_logic;
         en_q : IN  std_logic;
         reset_a_n : IN  std_logic;
         reset_q_n : IN  std_logic;
         Q0_m1 : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal High_Reg : std_logic_vector(7 downto 0) := (others => '0');
   signal Load_data_n : std_logic := '0';
   signal Low_Reg : std_logic_vector(8 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en_a : std_logic := '0';
   signal en_q : std_logic := '0';
   signal reset_a_n : std_logic := '0';
   signal reset_q_n : std_logic := '0';

 	--Outputs
   signal H_read : std_logic_vector(7 downto 0);
   signal L_read : std_logic_vector(8 downto 0);
   signal Q0_m1 : std_logic_vector(1 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Accumulator_Quotient PORT MAP (
          High_Reg => High_Reg,
          Load_data_n => Load_data_n,
          Low_Reg => Low_Reg,
          H_read => H_read,
          L_read => L_read,
          clk => clk,
          en_a => en_a,
          en_q => en_q,
          reset_a_n => reset_a_n,
          reset_q_n => reset_q_n,
          Q0_m1 => Q0_m1
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
      en_a<='1';
		en_q<='1';
      wait for 10 ns;	
		reset_a_n<='1';
		reset_q_n<='1';
		High_reg<="10011101";	-- A : 8 bit
		Low_reg<="000111100";	-- Q : 9 bit
		wait for 30 ns;
		load_data_n<='1';
		wait for 500 ns;
		en_a<='0';
		en_q<='0';
      wait;
   end process;

END;
