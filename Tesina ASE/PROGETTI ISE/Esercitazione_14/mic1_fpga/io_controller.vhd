----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    22:37:42 02/28/2019 
--! Design Name: 
--! Module Name:    io_controller - Behavioral 
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
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;

----! Uncomment the following library declaration if instantiating
----! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity io_controller is
	Port ( 	CLOCK			: in 	std_logic	:= '0'; 	--clock
				IO_SWITCH	: in 	std_logic 	:= '0';	--selettore componente_io '1' switch e led, '0' uart
				CE				: in 	STD_LOGIC 	:= '0';	
				RD				: in 	std_logic 	:= '0';  --	segnale di lettura
				WR				: in 	std_logic 	:= '0';	--	segnale di scrittura
				RXD			: in 	std_logic 	:= '1'; 	--	rxd seriale
				START_READ	: in  STD_LOGIC	:= '0';	--! avvia la lettura  dagli switch 
				SWITCH		: in 	STD_LOGIC_VECTOR (7 downto 0);
				TXD			: out std_logic 	:= '1';  --txd seriale
				LEDS			: out std_logic_vector(7 downto 0); --eco sui led del carattere ricevuto
				anodes 			: out STD_LOGIC_VECTOR (7 downto 0);	--! Uscita che pilota gli anodi
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0);	--! Uscita che pilota i catodi
				IO_MDR		: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"  --verso il data bus a 32 bit
		);
end io_controller;


architecture Behavioral of io_controller is

	component io_switch_led_display 
		Port (	CLOCK				: in std_logic	:= '0'; 	--! clock
					CE					: in std_logic := '0'; 	--! chip enable del componente
					RD					: in std_logic := '0'; 	--! segnale di lettura
					WR					: in std_logic := '0';	--! segnale di scrittura
					START_READ		: in STD_LOGIC	:= '0';	--! avvia la lettura dagli switch, come se premessimo enter quando usiamo l'uart
					ENABLE_DISPLAY : in STD_LOGIC := '1';
					SWITCH 			: in std_logic_vector(7 downto 0);
					LEDS				: out std_logic_vector(7 downto 0) := (others => '0');
					anodes 			: out STD_LOGIC_VECTOR (7 downto 0);	--! Uscita che pilota gli anodi
					cathodes			: out STD_LOGIC_VECTOR (7 downto 0);		--! Uscita che pilota i catodi
					IO_MDR			: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"  --verso il data bus a 32 bit
			);
	end component;
	
	component if_uart 
		Port ( 	CK			: in 	std_logic := '0'; --clock
					CE_UART	: in 	std_logic := '0'; --chip enable del componente
					RD			: in 	std_logic := '0'; --segnale di lettura
					WR			: in 	std_logic := '0';	--segnale di scrittura
					RXD		: in 	std_logic := '1'; --rxd seriale
					TXD		: out std_logic := '1'; --txd seriale
					IO_MDR	: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"  --verso il data bus a 32 bit
				);
	end component;

	signal	io_mdr_led_switch,io_mdr_uart :  std_logic_vector(31 downto 0):=x"00000000";
	signal 	ce_led_switch,ce_uart			:	STD_LOGIC :='0'; 
	signal 	leds_io : STD_LOGIC_VECTOR (7 downto 0);
	
begin
	
	--! abilito i led, gli switch e i display solo quando voglio usarli e CE è alto
	ce_led_switch 	<= CE and io_switch; 
	
	--! serve per spegnere i led quando uso uart
	leds <= leds_io when (IO_SWITCH = '1') else (others => '0');
	
	inst_switch_led_display: io_switch_led_display PORT MAP(	--! controller per switch, led e display
		CLOCK 		=> CLOCK,
		CE 			=> ce_led_switch,	--! uso led, switch e display solo quando ce_led_switch è basso
		RD 			=> RD,
		WR				=> WR,
		LEDS 			=> leds_io,
		switch 		=> switch,
		IO_MDR 		=> io_mdr,
		ANODES		=> ANODES,
		CATHODES		=> CATHODES,
		enable_display => IO_SWITCH,
		start_read 	=> start_read
	);
	
	--! abilito l'uart solo quando voglio usarlo e CE è alto
	ce_uart 			<= CE and not io_switch;
	
	Inst_if_uart: if_uart PORT MAP(	--! uart	
		TXD 		=> TXD,
		RXD		=> RXD,
		CK 		=> CLOCK,
		CE_UART 	=> ce_uart,	--! uso UART solo quando ce_uart è alto
		IO_MDR 	=> io_mdr,
		RD 		=> RD,
		WR 		=> WR
	);

end Behavioral;

