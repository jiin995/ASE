--------------------------------------------------------------------------------
--! Company: 
--! Engineer:
--
--! Create Date:   14:47:55 01/31/2018
--! Design Name:   
--! Module Name:   C:/Documents and Settings/ASE_ise/R_division/TSB_R_div.vhd
--! Project Name:  R_division
--! Target Device:  
--! Tool versions:  
--! Description:   
--! 
--! VHDL Test Bench Created by ISE for module: R_Division
--! 
--! Dependencies:
--! 
--! Revision:
--! Revision 0.01 - File Created
--! Additional Comments:
--
--! Notes: 
--! This testbench has been automatically generated using types std_logic and
--! std_logic_vector for the ports of the unit under test.  Xilinx recommends
--! that these types always be used for the top-level I/O of a design in order
--! to guarantee that the testbench will bind correctly to the post-implementation 
--! simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TSB_R_div IS
END TSB_R_div;
 
ARCHITECTURE behavior OF TSB_R_div IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R_Division
    PORT(
         Dividend : IN  std_logic_vector(7 downto 0);
         Divisor : IN  std_logic_vector(7 downto 0);
         Quotient : OUT  std_logic_vector(7 downto 0);
         Remainder : OUT  std_logic_vector(7 downto 0);
         Reset_n : IN  std_logic;
         clock : IN  std_logic;
         start : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Dividend : std_logic_vector(7 downto 0) := (others => '0');
   signal Divisor : std_logic_vector(7 downto 0) := (others => '0');
   signal Reset_n : std_logic := '0';
   signal clock : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal Quotient : std_logic_vector(7 downto 0);
   signal Remainder : std_logic_vector(7 downto 0);

 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: R_Division PORT MAP (
          Dividend => Dividend,
          Divisor => Divisor,
          Quotient => Quotient,
          Remainder => Remainder,
          Reset_n => Reset_n,
          clock => clock,
          start => start
        );

   --! Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for 10 ns;
		clock <= '1';
		wait for 10 ns;
   end process;
 

   --! Stimulus process
   stim_proc: process
   begin		
      wait for 10 ns;	
		reset_n<='1';
		dividend<="11001000";
		divisor<="00010010";
      wait for 10 ns;
		start<='1';
		wait for 20 ns;
		start<='0';

      --! insert stimulus here 
	wait for 1000 ns;
      wait;
   end process;

END;
