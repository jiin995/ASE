
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
