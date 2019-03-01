library IEEE;
	 use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;

entity uart is
	 generic (data_bits : NATURAL := 8);
	Port 		( clock 		: in  STD_LOGIC;
				  reset		: in  STD_LOGIC;
				  rx 			: in  STD_LOGIC;		-- segnale 
				  -- se alto segnala al buffer in uscita che il dato è stato consumato
				  rd_uart	: in  STD_LOGIC;				
				  -- se alto segnala al buffer in ingresso che il dato è pronto per essere inviato
				  wr_uart	: in  STD_LOGIC;				
				  din 		: in  STD_LOGIC_VECTOR (data_bits-1 downto 0); --byte da inviare
				  tx			: out	STD_LOGIC;
				  rx_empty 	: out STD_LOGIC; 				-- se è il buffer in uscita è vuoto vale 1
				  tx_full 	: out STD_LOGIC;				-- se è il buffer in ingresso è pieno vale 1
				  dout 		: out STD_LOGIC_VECTOR (data_bits-1 downto 0)
	);
end uart;

architecture Behavioral of uart is
component uart_rx is 
	generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
					ticks			: NATURAL := 16;
					start_Ticks	: NATURAL := 7;
					stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
			);
    port (
            clock   : in  STD_LOGIC;
				enable  : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            rx      	: in  STD_LOGIC;	 									-- bit ricevuto
				rd_uart	: in 	STD_LOGIC;
            rx_empty	: out STD_LOGIC;	 									-- va alto quando è stato ricevuto un byte
            dout    : out STD_LOGIC_VECTOR (data_bits-1 downto 0)	-- byte ricevuto
    );
end component;

component uart_tx is 
    generic(
        data_bits   : NATURAL := 8;
        stop_Ticks  : NATURAL := 16
     );
    port (	clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
				enable  : in  STD_LOGIC;
				wr_uart : in  STD_LOGIC;
		      din     : in  STD_LOGIC_VECTOR (data_bits-1 downto 0);
				tx_full : out STD_LOGIC;
				tx      : out STD_LOGIC
		);
end component;

signal enable_int 					: STD_LOGIC := '1';
signal reset_n, tick 				: STD_LOGIC := '0';
signal rx_done_int, tx_done_int, rx_empty_int, tx_full_int, tx_start_int 	: STD_LOGIC := '0';	
signal received_byte, send_byte	: STD_LOGIC_VECTOR ( 7 downto 0 ) := ( others => '0');

begin

	reset_n <= not reset;

	uart_rx_inst	: uart_rx port map ( clock   	=> clock,
													reset  	=> reset,
													enable  	=> enable_int,
													rx      	=> rx,
													rx_empty => rx_empty,
													rd_uart	=> rd_uart,
													dout    	=> dout
												);
													
													
	uart_tx_inst	: uart_tx port map ( clock   => clock,
													reset   => reset,
													enable  => enable_int,
													tx      => tx,
													wr_uart => wr_uart,
													tx_full => tx_full,
													din     => din
												);

end Behavioral;

