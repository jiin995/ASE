LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clk_tester_testbench IS
END clk_tester_testbench;
 
ARCHITECTURE behavior OF clk_tester_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_tester
    PORT(
         clock_in 		: IN  std_logic;
         enable 			: IN  std_logic;
         reset_n 			: IN  std_logic;
         d_in 				: IN  std_logic;
         q_out 			: OUT  std_logic;
         Q 					: OUT  std_logic_vector(7 downto 0);
		   half_clock 		: out STD_LOGIC;
		   quarter_clock	: out STD_LOGIC;
		   tenth_clock		: out STD_LOGIC;
			locked 			: out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clock_in 				: std_logic := '0';
	signal half_clock				: STD_LOGIC := '0';
	signal quarter_clock 		: STD_LOGIC := '0';
	signal tenth_clock	 		: STD_LOGIC := '0';
   signal enable 					: std_logic := '1';
   signal reset_n 				: std_logic := '1';
   signal d_in 					: std_logic := '0';

 	--Outputs
   signal q_out : std_logic;
   signal Q : std_logic_vector(7 downto 0);
	signal locked : std_logic;

   --! Clock period definitions
   constant clock_in_period : time := 100 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: clk_tester PORT MAP (
						 clock_in => clock_in,
						 enable => enable,
						 reset_n => reset_n,
						 d_in => d_in,
						 q_out => q_out,
						 Q => Q,
						 half_clock => half_clock,
						 quarter_clock	=> quarter_clock,
						 tenth_clock => tenth_clock,
						 locked => locked
        );

   --! Clock process definitions
   clock_in_process :process
   begin
		clock_in <= '0';
		wait for clock_in_period/2;
		clock_in <= '1';
		wait for clock_in_period/2;
   end process;
 

   --! Stimulus process
   stim_proc: process
   begin		
		
      --! hold reset state for 100 ns.
      wait for clock_in_period*50;

      --! insert stimulus here 
		d_in <= '1' after 50 ns, '0' after 300 ns;
      wait;
   end process;

END;
