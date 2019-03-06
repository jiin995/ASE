----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    11:48:20 02/25/2019 
--! Design Name: 
--! Module Name:    uart_onBoard - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_onBoard is
    Port ( clock 		: in  STD_LOGIC;
			  rx 			: in  STD_LOGIC;
			  rx_empty 	: out STD_LOGIC; --! se è vuoto vale 1
			  tx			: out STD_LOGIC;
			  tx_full	: out STD_LOGIC;
			  --wr_uart	: in STD_LOGIC;
			  --din 		: in STD_LOGIC_VECTOR ( 7 downto 0);
			  anodes 	: out STD_LOGIC_VECTOR ( 7 downto 0);
			  cathodes	: out STD_LOGIC_VECTOR ( 7 downto 0)
);
end uart_onBoard;

architecture Behavioral of uart_onBoard is

component uart is
	 generic (data_bits : NATURAL := 8);
	 Port 	( clock 		: in  STD_LOGIC;
				  reset		: in  STD_LOGIC;
				  rx 			: in  STD_LOGIC;
				  rd_uart	: in  STD_LOGIC;	--! se alto resetta il valore di empty
				  wr_uart	: in 	STD_LOGIC;
				  din 		: in  STD_LOGIC_VECTOR (data_bits-1 downto 0);
				  tx			: out	STD_LOGIC;
				  rx_empty 	: out STD_LOGIC; --! se è vuoto vale 1
				  tx_full 	: out STD_LOGIC;
				  dout 		: out STD_LOGIC_VECTOR (data_bits-1 downto 0)
	);
end component;

component display_7_segments is
	PORT ( 	enable			: in STD_LOGIC;								--! enable del componente
				clock 			: in STD_LOGIC;								--! clock
				reset				: in STD_LOGIC;								--! reset 1-attivo
				values 			: in STD_LOGIC_VECTOR (31 downto 0);	--! Stringa di bit del valore da mostrare
				dots 				: in STD_LOGIC_VECTOR (7 downto 0) ;	--! Segnali che permette di pilotare i punti
				enable_digit	: in STD_LOGIC_VECTOR (7 downto 0);		--! Segnali che attiva le digit
				anodes 			: out STD_LOGIC_VECTOR (7 downto 0);	--! Uscita che pilota gli anodi
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)		--! Uscita che pilota i catodi
	);
end component;

component register_d_Re_Ar is 
    generic(    dimension       :   NATURAL :=8;        --! definisce il parallelismo del registro
                reset_level     :   STD_LOGIC :='0';    --! definisce il livello reset
                enable_level    :   STD_LOGIC := '1'    --! definisce il livello enable
    );

    port(   clock   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale di clock per sincronizzare
            enable  :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale enable
            reset   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale reset
            d       :   in  STD_LOGIC_VECTOR    (dimension-1 downto 0);	--! register_d_Re_Ar input    : inpput data 
            q       :   out STD_LOGIC_VECTOR    (dimension-1 downto 0)	--! register_d_Re_Ar input    : output data
    );
end component;

signal reset 	: STD_LOGIC := '0';
signal value 	: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0');
signal dout,dout_int 	: STD_LOGIC_VECTOR ( 7 downto 0) := ( others => '0');
signal enable 	: STD_LOGIC := '1';
signal enable_digit : STD_LOGIC_VECTOR ( 7 downto 0) := (others => '1');
signal dots : STD_LOGIC_VECTOR ( 7 downto 0 ):= (others => '0');
signal rx_empty_int, rx_empty_n, tx_full_int :STD_LOGIC := '0';


begin

	rx_empty_n <= not rx_empty_int;
	rx_empty <= rx_empty_int;
	 
	tx_full <= tx_full_int;
	value <= x"000000" & dout;
	
	uart_inst : uart port map ( 	clock 	=> clock, 
											reset 	=> reset,
											rx			=> rx,
											rx_empty => rx_empty_int,
											tx 		=> tx,
											wr_uart	=> not rx_empty_int,
											din 		=> dout_int,
											tx_full  => tx_full_int,
											rd_uart 	=> tx_full_int,
											dout		=> dout_int
									);
	register_d:  register_d_Re_Ar 
    port map(   clock   => rx_empty_int,
            enable  => '1',
            reset   => '1',
            d       => dout_int, 
            q       => dout
    );
	display	: display_7_segments port map ( 	enable 			=> enable,	
															clock  			=> clock,
															reset	 			=> reset,
															values 			=> value,
															dots 	 			=> dots,
															enable_digit 	=> enable_digit,
															anodes 		 	=> anodes,
															cathodes 		=> cathodes 
													);
											

end Behavioral;

