LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY clock_divisor_testbench IS
END clock_divisor_testbench;
 
ARCHITECTURE behavior OF clock_divisor_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT  clock_divisor is
    generic (   clock_frequency_in  : integer := 450000000;
                clock_frequency_out : integer := 45000000
    );

    port (  enable      :   in STD_LOGIC;
            reset_n     :   in STD_LOGIC;
            clock_in    :   in STD_LOGIC ;
            clock_out   :   out STD_LOGIC 
    );
    end Component;
    

   --Inputs
    signal clock_in : std_logic := '0';
    signal enable : std_logic := '1';
    signal reset_n : std_logic := '1';

 	--Outputs
    signal clock_out : std_logic;
   -- Clock period definitions
    constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_divisor PORT MAP (
          clock_in => clock_in,
          enable => enable,
          reset_n => reset_n,
          clock_out => clock_out
        );

   -- Clock process definitions
   clock_process: process
   begin
		clock_in <= '0';
		wait for clock_period/2;
		clock_in <= '1';
		wait for clock_period/2;
   end process;

--  enable_process: process
--	begin
--		wait for clock_period*5;
--		enable <= not enable;
--	end process;

END;
