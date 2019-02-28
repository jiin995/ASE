library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;

--uart_tx è il trasmettitore

entity uart_tx is 
    generic(
        data_bits   : NATURAL := 8;	-- numero di bit per ogni trasmissione (tra un mark e l'altro)
        stop_ticks  : NATURAL := 16	-- numero di tick da lasciar passare alla fine della trasmissione di ogni byte
     );
    port (
            clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
				tx_start: in  STD_LOGIC;		-- alto quando deve partire la trasmissione
            tick    : in  STD_LOGIC;   	-- baud rate
		      din     : in  STD_LOGIC_VECTOR (data_bits-1 downto 0);	-- byte da trasmettere
            tx_done : out STD_LOGIC;		-- alto quando la trasmissione è completata
				tx      : out STD_LOGIC			-- linea di trasmissione
		);
end uart_tx;

architecture Behavioral of uart_tx is

	type state is (idle,start,send,stop);
	signal current_state,state_next : state := idle;

	--campiono ogni 16 colpi di tick, 4 bit mi permettono di contare fino a 16 
	signal tick_count,tick_count_next 			: ieee.numeric_std.unsigned ( 3 downto 0 ) := ( others => '0' );

	--numero di bit inviati, 3 bit mi permettono di contare fino a 8
	signal n_sended_bits,n_sended_bits_next 	: ieee.numeric_std.unsigned ( 2 downto 0 ) := ( others => '0' );

	-- byte da inviare
	signal send_bits,send_bits_next 		: STD_LOGIC_VECTOR ( data_bits-1 downto 0);

	--bit sulla linua in uscita
	signal tx_current, tx_next : STD_LOGIC := '0';

begin

	process (clock,reset) begin
		if( reset = '1') then					-- reset asincrono
			current_state 	<= idle;
			tick_count 		<= (others => '0');
			n_sended_bits 	<= (others => '0');
			send_bits		<= (others => '0');
			tx_current 		<= '1';
		elsif ( rising_edge (clock)) then 	-- aggiorno lo stato
			current_state 	<= state_next;
			n_sended_bits 	<= n_sended_bits_next;
			tick_count		<= tick_count_next;
			send_bits 		<= send_bits_next;
			tx_current 		<= tx_next;
		end if;
	end process ;

process (current_state,tick_count,n_sended_bits,send_bits,tx_current,din,tick,tx_start) 
begin

   --se non ci sono variazioni rimane nella configurazione precedente
	state_next 				<= current_state;
	n_sended_bits_next 	<= n_sended_bits;
	send_bits_next			<= send_bits;
	tx_next					<= tx_current;
	tick_count_next		<= tick_count;
	tx_done					<= '0';
	
	case (current_state ) is 
		when idle =>
			tx_next 	<= '1';
			if tx_start = '1' then					-- inizio la trasmissione quando il dato è fissato nel buffer
				state_next 			<= start;
				tick_count_next 	<= (others => '0');
				send_bits_next 	<=	din; 
			end if;
			
		when start =>	
			-- abbasso la linea per segnalare al ricevente l'inizio della trasmissione
			tx_next 		<= '0';
			if ( tick = '1' ) then 
				-- aspetto per poter iniziare la trasmissione
				if ( tick_count = 15 ) then
					state_next		 		<= send;
					tick_count_next 		<= ( others => '0' );
					n_sended_bits_next   <= ( others => '0' );
				else 
					tick_count_next <= tick_count +1;
				end if;
			end if;
		
		when send => 
			-- invio il LSb che ancora devo inviare
			tx_next <= send_bits(0); 
			if ( tick = '1' ) then 
				if ( tick_count = 15 ) then 
					tick_count_next 	<= ( others => '0');
					-- faccio scorrere i bit nel registro per aggiornare il LSb, che sarà il nuovo bit che verrà inviato al prossimo ciclo
					send_bits_next 	<= '0' & send_bits ( (data_bits-1) downto 1 );
					-- controllo se ho inviato tutti i bit
					if ( n_sended_bits = data_bits -1 ) then 
						state_next <= stop ;
					else
						n_sended_bits_next <= n_sended_bits +1 ;
					end if;
				else
					tick_count_next <= tick_count +1;
				end if;
			end if;
			
		-- stato finale devo aspettare un certo numero di tick per terminare portarmi nello stato di idle
		when stop => 
			tx_next <= '1';
			if ( tick = '1' ) then 
				if ( tick_count = stop_ticks-1 ) then 
					state_next 	<= idle;
					tx_done 		<= '1';
				else
					tick_count_next <= tick_count+1;
				end if;
			end if;
			
	end case;
end process;

tx <= tx_current;

end Behavioral;

