-- parte di ricezione dell'UART PC e PO unico blocco
-- versione digiland/ libro
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_rx_cu is 
    port (	clock   				: in  STD_LOGIC;
            reset   				: in  STD_LOGIC;
            tick_hit    		: in  STD_LOGIC;   										
				stop_hit    		: in  STD_LOGIC;   		-- segnale dal bound rate gen 
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
end uart_rx_cu;

architecture behavioral of uart_rx_cu is 
    type state is (idle,start,receive,stop);
    signal current_state, next_state : state;
	 signal rx_done_int,rx_done_next : STD_LOGIC := '0';

begin 
	
	rx_done <= rx_done_next;
    process (clock, reset) begin
      if reset = '1' then             	-- reset asincrono
			current_state   <= idle;
			rx_done_int		 <= rx_done_next;
		elsif (rising_edge(clock)) then	-- aggiornamento dello stato
         current_state   <= next_state;
      end if;
    end process ;

    process (current_state, tick_hit, stop_hit, rx,  received_byte_hit) begin
        
        --se non ci sono variazioni rimane nella configurazione precedente
        next_state      	<= current_state;
        load_tick_counter	<= '0';
		  increase_n_bits 	<= '0';
        read_rx        		<= '0';
		  reset_out				<= '0';
		  enable_stop_count	<= '0';
		  rx_done_next			<= rx_done_int;
		  reset_tick			<= '0';

        case (current_state) is 
            when idle =>
					 reset_tick <= '1';
                if rx = '0' then    									-- quando rx va a 0 la comunicazione inizia
                    next_state          <= start;
						  load_tick_counter 	 <= '1'; 
                end if;
            
            when start =>
				-- aspetto prima di portarmi in modalità ricezione, per posizionarmi al centro del intervallo di ricezione
				-- mi preparo a ricevere il byte
						enable_stop_count <= '1';
						reset_out	<= '1';	
					if tick_hit = '1' then                        
						next_state  <= receive;	
						rx_done_next<= '0';							
               end if;
        
            when receive =>
					if tick_hit = '1' then 
						-- inserisco rx in cima a received_bits e faccio uscire l'ultimo bit
						read_rx	<= '1';
						increase_n_bits <= '1';
						-- controllo se ho ricevuto tutto il byte
						if ( received_byte_hit = '1' )then                   
							next_state     <= stop;
						end if;                 
					end if;


				-- stato finale devo aspettare un certo numero di tick per terminare portarmi nello stato di idle
            when stop =>      
					enable_stop_count <= '1';
					if ( stop_hit = '1' ) then 
						next_state 	<= idle;
						rx_done_next<= '1';
						reset_out  <= '1';
               end if;
					
        end case;
    end process;

end behavioral;