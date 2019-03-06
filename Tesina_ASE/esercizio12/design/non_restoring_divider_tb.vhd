
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY non_restoring_divider_tb IS
	generic ( n : integer := 8);
END non_restoring_divider_tb;
 
ARCHITECTURE behavior OF non_restoring_divider_tb IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT non_restoring_divider
	generic ( n : integer := n);
    PORT(
         X : IN  std_logic_vector(n-1 downto 0);
         Y : IN  std_logic_vector(n-1 downto 0);
         Q : OUT  std_logic_vector(n downto 0);
         R : OUT  std_logic_vector(n-1 downto 0);
         Reset_n : IN  std_logic;
         clock : IN  std_logic;
         start : IN  std_logic;
         stop : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(n-1 downto 0) := (others => '0');
   signal Y : std_logic_vector(n-1 downto 0) := (others => '0');
   signal Reset_n : std_logic := '0';
   signal clock : std_logic := '0';
   signal start : std_logic := '0';
   signal stop : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(n downto 0);
   signal R : std_logic_vector(n-1 downto 0);

BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: non_restoring_divider generic map (n)PORT MAP (
          X => X,
          Y => Y,
          Q => Q,
          R => R,
          Reset_n => Reset_n,
          clock => clock,
          start => start,
          stop => stop
        );

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
		X<="11100100";
		Y<="00001010";
      wait for 10 ns;
		start<='1';
		wait for 20 ns;
		start<='0';

      --! insert stimulus here 
	wait for 1000 ns;
      wait;
   end process;
END;
