 LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY fsm_mealy_testbench IS
  END fsm_mealy_testbench;

ARCHITECTURE behavioural OF fsm_mealy_testbench IS 

    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fsm_mealy
    PORT(
         clock : IN  BIT;
         x : IN  BIT;
         y : OUT  BIT
        );
    END COMPONENT;
	
	--Inputs
	signal clock : BIT := '0';
	signal value_in : BIT := '0';

 	--Outputs
	signal value_out : BIT := '0';
	
	--! Clock period definitions
	constant clock_period : time := 10 ns;
	
BEGIN

	--! Instantiate the Unit Under Test (UUT)
	uut: fsm_mealy PORT MAP (
          clock => clock,
          x => value_in,
          y => value_out
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

		wait for clock_period*10;
		
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
      --! insert stimulus here 

      wait;
   end process;	

	
END behavioural;
