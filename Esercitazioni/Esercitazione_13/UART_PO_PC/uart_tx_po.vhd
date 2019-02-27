----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:54:30 02/26/2019 
-- Design Name: 
-- Module Name:    uart_rx_po - Behavioral 
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
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tx_po is
	generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
					ticks			: NATURAL := 16;
					start_Ticks	: NATURAL := 7;
					stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
     );	
	port		(	clock					: in 	STD_LOGIC;
					reset					: in 	STD_LOGIC;
					enable				: in 	STD_LOGIC;
					sended_bit			: in  STD_LOGIC;
					send_tx				: in  STD_LOGIC;
					tx_done				: in  STD_LOGIC;
					wr_uart				: in  STD_LOGIC;
					load_din				: in  STD_LOGIC;
					tx_in					: in  STD_LOGIC;
					reset_tick			: in  STD_LOGIC;
					byte_to_send		: in 	STD_LOGIC_VECTOR ( ( data_bits-1 ) downto 0);
					bit_to_send				: out STD_LOGIC;
					tx						: out STD_LOGIC;
					tx_full				: out STD_LOGIC;
					sended_byte_hit	: out STD_LOGIC;
					tick_hit				: out STD_LOGIC;
					stop_hit				: out STD_LOGIC
					
	);
end uart_tx_po;


architecture Behavioral of uart_tx_po is
	component counter_UpN_Re_preset_Sr is 
		 generic (   n               : NATURAL :=4;
						 enable_level    : STD_LOGIC :='1'
		 );
		 port(   enable      : in STD_LOGIC ;                                --! enable input
					reset_n     : in STD_LOGIC;                                 --! reset input
					clock       : in STD_LOGIC;                                 --! clock input
					load 			: in STD_LOGIC;
					preset      : in STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0);
					count_hit   : out STD_LOGIC;                                --! count_hit output
					COUNTS      : out STD_LOGIC_VECTOR((integer(ceil(log2(real(n)))) -1) downto 0)    --! COUNT output
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
            COUNTS      : out STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0)    --! COUNT output
    );
	end component;
	
	component scan_chain is
		generic(	width : integer := 8;									-- dimensione del registro
					shift_direction : std_logic := '0'					-- shift a destra
		);
		Port ( 	clock 		: in  STD_LOGIC;							-- segnale clock di tempificazione
					en 			: in  STD_LOGIC;							-- segnale di abilitazione 1-attivo
					reset_n 		: in  STD_LOGIC;							-- segnale di reset 0-attivo
					scan_en 		: in  STD_LOGIC;							-- segnale di selezione modalità (0 = normale, 1 = controllo)
					scan_in 		: in  STD_LOGIC;							-- primo valore scan-in 
					d_reg 		: in  STD_LOGIC_VECTOR (width-1 downto 0);	-- valore in ingresso nel registro
					scan_out 	: out STD_LOGIC;							-- ultimo valore scan-out
					q_reg 		: out STD_LOGIC_VECTOR (width-1 downto 0)	-- valore in uscita del registro
		);
	end component ;
	
	
	component flag_FF is 
		 port    ( clock     : in  STD_LOGIC;
					  reset     : in  STD_LOGIC;
					  clr_flag  : in  STD_LOGIC;			-- setto lo stato del buffer come vuoto
					  set_flag  : in  STD_LOGIC;			-- setta lo stato del buffer come pieno
					  flag      : out STD_LOGIC			-- segnala lo stato del buffer
		 );
	end component; 

	
	signal reset_n 		: STD_LOGIC := '0';
	signal tick				: STD_LOGIC := '0';
	signal tx_int			: STD_LOGIC := '0';

begin

reset_n <= not reset ;
	tx <= tx_in;
	
	baud_generator: counter_UpN_Re_Sr  
							generic map	(  n       => 651)
							port map		(  enable      => enable ,                               
												reset_n     => '1' ,                                
												clock       => clock,                                
												count_hit   => tick,                             
												COUNTS      => open    
								);
	
	counter_tick : counter_UpN_Re_Sr 
								generic map	( 	n => ticks)
								port map		(	clock			=> tick,
													enable 		=> enable,
													reset_n 		=> not reset_tick,
													count_hit	=> tick_hit,
													counts		=> open
										);
										
	counter_stop : counter_UpN_Re_Sr 
								generic map	( 	n => stop_ticks)
								port map		(	clock			=> tick,
													enable 		=> enable ,
													reset_n 		=> reset_n,
													count_hit	=> stop_hit,
													counts		=> open
										);
	
	counter_n_bits : counter_UpN_Re_Sr  -- contatore modulo n e dobbiamo contare fino a 8 
								generic map	( 	n => data_bits)
								port map		(	clock			=> sended_bit,
													enable 		=> enable,
													reset_n 		=> reset_n,
													count_hit	=> sended_byte_hit,
													counts		=> open
										);
											
	byte_to_sendreg: scan_chain
								generic map ( 	width 	=> data_bits)
								port map		(	clock 	=> send_tx,
													en			=> enable,
													scan_en	=> load_din,
													scan_in 	=> '1',
													d_reg		=> byte_to_send,
													scan_out	=> bit_to_send,
													q_reg		=> open,
													reset_n 	=> '1'
										);
	
	flag_FF_inst: flag_FF 
								port map(  clock     => clock,
											  reset     => '0',
											  clr_flag  => tx_done,
											  set_flag  => wr_uart,
											  flag      => tx_full
									);


end Behavioral;

