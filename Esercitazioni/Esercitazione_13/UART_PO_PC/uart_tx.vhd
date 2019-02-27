library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_tx is 
	generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
					ticks			: NATURAL := 16;
					start_Ticks	: NATURAL := 7;
					stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
     );	
    port (
            clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
				enable  : in  STD_LOGIC;
				wr_uart : in  STD_LOGIC;
		      din     : in  STD_LOGIC_VECTOR (data_bits-1 downto 0);
				tx_full : out STD_LOGIC;
				tx      : out STD_LOGIC
		);
end uart_tx;

architecture Behavioral of uart_tx is

	component uart_tx_cu is 
		 port (	clock   				: in  STD_LOGIC;
					reset   				: in  STD_LOGIC;
					tx_start				: in  STD_LOGIC;
					tick_hit    		: in  STD_LOGIC;    -- segnale dal bound rate gen 
					stop_hit				: in 	STD_LOGIC;
					sended_byte_hit	: in  STD_LOGIC;
					tx_in					: in  STD_LOGIC;
					load_din				: out STD_LOGIC;
					enable_stop			: out STD_LOGIC;
					enable_tick			: out STD_LOGIC;
					increase_n_bits 	: out STD_LOGIC;
					send_tx				: out STD_LOGIC;
					reset_out 			: out STD_LOGIC;
					reset_scan			: out STD_LOGIC;
					tx_out				: out STD_LOGIC;
					reset_tick			: out  STD_LOGIC;
					tx_done 				: out STD_LOGIC
			);
	end component;

	component uart_tx_po is
		generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
						ticks			: NATURAL := 16;
						start_Ticks	: NATURAL := 7;
						stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
		  );	
		port		(	clock					: in 	STD_LOGIC;
						reset					: in 	STD_LOGIC;
						enable				: in 	STD_LOGIC;
						enable_stop			: in  STD_LOGIC;
						enable_tick			: in  STD_LOGIC;
						sended_bit			: in  STD_LOGIC;
						send_tx				: in  STD_LOGIC;
						tx_done				: in  STD_LOGIC;
						wr_uart				: in  STD_LOGIC;
						tx_mark				: in  STD_LOGIC;
						tx_in					: in  STD_LOGIC;
						load_din				: in  STD_LOGIC;
						reset_tick			: in  STD_LOGIC;
						byte_to_send		: in 	STD_LOGIC_VECTOR ( ( data_bits-1 ) downto 0);
						tx						: out STD_LOGIC;
						tx_out				: out STD_LOGIC;
						tx_full				: out STD_LOGIC;
						sended_byte_hit	: out STD_LOGIC;
						tick_hit				: out STD_LOGIC;
						reset_scan			: in STD_LOGIC;
						stop_hit				: out STD_LOGIC
						
		);
	end component;
	
	signal enable_stop, enable_tick,sended_bit, send_tx, tx_done, tx_mark, reset_po, reset_scan,
				sended_byte_hit, tick_hit, stop_hit, tx_full_int, reset_out, load_din,tx_in,tx_out,reset_tick: STD_LOGIC := '0';

begin
	tx_full <= tx_full_int;
	reset_po <= reset_out or reset;
	uart_po_inst : uart_tx_po 
						generic	map( 	data_bits   => data_bits,
											ticks			=> ticks,
											start_Ticks	=> start_ticks,
											stop_Ticks  =>	stop_ticks 
							  )
						port		map(	clock					=> clock,
											reset					=> reset_po,
											enable				=> enable,
											enable_stop			=> enable_stop,
											enable_tick			=> enable_tick,
											sended_bit			=> sended_bit,
											send_tx				=> send_tx,
											tx_done				=> tx_done,
											wr_uart				=> wr_uart,
											tx						=> tx,
											tx_mark				=> tx_mark,
											load_din				=> load_din,
											byte_to_send		=> din,
											tx_full				=> tx_full_int,
											sended_byte_hit	=> sended_byte_hit,
											tx_in					=> tx_in,
											tx_out				=> tx_out,
											tick_hit				=> tick_hit,
											reset_scan			=>	reset_scan,
											reset_tick			=> reset_tick,
											stop_hit				=> stop_hit						
							);
							
	uart_pc_inst : uart_tx_cu  
						port 		map(	clock   				=> clock,
											reset   				=> reset,
											tx_start				=> tx_full_int,
											tick_hit    		=> tick_hit,
											stop_hit				=> stop_hit,
											sended_byte_hit	=> sended_byte_hit,
											enable_stop			=> enable_stop,
											enable_tick			=> enable_tick,
											increase_n_bits 	=> sended_bit,
											load_din				=> load_din,
											send_tx				=> send_tx,
											reset_out 			=> reset_out,
											tx_in					=> tx_out,
											tx_out				=> tx_in,
											reset_scan			=> reset_scan,
											reset_tick			=> reset_tick,
											tx_done 				=> tx_done
									);

end Behavioral;

