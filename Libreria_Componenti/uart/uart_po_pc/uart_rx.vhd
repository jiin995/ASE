-- parte di ricezione dell'UART PC e PO unico blocco
-- versione digiland/ libro
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_rx is 
	generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
					ticks			: NATURAL := 16;
					start_Ticks	: NATURAL := 7;
					stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
			);
    port (
            clock  	: in  STD_LOGIC;
				enable  	: in  STD_LOGIC;
            reset   	: in  STD_LOGIC;
            rx      	: in  STD_LOGIC;	 									-- bit ricevuto
				rd_uart	: in 	STD_LOGIC;
            rx_empty	: out STD_LOGIC;	 									-- va alto quando è stato ricevuto un byte
            dout    	: out STD_LOGIC_VECTOR (data_bits-1 downto 0)	-- byte ricevuto
    );
end uart_rx;

architecture structural of uart_rx is 

	component uart_rx_po is
		generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
						ticks			: NATURAL := 16;
						start_Ticks	: NATURAL := 7;
						stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
		  );	
		port		(	clock					: in 	STD_LOGIC;
						reset					: in 	STD_LOGIC;
						load_tick			: in 	STD_LOGIC;
						enable				: in 	STD_LOGIC;
						enable_stop			: in  STD_LOGIC;
						received_bit		: in  STD_LOGIC;
						read_rx				: in  STD_LOGIC;
						rx						: in 	STD_LOGIC;
						rx_done				: in  STD_LOGIC;
						rd_uart				: in  STD_LOGIC;
						reset_tick			: in  STD_LOGIC;
						rx_empty				: out STD_LOGIC;
						received_byte_hit	: out STD_LOGIC;
						tick_hit				: out STD_LOGIC;
						stop_hit				: out STD_LOGIC;
						received_byte		: out STD_LOGIC_VECTOR ( ( data_bits-1 ) downto 0)
						
		);
	end component;
	
	component uart_rx_cu is 
		 port (	clock   				: in  STD_LOGIC;
					reset   				: in  STD_LOGIC;
					tick_hit    		: in  STD_LOGIC;   										
					stop_hit    		: in  STD_LOGIC;   										-- segnale dal bound rate gen 
					received_byte_hit	: in  STD_LOGIC;
					rx						: in  STD_LOGIC;
					rx_done				: out STD_LOGIC;
					increase_n_bits	: out STD_LOGIC;
					load_tick_counter	: out STD_LOGIC;
					read_rx 				: out STD_LOGIC;	  		-- collegato a scan_en della scan chain
					enable_stop_count : out STD_LOGIC;
					reset_tick			: out STD_LOGIC;
					reset_out			: out STD_LOGIC
		 );
	end component ;
	 
    signal load_tick, enable_stop, received_bit, read_rx, rx_done , received_byte_hit, 
		tick_hit, stop_hit,reset_po, reset_out,reset_tick       : STD_LOGIC := '0';

begin
	reset_po <= reset_out or reset;
	uart_rx_po_inst : uart_rx_po
							generic map ( 	data_bits	=> data_bits,
												ticks			=> ticks,
												start_Ticks	=> start_ticks,
												stop_Ticks  => stop_ticks
								  )
							port	map	(	clock					=> clock,
												reset					=> reset_po,
												load_tick			=> load_tick,
												enable				=> enable,
												enable_stop			=> enable_stop,
												received_bit		=> received_bit,
												read_rx				=> read_rx,
												rx						=> rx,
												rx_done				=> rx_done,
												rd_uart				=> rd_uart,
												rx_empty				=> rx_empty,
												received_byte_hit	=> received_byte_hit,
												tick_hit				=> tick_hit,
												stop_hit				=> stop_hit,
												reset_tick			=> reset_tick,
												received_byte		=> dout
												
							);
							
	uart_rx_cu_inst : uart_rx_cu 
							port map 	(	clock   				=> clock,
												reset   				=> reset,
												tick_hit    		=> tick_hit,										
												stop_hit    		=> stop_hit,								
												received_byte_hit	=> received_byte_hit,
												rx						=> rx,
												rx_done				=> rx_done,
												increase_n_bits	=> received_bit,
												load_tick_counter	=> load_tick,
												read_rx 				=> read_rx,
												enable_stop_count => enable_stop,
												reset_tick			=> reset_tick,
												reset_out			=> reset_out
									 );

end structural;