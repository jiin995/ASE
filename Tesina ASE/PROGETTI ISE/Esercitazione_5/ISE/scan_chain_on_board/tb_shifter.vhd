LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_shifter IS
END tb_shifter;
 
ARCHITECTURE behavior OF tb_shifter IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT scan_chain
    PORT(
         d_reg : IN  std_logic_vector(7 downto 0);
         scan_in : IN  std_logic;
         scan_en : IN  std_logic;
         en : IN  std_logic;
         reset_n : IN  std_logic;
         clock : IN  std_logic;
         scan_out : OUT  std_logic;
         q_reg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d_reg : std_logic_vector(7 downto 0) := (others => '0');
   signal scan_in : std_logic := '0';
   signal scan_en : std_logic := '0';
   signal en : std_logic := '0';
   signal reset_n : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal scan_out : std_logic;
   signal q_reg : std_logic_vector(7 downto 0);

   --! Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: scan_chain PORT MAP (
          d_reg => d_reg,
          scan_in => scan_in,
          scan_en => scan_en,
          en => en,
          reset_n => reset_n,
          clock => clock,
          scan_out => scan_out,
          q_reg => q_reg
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

      --! insert stimulus here 
		
		d_reg <= x"07";
		scan_en <= '0';
		en <= '1';
		scan_in <= '0';
		reset_n <= '1';
		wait for clock_period*2;
		scan_en <= '1', '0' after 40 ns;

      wait;
   end process;

END;
