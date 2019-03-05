LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY latch_jk_tb IS
END latch_jk_tb;
 
ARCHITECTURE behavior OF latch_jk_tb IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latch_jk
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         Q : OUT  std_logic;
         Qnot : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
	
 	--Outputs
   signal Q : std_logic;
   signal Qnot : std_logic;
	
	
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: latch_jk PORT MAP (
          J => J,
          K => K,
          Q => Q,
          Qnot => Qnot
        );
 

   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
      wait for 50 ns;	

      --! insert stimulus here 
		J<='1' after 240 ns;
		K<='1' after 160 ns, '0' after 500 ns;
		
      wait;
   end process;


END;
