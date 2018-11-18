LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter_UpMod2n_Re_Ar_testbench IS
    generic (   n_test : NATURAL :=2
    );
END counter_UpMod2n_Re_Ar_testbench;
 
ARCHITECTURE behavior OF counter_UpMod2n_Re_Ar_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_Upmod2n_Re_Ar is 
    generic ( n : NATURAL :=n_test
    );
    port(   enable      : in STD_LOGIC ;
            reset_n     : in STD_LOGIC;
            clock       : in STD_LOGIC;
            count_hit   : out STD_LOGIC;
            COUNTS      : out STD_LOGIC_VECTOR (((2**n)-1) downto 0)
    );
    end Component;
    

   --Inputs
    signal clock : std_logic := '0';
    signal enable : std_logic := '1';
    signal reset_n : std_logic := '1';

 	--Outputs
    signal count_hit : std_logic;
    signal COUNTS : STD_LOGIC_VECTOR (((2**n_test)-1)downto 0);
   -- Clock period definitions
    constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_UpMod2n_Re_Ar PORT MAP (
          clock => clock,
          enable => enable,
          reset_n => reset_n,
          count_hit => count_hit,
          COUNTS => COUNTS
        );

   -- Clock process definitions
   clock_process: process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;

END;
