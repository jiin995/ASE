LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_fsm_moore IS
END tb_fsm_moore;
 
ARCHITECTURE behavior OF tb_fsm_moore IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fsm_moore
    PORT(
         clock : IN  std_logic;
         value_in : IN  std_logic;
         value_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal value_in : std_logic := '0';

 	--Outputs
   signal value_out : std_logic;

   --! Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: fsm_moore PORT MAP (
          clock => clock,
          value_in => value_in,
          value_out => value_out
        );

   --! Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
      wait for 100 ns;	

      value_in <= '1';
		wait for clock_period;
		
		value_in <= '0';
		wait for clock_period;
		
		value_in <= '1';
		wait for clock_period;
		
		value_in <= '1';
		wait for clock_period;
		
		value_in <= '0';
		wait for clock_period;
		
		value_in <= '0';
		wait for clock_period;
		
		value_in <= '1';
		wait for clock_period;

      wait;
   end process;

END;
