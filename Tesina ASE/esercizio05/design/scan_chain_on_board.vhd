----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    14:53:38 02/15/2019 
--! Design Name: 
--! Module Name:    scan_chain_on_board - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scan_chain_on_board is
    Port ( clock 		: in  STD_LOGIC;
		   value 		: in  STD_LOGIC_VECTOR (15 downto 0);
           scan_in 	: in  STD_LOGIC;
           scan_clk	: in 	STD_LOGIC;
		   scan_en 	: in  STD_LOGIC;
		   scan_out 	: out STD_LOGIC;
           anodes 	: out  STD_LOGIC_VECTOR (7 downto 0);
           cathodes	: out  STD_LOGIC_VECTOR (7 downto 0)
		);
end scan_chain_on_board;

architecture Behavioral of scan_chain_on_board is


signal enable_digit 	: STD_LOGIC_VECTOR (7 downto 0)	:= ( others => '1' );
signal enable_int 	: STD_LOGIC := '1';
signal reset 			: STD_LOGIC := '0';
signal reset_n			: STD_LOGIC := '1';
signal dots 			: STD_LOGIC_VECTOR (7 downto 0) 	:= ( others => '0' );
signal values_int		: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0' );
signal d_in 			: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0' );

component scan_chain is
    generic(
			  width : integer := 32;						--! dimensione del registro
			  shift_direction : std_logic := '1'	--! shift a sinistra
	 );
    Port ( clock  	: in  STD_LOGIC;	--! segnale clock di tempificazione
           en 			: in  STD_LOGIC;		--! segnale di abilitazione 1-attivo
		   reset_n 	: in 	STD_LOGIC;	--! segnale di reset 0-attivo
		   scan_en 	: in  STD_LOGIC;										--! segnale di selezione modalità (0 = normale, 1 = controllo)
		   scan_in 	: in  STD_LOGIC;										--! primo valore scan-in 
		   d_reg 		: in  STD_LOGIC_VECTOR (width-1 downto 0);		--! valore in ingresso nel registro
           q_reg 		: out  STD_LOGIC_VECTOR (width-1 downto 0);	--! valore in uscita del registro
           scan_out 	: out  STD_LOGIC							--! ultimo valore scan-out
	);
end component;

component display_7_segmenti is
	port ( 	clock 			: in STD_LOGIC;
				enable 			: in STD_LOGIC;
				reset				: in STD_LOGIC;
				values 			: in STD_LOGIC_VECTOR (31 downto 0);
				dots 				: in STD_LOGIC_VECTOR (7 downto 0) ;
				enable_digit	: in STD_LOGIC_VECTOR (7 downto 0);	
				anodes 			: out STD_LOGIC_VECTOR (7 downto 0);
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

begin

	register_in: scan_chain PORT MAP( clock 		=> scan_clk,
												 en 			=> enable_int,
												 reset_n 	=> reset_n,
												 scan_en 	=> scan_en,							
												 d_reg 		=> d_in,	
												 scan_in 	=> scan_in,					
												 q_reg 		=> values_int,
												 scan_out 	=> scan_out						
										  );
															
	
	
	
	display: display_7_segmenti port map (	clock 			=> clock,
														enable 			=> enable_int,
														reset 			=> reset,
														values 			=> values_int,
														dots 				=> dots,
														enable_digit 	=> enable_digit,
														anodes 			=> anodes,
														cathodes 		=> cathodes
												);
											

end Behavioral;

