library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- parte di ricezione dell'UART PC e PO unico blocco
-- versione digilent/libro

entity uart_rx is 
    generic(
        data_bits   : NATURAL := 8;		-- Numero di bit dati
        stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
     );
    port (
            clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            rx      : in  STD_LOGIC;	 									-- linea di ricezione
            tick    : in  STD_LOGIC;   									-- segnale dal baud rate gen 
            rx_done : out STD_LOGIC;	 									-- va alto quando è stato ricevuto un byte
            dout    : out STD_LOGIC_VECTOR (data_bits-1 downto 0)	-- byte ricevuto
    );
end uart_rx;

architecture behavioral of uart_rx is 
    type state is (idle,start,receive,stop);
    signal current_state, next_state : state;
	 
	 --campiono ogni 16 colpi di tick, 4 bit mi permettono di contare fino a 16 
    signal tick_count,tick_count_next           : ieee.numeric_std.unsigned ( 3 downto 0 ) := ( others => '0' ) ; 
	 
	 --numero di bit ricevuti, 3 bit mi permettono di contare fino a 8
    signal n_received_bits,n_received_bits_next : ieee.numeric_std.unsigned  ( 2 downto 0 ) := ( others => '0' ) ;
	 
	 --byte ricevuto temporaneo
    signal received_bits,received_bits_next     : STD_LOGIC_VECTOR ( data_bits-1 downto 0 ) := ( others => '0' ) ;

begin 
	process (clock,reset) begin			-- processo per il reset e il cambio di stato
		if( reset = '1') then					-- reset asincrono
            current_state   <= idle;
            tick_count      <= ( others => '0' );
            n_received_bits <= ( others => '0' );
            received_bits   <= ( others => '0' );	
        elsif (rising_edge(clock)) then	-- aggiornamento dello stato
            current_state   <= next_state;
            tick_count      <= tick_count_next;
            n_received_bits <= n_received_bits_next;
            received_bits   <= received_bits_next;
        end if;
    end process ;

    process (current_state,n_received_bits,received_bits,tick_count,rx,tick) begin --processo per la scelta dello stato  
        
        --se non ci sono variazioni rimane nella configurazione precedente
        next_state              <= current_state;
        tick_count_next         <= tick_count;
        n_received_bits_next    <= n_received_bits;
        received_bits_next      <= received_bits;
        rx_done                 <= '0';

        case (current_state) is 
            when idle =>
                if rx = '0' then    									-- quando rx va a 0 la comunicazione inizia
                    next_state          <= start;					-- vado in start
                    tick_count_next     <= ( others => '0' );  -- azzero il contatore dei tick
                end if;
            
            when start =>			-- preparazione alla ricezione
                if tick = '1' then
                    if tick_count = 7 then       -- aspetto 7 tick prima di effettuare la ricezione, 
																 -- in modo da campionare il bit ricevuto al centro dell'intervallo 
                        next_state              <= receive;				-- vado in modalità ricezione
                        tick_count_next         <= ( others => '0' );  -- azzero il contatore dei tick
                        n_received_bits_next    <= ( others => '0' );  -- azzero il contatore dei bit ricevuti
								received_bits_next 		<= ( others => '0' ); 	-- azzero i bit ricevuti
                    else 
                        tick_count_next         <= tick_count + 1;  -- se non ho raggiunto il conteggio, incremento
                    end if; 
                end if;
        
            when receive =>	 	-- ricezione	
                if tick = '1' then
						if tick_count = 15 then 	-- controllo se devo campionare rx
                        tick_count_next    <= ( others => '0' );                -- azzero il contatore dei tick
                        received_bits_next <= rx & received_bits ( (data_bits-1) downto 1); -- inserisco rx in cima a received_bits e faccio uscire l'ultimo bit (shift a destra)
                        if n_received_bits = data_bits-1 then    -- controllo se ho ricevuto tutto il byte
                            next_state     <= stop;		-- vado in stop
                        else
                            n_received_bits_next <= n_received_bits + 1;  -- altrimenti incremento il contatore dei bit ricevuti
                        end if;                 
                    else
                        tick_count_next    <= tick_count + 1;
                    end if;
                end if;

            when stop =>   -- stato finale: devo aspettare gli stop_ticks per terminare e portarmi nello stato di idle                                                     
                if tick = '1' then 
                    if tick_count = stop_Ticks-1 then -- trasmessi gli stop ticks, posso tornare in idle
                        next_state <= idle;
                        rx_done    <= '1';
                    else 
                        tick_count_next    <= tick_count + 1;
                    end if;
                end if;
        end case;
    end process;

    dout <= received_bits;

end behavioral;