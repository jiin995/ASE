----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:45 02/25/2019 
-- Design Name: 
-- Module Name:    uart - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	 use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart is
	 generic (data_bits : NATURAL := 8);
	Port 		( clock 		: in  STD_LOGIC;
				  reset		: in  STD_LOGIC;
				  rx 			: in  STD_LOGIC;
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
            rx      : in  STD_LOGIC;	 									-- bit ricevuto
            rx_done : out STD_LOGIC;	 									-- va alto quando è stato ricevuto un byte
            dout    : out STD_LOGIC_VECTOR (data_bits-1 downto 0)	-- byte ricevuto
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

component uart_tx is 
    generic(
        data_bits   : NATURAL := 8;
        stop_Ticks  : NATURAL := 16
     );
    port (
            clock   : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
				tx_start: in  STD_LOGIC;
            tick    : in  STD_LOGIC;    -- segnale dal bound rate gen 
		      din     : in  STD_LOGIC_VECTOR (data_bits-1 downto 0);
            tx_done : out STD_LOGIC;
				tx      : out STD_LOGIC
		);
end component;

signal enable_int 					: STD_LOGIC := '1';
signal reset_n, tick 				: STD_LOGIC := '0';
signal rx_done_int, tx_done_int, rx_empty_int, tx_full_int, tx_start_int 	: STD_LOGIC := '0';	
signal received_byte, send_byte	: STD_LOGIC_VECTOR ( 7 downto 0 ) := ( others => '0');

begin

	reset_n <= not reset;

--	baud_generator: counter_UpN_Re_Sr  
--		generic map	(   n       => 651)
--		port map		(  enable      => enable_int ,                               
--							reset_n     => reset_n ,                                
--							clock       => clock,                                
--							count_hit   => tick,                             
--							COUNTS      => open    
--					);
	
	uart_rx_inst	: uart_rx port map ( clock   => clock,
													reset   => reset,
													enable  => enable_int,
													rx      => rx,
													rx_done => rx_done_int,
													dout    => dout
												);
													
	rx_empty <= not rx_empty_int;
--	output_buffer : io_buffer port map( clock     => clock,
--														reset   	 => reset,
--														-- quando il byte è stato letto setto lo stato del buffer come vuoto
--														clr_flag  => rd_uart,		
--														-- quando la ricezione si conclude setto lo stato del buffer come pieno
--														set_flag  => rx_done_int,	
--														din       => received_byte,
--														flag      => rx_empty_int,
--														dout      => dout	
--													);
													
--	uart_tx_inst	: uart_tx port map ( clock   => clock,
--													reset   => reset,
--													tx      => tx,
--													tick    => tick, 
--													tx_start=> tx_start_int,
--													tx_done => tx_done_int,
--													din     => send_byte
--												);
--													
--	tx_full <= tx_start_int;
--	
--	input_buffer : io_buffer port map( 	clock      => clock,
--													reset   	 => reset,
--													-- quando il byte è stato inviato setto lo stato del buffer come vuoto
--													clr_flag  => tx_done_int,	
--													-- quando arriva il segnale per inviare setto lo stato del buffer come pieno e carico il byte
--													set_flag  => wr_uart,		
--													din       => din,
--													-- quando il byte è stato caricato segnalo a uart_tx che può inviare 
--													flag      => tx_start_int, 
--													dout      => send_byte								
--											);
end Behavioral;

