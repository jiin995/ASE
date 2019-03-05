LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY anodes_manager_testbench IS
END anodes_manager_testbench;
 
ARCHITECTURE behavior OF anodes_manager_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT anodes_manager
    PORT(
         counter : IN  std_logic_vector(1 downto 0);
         enable_digit : IN  std_logic_vector(3 downto 0);
         anodes : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal counter : std_logic_vector(1 downto 0) := (others => '0');
   signal enable_digit : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal anodes : std_logic_vector(3 downto 0);
   --! No clocks detected in port list. Replace <clock> below with 
   --! appropriate port name 
 
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: anodes_manager PORT MAP (
          counter => counter,
          enable_digit => enable_digit,
          anodes => anodes
        );


   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
		
			enable_digit <= x"1";
			counter <= "00";
			wait for 10 ns;
			enable_digit <= x"2";
			counter <= "00";
			wait for 100 ns;
      --! insert stimulus here 

      wait;
   end process;

END;
