---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : uart
--
-- unit name: uart.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente che permette la comunicazione asincrona tra 2 device
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
	 use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;

--! top level entity che utilizza un trasmettitore e ricevitore con opportuni buffer di input e output
--! è in grado di effettuare trasmissione e ricezione

--! TRASMISSIONE
--! per trasmettere si inserisce il byte in din e poi si setta wr_uart alto;
--! una volta settato, set_flag del buffer va alto, così si carica nel buffer il valore din e si alza il flag del buffer;
--! tale flag va a pilotare tx_start dell'uart_tx e fa partire la trasmissione su tx;
--! alla fine della trasmissione, tx_done dell'uart_tx va alto e pilota clear_flag del buffer;
--! il flag del buffer viene così abbassato insieme a tx_start per segnalare lo stato di uart_tx in uscita:
--! tx_full in uscita è infatti pilotato da tx_start_int e segnala se si può scrivere o meno;

--! RICEZIONE
--! quando uart_rx riceve il dato, lo mette nell'output input e alza rx_done_int. Tale segnale
--! pilota il set_flag del buffer, segnalando che il buffer è pieno e il dato può essere consumato.
--! Per leggere si aspetta dunque che rx_empty sia basso, ossia che rx_full sia alto: tale segnale è pilotato
--! dal flag del buffer in uscita, alto solo quando è stato settato con rx_done (ricezione completata).
--! Dopodiché si setta rd_uart a 1, il quale pilota clr_flag del buffer in uscita segnalando che il dato
--! non è più consumabile (flag basso), e si preleva il dato su d_out.


entity uart is
	generic 	(data_bits : NATURAL := 8);
	Port 		( clock 		: in  STD_LOGIC;
				  reset		: in  STD_LOGIC;
				  rx 			: in  STD_LOGIC;
				  rd_uart	: in  STD_LOGIC;  --! se alto segnala al buffer in uscita che il dato è stato consumato
				  wr_uart	: in  STD_LOGIC;	--! se alto segnala al buffer in ingresso che il dato è pronto per essere inviato			
				  din 		: in  STD_LOGIC_VECTOR (data_bits-1 downto 0); --! byte da inviare
				  tx			: out	STD_LOGIC;
				  rx_empty 	: out STD_LOGIC; 				--! se alto il buffer in uscita è vuoto 
				  tx_full 	: out STD_LOGIC;				--! se alto il buffer in ingresso è pieno
				  dout 		: out STD_LOGIC_VECTOR (data_bits-1 downto 0)	--! byte ricevuto
	);
end uart;

architecture Behavioral of uart is
	 
component uart_tx is 
    generic(
        data_bits   : NATURAL := 8;
        stop_Ticks  : NATURAL := 16
     );
    port (
            clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
				tx_start: in  STD_LOGIC;
            tick    : in  STD_LOGIC; 
		      din     : in  STD_LOGIC_VECTOR (data_bits-1 downto 0);
            tx_done : out STD_LOGIC;
				tx      : out STD_LOGIC
		);
end component;

component uart_rx is 
    generic(
        data_bits   : NATURAL := 8;
        stop_Ticks  : NATURAL := 16
     );
    port (  clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            rx      : in  STD_LOGIC;
            tick    : in  STD_LOGIC;    
            rx_done : out STD_LOGIC;
            dout    : out STD_LOGIC_VECTOR (data_bits-1 downto 0)
    );
end component;

component io_buffer is 
    generic ( width : NATURAL := 8 );
    port    ( clock     : in  STD_LOGIC;
              reset     : in  STD_LOGIC;
              clr_flag  : in  STD_LOGIC;
              set_flag  : in  STD_LOGIC;
              din       : in  STD_LOGIC_VECTOR ( (width - 1) downto 0 );
              flag      : out STD_LOGIC;
              dout      : out STD_LOGIC_VECTOR ( (width - 1) downto 0)
    );
end component; 

component counter_UpN_Re_Sr is 
    generic (   n               : NATURAL :=2;
                enable_level    : STD_LOGIC :='1'
    );
    port(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0)    
    );
end component;

signal enable_int 					: STD_LOGIC := '1';
signal reset_n, tick 				: STD_LOGIC := '0';
signal rx_done_int, tx_done_int, rx_full, tx_full_int, tx_start_int 	: STD_LOGIC := '0';	
signal received_byte, send_byte	: STD_LOGIC_VECTOR ( 7 downto 0 ) := ( others => '0');

begin

	reset_n <= not reset;
	tx_full <= tx_start_int;	--! tx è pieno quando tx_start_int è alto (il buffer  di input è pieno)										
	rx_empty <= not rx_full;	--! rx è vuoto quando rx_full è alto (il buffer di output è pieno)

	baud_generator: counter_UpN_Re_Sr  	--! serve a generare un segnale pari a 1/16 del baud rate (bit/s) di rx e tx
													--! fa 16 battiti per bit trasmesso/ricevuto e serve a campionare tali bit
													
		generic map	(   n       => 651)	--! per scegliere n, dato baud rate pari a 9600, lo calcolo come
													--! clock/9600 e poi divido per 16 (per campionare).
													
		port map		(  enable      => enable_int ,                               
							reset_n     => reset_n ,                                
							clock       => clock,                                
							count_hit   => tick,    	--! tick sarà il segnale di campionamento in uscita                          
							COUNTS      => open    
					);
					
					
	input_buffer : io_buffer 		--! buffer in ingresso
									port map( 	clock      => clock,
													reset   	 => reset, 
													clr_flag  => tx_done_int,	--! il ricevitore lo setta alto per resettare il buffer (dopo la trasmissione)
													set_flag  => wr_uart,		--! lo setto alto per segnalare che il buffer è pieno e si può trasmettere
													din       => din,				--! dato in ingresso
													flag      => tx_start_int, --! quando è alto indica che il buffer è pieno e può iniziare la trasmissione (lo mando a tx_start)
													dout      => send_byte		--! dato in uscita	da inviare				
											);
																	
	uart_tx_inst	: uart_tx 		--! trasmettitore
							port map (			clock   => clock,
													reset   => reset,
													tx      => tx,					--! linea di trasmissione
													tick    => tick, 				--! segnale di campionamento
													tx_start=> tx_start_int,	--! va alzato quando vogliamo trasmettere
													tx_done => tx_done_int,		--! alto quando è stato trasmesso un byte
													din     => send_byte			--! byte da trasmettere, lo prende dall'input buffer
												);
	
	uart_rx_inst	: uart_rx		--! ricevitore
							port map ( 			clock   => clock,
													reset   => reset,
													rx      => rx,					--! linea di ricezione
													tick    => tick, 				--! segnale di campionamento
													rx_done => rx_done_int,		--! alto quando è completata la ricezione di un byte
													dout    => received_byte	--! byte ricevuto, lo mette nell'output buffer
												);
												
	output_buffer : io_buffer 		--! buffer in uscita
							port map( 				clock     => clock,
														reset   	 => reset,			
														clr_flag  => rd_uart, 			--! lo setto alto per segnalare che il dato è stato letto	
														set_flag  => rx_done_int,		--! il ricevitore lo setta alto per segnalare che il dato è pronto per essere letto
														din       => received_byte,	--! dato ricevuto da ricevitore
														flag      => rx_full,			--! è alto quando il buffer è pieno
														dout      => dout					--! dato ricevuto da leggere
													);
													
	
	
end Behavioral;

