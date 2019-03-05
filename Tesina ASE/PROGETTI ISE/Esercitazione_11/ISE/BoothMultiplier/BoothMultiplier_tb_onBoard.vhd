
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BoothMultiplier_tb_onBoard IS
END BoothMultiplier_tb_onBoard;
 
ARCHITECTURE behavior OF BoothMultiplier_tb_onBoard IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT booth_multiplier_onBoard
    PORT(
         clock : IN  std_logic;
			--clock_booth: IN std_logic;
         start : IN  std_logic;
         start_led : OUT  std_logic;
         stop : OUT  std_logic;
         enable_a : IN  std_logic;
         enable_b : IN  std_logic;
         subtract : IN  std_logic;
         input : IN  std_logic_vector(3 downto 0);
         overflow : OUT  std_logic;
         c_out : OUT  std_logic;
         anodes : OUT  std_logic_vector(7 downto 0);
         cathodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
   signal enable_a : std_logic := '0';
   signal enable_b : std_logic := '0';
   signal subtract : std_logic := '0';
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal start_led : std_logic;
   signal stop : std_logic;
   signal overflow : std_logic;
   signal c_out : std_logic;
   signal anodes : std_logic_vector(7 downto 0);
   signal cathodes : std_logic_vector(7 downto 0);

   --! Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: booth_multiplier_onBoard PORT MAP (
          clock => clock,
			--! clock_booth => clock,
          start => start,
          start_led => start_led,
          stop => stop,
          enable_a => enable_a,
          enable_b => enable_b,
          subtract => subtract,
          input => input,
          overflow => overflow,
          c_out => c_out,
          anodes => anodes,
          cathodes => cathodes
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
		input <= x"4", x"3" after 40 ns ;
		enable_a <= '1' after 20 ns , '0' after 40 ns ;
		enable_b <= '1' after 40 ns , '0' after 60 ns ;
		
		start <= '1' after 60 ns , '0' after 80 ns ;
		
      wait for clock_period*10;


      wait;
   end process;
	
	END;
