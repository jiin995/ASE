
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uart_testbench IS
END uart_testbench;
 
ARCHITECTURE behavior OF uart_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
component uart is
	 generic (data_bits : NATURAL := 8);
	Port 		( clock 		: in  STD_LOGIC;
				  reset		: in  STD_LOGIC;
				  rx 			: in  STD_LOGIC;
				  --! se alto segnala al buffer in uscita che il dato è stato consumato
				  rd_uart	: in  STD_LOGIC;				
				  --! se alto segnala al buffer in ingresso che il dato è pronto per essere inviato
				  wr_uart	: in  STD_LOGIC;				
				  din 		: in  STD_LOGIC_VECTOR (data_bits-1 downto 0); --byte da inviare
				  tx			: out	STD_LOGIC;
				  rx_empty 	: out STD_LOGIC; 				--! se è il buffer in uscita è vuoto vale 1
				  tx_full 	: out STD_LOGIC;				--! se è il buffer in ingresso è pieno vale 1
				  dout 		: out STD_LOGIC_VECTOR (data_bits-1 downto 0)
	);
end component;

    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';
   signal rd_uart : std_logic := '0';
	signal wr_uart : STD_LOGIC := '0';
	--signal din 		: STD_LOGIC_VECTOR (7 downto 0); --byte da inviare


 	--Outputs
   signal rx_empty : std_logic;
	signal tx_full 	:  STD_LOGIC;				--! se è il buffer in ingresso è pieno vale 1
	signal tx			:	STD_LOGIC;
   signal dout : std_logic_vector(7 downto 0);
	signal dout_internal : std_logic_vector(7 downto 0);


   --! Clock period definitions
   constant clock_period : time := 10 ns;
	constant BAUD : time := 104.17 us;

signal rx_empty_int, tx_full_int :STD_LOGIC := '0';



BEGIN
 
	--! Instantiate the Unit Under Test (UUT)

	rx_empty <= rx_empty_int;
	wr_uart <= not rx_empty_int;
	dout <= dout_internal;
	rd_uart <= tx_full_int;
	uut : uart port map ( 	clock 	=> clock, 
											reset 	=> reset,
											rx			=> rx,
											rx_empty => rx_empty_int,
											tx 		=> tx,
											wr_uart	=> wr_uart,
											din 		=> dout_internal,
											tx_full  => tx_full_int,
											rd_uart 	=> rd_uart,
											dout		=> dout_internal
									);
	tx_full <= tx_full_int;

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
		rx <= '1';
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		--start invio 01100001 97 
		rx <= '1';		
		wait for BAUD;
		rx <= '0';		
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		rx <= '1';
		wait for BAUD;
		rx <= '1';
		wait for BAUD;
		rx <= '0';
		--mark alto
		wait for BAUD;
		rx <= '1';
		
		rx <= '1';
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		--start invio 01100001 97 
		rx <= '1';		
		wait for BAUD;
		rx <= '0';		
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		rx <= '0';
		wait for BAUD;
		rx <= '1';
		wait for BAUD;
		rx <= '1';
		wait for BAUD;
		rx <= '0';
		--mark alto
		wait for BAUD;
		rx <= '1';
		
      wait for clock_period*10;

      --! insert stimulus here 

      wait;
   end process;

END;
