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

entity uart_rx_po is
	generic	( 	data_bits   : NATURAL := 8;		-- Numero di bit dati
					ticks			: NATURAL := 16;
					start_Ticks	: NATURAL := 7;
					stop_Ticks  : NATURAL := 16		-- Numero di conteggi per determinare la fine della trasmissione
     );	
	port		(	clock					: in 	STD_LOGIC;
					reset					: in 	STD_LOGIC;
					load_tick			: in 	STD_LOGIC;
					enable				: in 	STD_LOGIC;
					enable_stop			: in  STD_LOGIC;
					received_bit		: in  STD_LOGIC;
					read_rx				: in  STD_LOGIC;
					rx						: in 	STD_LOGIC;
					rx_done				: in  STD_LOGIC;
					rd_uart				: in  STD_LOGIC;
					reset_tick			: in  STD_LOGIC;
					rx_empty				: out STD_LOGIC;
					received_byte_hit	: out STD_LOGIC;
					tick_hit				: out STD_LOGIC;
					stop_hit				: out STD_LOGIC;
					received_byte		: out STD_LOGIC_VECTOR ( ( data_bits-1 ) downto 0)
					
	);
end uart_rx_po;


architecture Behavioral of uart_rx_po is
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
					  flag      : out  STD_LOGIC			-- segnala lo stato del buffer
		 );
	end component; 

	
	signal reset_n 		: STD_LOGIC := '0';
	signal tick				: STD_LOGIC := '0';
	signal preset_in 		: STD_LOGIC_VECTOR ((integer(ceil(log2(real(ticks)))) -1) downto 0);
	signal rx_empty_int	: STD_LOGIC := '0';
begin

	reset_n <= not reset ;
	
	baud_generator: counter_UpN_Re_Sr  
							generic map	(  n       => 651)
							port map		(  enable      => enable ,                               
												reset_n     => '1' ,                                
												clock       => clock,                                
												count_hit   => tick,                             
												COUNTS      => open    
								);
	
	preset_in <= std_logic_vector(to_unsigned(start_ticks+1,preset_in'length));
	counter_tick : counter_UpN_Re_preset_Sr 
								generic map	( 	n => ticks)
								port map		(	clock			=> tick,
													enable 		=> enable,
													reset_n 		=> not reset_tick,
													load			=> load_tick,
													preset		=> preset_in,
													count_hit	=> tick_hit,
													counts		=> open
										);
										
	counter_stop : counter_UpN_Re_Sr 
								generic map	( 	n => stop_ticks)
								port map		(	clock			=> tick,
													enable 		=> enable_stop,
													reset_n 		=> reset_n,
													count_hit	=> stop_hit,
													counts		=> open
										);
	
	counter_n_bits : counter_UpN_Re_Sr  -- contatore modulo n e dobbiamo contare fino a 8 
								generic map	( 	n => data_bits )
								port map		(	clock			=> received_bit,
													enable 		=> enable,
													reset_n 		=> reset_n,
													count_hit	=> received_byte_hit,
													counts		=> open
										);
											
	received_byte_reg: scan_chain
								generic map ( 	width 	=> data_bits )
								port map		(	clock 	=> read_rx,
													en			=> enable,
													scan_en	=> '1',
													scan_in 	=> rx,
													d_reg		=> ( others => '0'),
													scan_out	=> open,
													q_reg		=> received_byte,
													reset_n 	=> '1'
										);
	
	rx_empty <= not rx_empty_int;
	flag_FF_inst: flag_FF 
								port map(  clock     => clock,
											  reset     => '0',
											  clr_flag  => rd_uart,
											  set_flag  => rx_done,
											  flag      => rx_empty_int
									);

end Behavioral;

