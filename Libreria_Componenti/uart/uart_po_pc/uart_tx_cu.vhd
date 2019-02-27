library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_tx_cu is 
    port (
            clock   				: in  STD_LOGIC;
            reset   				: in  STD_LOGIC;
				tx_start				: in  STD_LOGIC;
            tick_hit    		: in  STD_LOGIC;    -- segnale dal bound rate gen 
				stop_hit				: in 	STD_LOGIC;
				sended_byte_hit	: in  STD_LOGIC;
				tx_in					: in 	STD_LOGIC;	
				enable_stop			: out STD_LOGIC;
				enable_tick			: out STD_LOGIC;
				increase_n_bits 	: out STD_LOGIC;
				send_tx				: out STD_LOGIC;
				load_din				: out STD_LOGIC;		-- 0 attivo carica nella scan chain din
				reset_out 			: out STD_LOGIC;
				reset_scan			: out STD_LOGIC;
				tx_out				: out STD_LOGIC;
				reset_tick			: out STD_LOGIC;
            tx_done 				: out STD_LOGIC
		);
end uart_tx_cu;

architecture Behavioral of uart_tx_cu is

type state is (idle,start,send,stop);
signal current_state,state_next : state := idle;

begin

process (clock,reset) begin
	if( reset = '1') then					-- reset asincrono
		current_state 	<= idle;
	elsif ( rising_edge (clock)) then 	-- aggiorno lo stato
		current_state 	<= state_next;
	end if;
end process ;

process (current_state, tick_hit, sended_byte_hit, stop_hit, tx_start) 
begin

   --se non ci sono variazioni rimane nella configurazione precedente
	state_next 			<= current_state;
	tx_done				<= '0';
	enable_stop 		<= '0';
	increase_n_bits 	<= '0';
	send_tx				<= '0';
	load_din				<= '1';
	reset_out 			<= '0';
	reset_scan			<= '0';
   tx_done 				<= '0';
	tx_out 				<= '1';
	enable_tick			<= '1';
	reset_tick			<= '0';
	
	case (current_state ) is 
		when idle =>
			load_din	<= '0'; 	-- carico nella scan chain il byte da inviare
			enable_stop <= '1';
			reset_tick <= '1';
			if tx_start = '1' then					-- inizio la trasmissione quando il dato è fissato nel buffer
				tx_out 	<= '0';
				state_next 	<= start;
			end if;
			
		when start =>	
			-- abbasso la linea per segnalare al ricevente l'inizio della trasmissione
			tx_out 		<= '0';
			enable_tick	<= '1';
			load_din		<= '0';
			send_tx		<= '1';	-- clock della scan chain
			reset_out	<= '1';
			if ( tick_hit = '1' ) then 
				-- aspetto per poter iniziare la trasmissione
				state_next	<= send;

			end if;
		
		when send => 
			-- invio il LSb che ancora devo inviare
			tx_out <= tx_in;
			enable_tick	<= '1';
			if ( tick_hit = '1' ) then 
				send_tx				<= '1';
				increase_n_bits 	<= '1';
				if ( sended_byte_hit = '1' ) then 
					state_next <= stop ;
				end if;
			end if;
			
		-- stato finale devo aspettare un certo numero di tick per terminare portarmi nello stato di idle
		when stop => 
			enable_stop <= '1';
			enable_tick	<= '1';
			reset_tick <= '1';
			if ( stop_hit = '1' ) then 
				state_next 	<= idle;
				tx_done 		<= '1';
			end if;
			
	end case;
end process;


end Behavioral;



