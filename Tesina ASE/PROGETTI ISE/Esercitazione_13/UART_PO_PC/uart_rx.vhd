---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : uart_PO_PC
--
-- unit name: uart_rx.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Parte di ricezione dell'UART
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;
	 use IEEE.STD_LOGIC_ARITH.ALL;
	 use IEEE.STD_LOGIC_UNSIGNED.ALL;


--! parte di ricezione dell'UART PC e PO unico blocco
--! versione digiland/ libro


entity uart_rx is 
	generic	( 	data_bits   : NATURAL := 8;		--! Numero di bit dati da ricevere
					ticks			: NATURAL := 16;		--! numero di bit in cui divido l'intervallo di ricezione
					start_Ticks	: NATURAL := 7;		--! numero di tick per posizionarmi al centro dell'intervallo di trasmissione
					stop_Ticks  : NATURAL := 16;		--! Numero di conteggi per determinare la fine della trasmissione
					n				: NATURAL := 651
			);
    port (
            clock  	: in  STD_LOGIC;
				enable  	: in  STD_LOGIC;											--! enable 1-attivo
            reset   	: in  STD_LOGIC;											--! reset 1-attivo
            rx      	: in  STD_LOGIC;	 										--! bit ricevuto
				rd_uart	: in 	STD_LOGIC;											--! lettura del byte ricevuto
            rx_empty	: out STD_LOGIC;	 										--! va basso quando è stato ricevuto un byte
            dout    	: out STD_LOGIC_VECTOR (data_bits-1 downto 0)	--! byte ricevuto
    );
end uart_rx;

architecture structural of uart_rx is 

	component uart_rx_po is
		generic	( 	data_bits   : NATURAL := 8;		--! Numero di bit dati
						ticks			: NATURAL := 16;
						start_Ticks	: NATURAL := 7;
						stop_Ticks  : NATURAL := 16; --! Numero di conteggi per determinare la fine della trasmissione
						N				: NATURAL := 651
		  );	
		port		(	clock					: in 	STD_LOGIC;
						reset					: in 	STD_LOGIC;
						load_tick			: in 	STD_LOGIC;		--! quando va alto carica nel tick counter il valore di preset
						enable				: in 	STD_LOGIC;		
						enable_stop			: in  STD_LOGIC;		--! abilitazione dello stop counter, lo facciamo funzionare solo quando serve
						received_bit		: in  STD_LOGIC;		--! incrementa il contatore che tiene traccia del numero di bit ricevuti
						read_rx				: in  STD_LOGIC;		--! collegato al clock della scan chain, il passaggio 0 -> 1  fa entrare il nuovo bit nella scan chain 
						rx						: in 	STD_LOGIC;		--! linea di ricezione
						rx_done				: in  STD_LOGIC;		--! segnala che la ricezione è avvenuto è che il buffer è effettivamente pieno e pronto per essere consumato
						rd_uart				: in  STD_LOGIC;		--! alto quando si vuole leggere il dato ricevuto e lo invalida dal buffer
						reset_tick			: in  STD_LOGIC;		--! segnale che resetta il tick counter
						rx_empty				: out STD_LOGIC;		--! alto quando il buffer è vuoto 
						rx_out 				: out STD_LOGIC;		--! uscita di rx dalla po
						received_byte_hit	: out STD_LOGIC;		--! hit del contatore che conta il numero di bit ricevuti
						tick_hit				: out STD_LOGIC;		--! hit del conteggio del numero di tick
						stop_hit				: out STD_LOGIC;		--! hit del conteggio del numero di tick per lo stop
						received_byte		: out STD_LOGIC_VECTOR ( ( data_bits-1 ) downto 0)
						
		);
	end component;
	
	component uart_rx_cu is 
		 port (	clock   				: in  STD_LOGIC;
					reset   				: in  STD_LOGIC;
					tick_hit    		: in  STD_LOGIC;   		--! segnale 1/16 del baud rate								
					stop_hit    		: in  STD_LOGIC;   		--! alto quando si è raggiunti il numero di conteggi per lo stop
					received_byte_hit	: in  STD_LOGIC;			--! alto quando ho ricevuto il byte
					rx						: in  STD_LOGIC;			--! linea di ricezione	
					rx_done				: out STD_LOGIC;			--! alto quando ho ricevuto il byte e si resetta quando inizia una nuova ricezione
					increase_n_bits	: out STD_LOGIC;			--! incrementa il contatore che conta il numero di bit ricevuto
					load_tick			: out STD_LOGIC;			--! abilita il caricamento del preset, per la fase di start, nel tick counter
					read_rx 				: out STD_LOGIC;	  		--! collegato al clock della scan chain, il passaggio 0 -> 1  fa entrare il nuovo bit nella scan chain 
					enable_stop			: out STD_LOGIC;			--! abilita il conteggio del numero di tick per lo stop
					reset_tick			: out STD_LOGIC;			--! resetta il tick counter
					reset_out			: out STD_LOGIC			--! resetta la i registri
		 );
	end component ;
	 
    signal load_tick, enable_stop, received_bit, read_rx, rx_done , received_byte_hit, 
		tick_hit, stop_hit,reset_po, reset_out,reset_tick,rx_out_po       : STD_LOGIC := '0';

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
												rx_out				=> rx_out_po,
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
												load_tick			=> load_tick,
												enable_stop 		=> enable_stop,
												tick_hit    		=> tick_hit,										
												stop_hit    		=> stop_hit,								
												received_byte_hit	=> received_byte_hit,
												rx						=> rx_out_po,
												rx_done				=> rx_done,
												increase_n_bits	=> received_bit,
												read_rx 				=> read_rx,
												reset_tick			=> reset_tick,
												reset_out			=> reset_out
									 );

end structural;
