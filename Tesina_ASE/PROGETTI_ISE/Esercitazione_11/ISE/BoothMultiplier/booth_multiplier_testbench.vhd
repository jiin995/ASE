
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY booth_multiplier_testbench IS
END booth_multiplier_testbench;
 
ARCHITECTURE behavior OF booth_multiplier_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT booth_multiplier
    PORT(
         X : IN  std_logic_vector(7 downto 0);
         Y : IN  std_logic_vector(7 downto 0);
         start : IN  std_logic;
         clock : IN  std_logic;
         reset_n : IN  std_logic;
         stop : OUT  std_logic;
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(7 downto 0) := (others => '0');
   signal Y : std_logic_vector(7 downto 0) := (others => '0');
   signal start : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset_n : std_logic := '1';

 	--Outputs
   signal stop : std_logic;
   signal Z : std_logic_vector(15 downto 0);

   --! Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: booth_multiplier PORT MAP (
          X => X,
          Y => Y,
          start => start,
          clock => clock,
          reset_n => reset_n,
          stop => stop,
          Z => Z
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
		X <= x"04";
		Y <= x"02";
		
		start <= '1' after 20 ns , '0' after 45 ns ;
		
      wait for clock_period*10;

      --! insert stimulus here 

      wait;
   end process;

END;
