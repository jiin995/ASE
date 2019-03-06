LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY latch_T_TB IS
END latch_T_TB;
 
ARCHITECTURE behavior OF latch_T_TB IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latch_T
    PORT(
         en : IN  std_logic;
         T : IN  std_logic;
         Q : OUT  std_logic;
         QN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal en : std_logic := '0';
   signal T : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;
   --! No clocks detected in port list. Replace <clock> below with 
   --! appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: latch_T PORT MAP (
          en => en,
          T => T,
          Q => Q,
          QN => QN
        );
 

   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
      wait for 100 ns;	

      --! insert stimulus here 
		en <= '1' after 100 ns, '0' after 300 ns, '1' after 500 ns, '0' after 700 ns;
		T <= '1' after 120 ns, '0' after 200 ns, '1' after 280 ns, '0' after 360 ns, '1' after 400 ns;
      wait;
   end process;

END;
