---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : uart_PO_PC
--
-- unit name: uart_tx.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Parte di trasmissione dell'UART
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

entity uart_tx is 
	generic	( 	data_bits   : NATURAL := 8;		--! Numero di bit dati
					ticks			: NATURAL := 16;
					start_Ticks	: NATURAL := 7;
					stop_Ticks  : NATURAL := 16		--! Numero di conteggi per determinare la fine della trasmissione
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
					tx_start				: in  STD_LOGIC;		--! segnale che indica che la trasmissione deve iniziare	
					tick_hit    		: in  STD_LOGIC;    	--! raggiungimento dei 16 conteggi per inviare 
					stop_hit				: in 	STD_LOGIC;		--! hit dello stop counter
					sended_byte_hit	: in  STD_LOGIC;		--! alto quando ho inviato un byte
					bit_to_send			: in  STD_LOGIC;		--! bit in ingresso da po , è l'uscita della scan chain ed è il bit da inviare 
					load_din				: out STD_LOGIC;		--	segnala alla scan chain di caricare il byte da inviare
					increase_n_bits 	: out STD_LOGIC;		--! incrementa il contatore del numero di bit inviati
					send_tx				: out STD_LOGIC;		--! indica alla scan chain di eseguire uno shif, il bit in uscita sarà il prossimo ad essere inviato
					reset_out 			: out STD_LOGIC;		--! resetta i contatori tranne il tick counter
					tx_out				: out STD_LOGIC;		--! uscita tx dalla cu, perchè la cu in baso allo stato deve decidere se tx deve essere alta, bassa o inviare il bit 
					reset_tick			: out STD_LOGIC;		--! resetta il tick counter
					tx_done 				: out STD_LOGIC		--! segnala la fine dell'invio
			);
	end component;

	component uart_tx_po is
		generic	( 	data_bits   : NATURAL := 8;		--! Numero di bit dati
						ticks			: NATURAL := 16;
						start_Ticks	: NATURAL := 7;
						stop_Ticks  : NATURAL := 16		--! Numero di conteggi per determinare la fine della trasmissione
		  );	
		 port		(	clock					: in 	STD_LOGIC;
						reset					: in 	STD_LOGIC;
						enable				: in 	STD_LOGIC;
						sended_bit			: in  STD_LOGIC;	--! quando va alto, viene incrementato il contatore del numero di bit inviati	
						send_tx				: in  STD_LOGIC;	--! quando va alto si esegue uno shift nella scan chain
						tx_done				: in  STD_LOGIC;	--! quando va alto si aggiorna lo stato del buffer, segnala la fine della trasmissione, il buffer è svuotato
						wr_uart				: in  STD_LOGIC;	--! quando va alto si idica alla parte di trasmissione che si vuole inviare il byte che si trova su byte_to_send
						tx_in					: in  STD_LOGIC;	--! tx in ingresso dalla pc ed è quello che deve essere inviato su tx
						load_din				: in  STD_LOGIC;	--	scan en della scan chain, quando è basso carica il byte nella scan chain
						reset_tick			: in  STD_LOGIC;	--! resetta il tick counter
						byte_to_send		: in 	STD_LOGIC_VECTOR ( ( data_bits-1 ) downto 0); 	--! byte da inviare
						tx						: out STD_LOGIC;	--! linea in uscita
						bit_to_send			: out STD_LOGIC;	--! bit da invare , viene trasmesso al pc 
						tx_full				: out STD_LOGIC;	--! va alto quando il buffer per inviare è pieno, va basso quando viene svuotato
						sended_byte_hit	: out STD_LOGIC;	--! va alto quando è stato inviato tutto il byte
						tick_hit				: out STD_LOGIC;	--! va alto quando si raggiungono i 16 conteggi del tick counter
						stop_hit				: out STD_LOGIC	--! va alto quando si raggiungono i conteggi dello stop counter 
						
		);
	end component;
	
	signal sended_bit, send_tx, tx_done, reset_po,sended_byte_hit, tick_hit,
		stop_hit, tx_full_int, reset_out, load_din, tx_in_po, tx_out_po,reset_tick: STD_LOGIC := '0';

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
											sended_bit			=> sended_bit,
											send_tx				=> send_tx,
											tx_done				=> tx_done,
											wr_uart				=> wr_uart,
											tx						=> tx,
											load_din				=> load_din,
											byte_to_send		=> din,
											tx_full				=> tx_full_int,
											sended_byte_hit	=> sended_byte_hit,
											tx_in					=> tx_in_po,
											bit_to_send			=> tx_out_po,
											tick_hit				=> tick_hit,
											reset_tick			=> reset_tick,
											stop_hit				=> stop_hit						
							);
							
	uart_cu_inst : uart_tx_cu  
						port 		map(	clock   				=> clock,
											reset   				=> reset,
											tx_start				=> tx_full_int,
											tick_hit    		=> tick_hit,
											stop_hit				=> stop_hit,
											sended_byte_hit	=> sended_byte_hit,
											increase_n_bits 	=> sended_bit,
											load_din				=> load_din,
											send_tx				=> send_tx,
											reset_out 			=> reset_out,
											bit_to_send			=> tx_out_po,
											tx_out				=> tx_in_po,
											reset_tick			=> reset_tick,
											tx_done 				=> tx_done
									);

end Behavioral;

