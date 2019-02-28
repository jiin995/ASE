----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    16:17:31 01/12/2008 
-- Design Name: 
-- Module Name:    sistema_mic1 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity sistema_mic1 is
port(
		RXD : IN std_logic;
		TXD : OUT std_logic;
	  	ck : IN std_logic;
		led : OUT std_logic_vector ( 7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		IO_SWITCH	: in STD_LOGIC;
		read_led : out STD_LOGIC;
		start_read : In STD_LOGIC

);
end sistema_mic1;

architecture Behavioral of sistema_mic1 is

	COMPONENT if_uart
	PORT(
		RXD : IN std_logic;
		CK : IN std_logic;
		CE_UART : IN std_logic;
		RD : IN std_logic;
		WR : IN std_logic;    
		IO_MDR : INOUT std_logic_vector(31 downto 0);      
		TXD : OUT std_logic
		);
	END COMPONENT;

	COMPONENT mic1
	PORT(
		cki : IN std_logic;
		ingresso_mbr : IN std_logic_vector(7 downto 0);    
		io_mdr : INOUT std_logic_vector(31 downto 0);      
		uscita_mar : OUT std_logic_vector(31 downto 0);
		uscita_pc : OUT std_logic_vector(31 downto 0);
		wr : OUT std_logic;
		rd : OUT std_logic;
		fetch : OUT std_logic
		);
	END COMPONENT;

	COMPONENT boot_rom
	PORT(
		ADDRESS : IN std_logic_vector(8 downto 0);   
		CE : in std_logic;
		DATA : INOUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT ram
	generic (
	 ADDR_WIDTH : integer :=7 ;
	 DATA_WIDTH : integer :=32
	) ;	
	PORT(
		cs : IN std_logic;
		ck : IN std_logic;
		we : IN std_logic;
		rd : IN std_logic;
		addr : IN std_logic_vector(6 downto 0);       
		data : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT cpool_rom
	PORT(
		ADDRESS : IN std_logic_vector(4 downto 0);
		CE : IN std_logic;       
		DATA : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT decodifica_indirizzi
	PORT(
		address : IN std_logic_vector(31 downto 0);          
		ce_uart : OUT std_logic;
		ce_rom : OUT std_logic;
		ce_ram : OUT std_logic
		);
	END COMPONENT;

	COMPONENT divisore_freq
	PORT(
		clk : IN std_logic;          
		clk_div : OUT std_logic
		);
	END COMPONENT;

component io_switch_led 
	Port (	CK		: in std_logic:= '0'; --clock
		  	CE_UART		: in std_logic 	:= '0'; --chip enable del componente
			IO_MDR	: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";  --verso il data bus a 32 bit
		 	RD		: in std_logic 	:= '0';  --segnale di lettura
			LEDS	: out std_logic_vector(7 downto 0) := "01010101"; --eco sui led del carattere ricevuto
			SWITCH : in std_logic_vector(7 downto 0);
		  	WR		: in std_logic 	:= '0';--segnale di scrittura
			START_READ : In STD_LOGIC
			);
end component;

component io_controller_v2
	Port ( 	CLOCK			: in 	std_logic	:= '0'; 	--clock
				IO_SWITCH	: in 	std_logic 	:= '0';	--selettore componente_io
				CE				: in 	STD_LOGIC 	:= '0';	
				RD				: in 	std_logic 	:= '0';  --	segnale di lettura
				WR				: in 	std_logic 	:= '0';	--	segnale di scrittura
				RXD			: in 	std_logic 	:= '1'; 	--	rxd seriale
				START_READ	: in  STD_LOGIC	:= '0';	-- avvia la lettura per gli switch 
				SWITCH		: in 	STD_LOGIC_VECTOR (7 downto 0);
				TXD			: out std_logic 	:= '1';  --txd seriale
				LEDS			: out std_logic_vector(7 downto 0) := "01010101"; --eco sui led del carattere ricevuto
				IO_MDR		: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"  --verso il data bus a 32 bit

		);
end component;

--signal	ADDRESS_sig :std_logic_vector(6 downto 0);
signal	CE_sig :  std_logic;       
signal	DATA_sig : std_logic_vector(7 downto 0);
signal	ingresso_mbr_sig : std_logic_vector(7 downto 0);    
signal	leds_sig : std_logic_vector(7 downto 0);    

signal	io_mdr_sig : std_logic_vector(31 downto 0);      
signal	uscita_mar_sig :  std_logic_vector(31 downto 0);
signal	uscita_pc_sig :  std_logic_vector(31 downto 0);
signal	wr_sig :  std_logic;
signal	rd_sig :  std_logic;
signal	fetch_sig :  std_logic;
signal	CE_rom_cpool :  std_logic;       
signal	CE_ram_locvarframe_opstack :  std_logic;       
signal	CE_uart_signal :  std_logic;       
signal	ce_led :  std_logic;       
signal	ce_uart :  std_logic;       
signal	ck_signal :  std_logic; 

signal start_int : STD_LOGIC;

begin


	Inst_divisore_freq: divisore_freq PORT MAP(
		clk_div => ck_signal,
		clk => ck
	);

	Inst_mic1: mic1 PORT MAP(
		cki => ck_signal,
		uscita_mar => uscita_mar_sig,
		io_mdr => io_mdr_sig,
		uscita_pc => uscita_pc_sig,
		ingresso_mbr => ingresso_mbr_sig,
		wr => wr_sig,
		rd => rd_sig,
		fetch => fetch_sig
	);

	Inst_boot_rom: boot_rom PORT MAP(
		ADDRESS => uscita_pc_sig(8 downto 0),
		CE => fetch_sig,
		DATA => ingresso_mbr_sig
	);




	Inst_ram: ram 
	generic map(
		ADDR_WIDTH => 7,
		DATA_WIDTH => 32		  
	)	
	PORT MAP(
		cs => CE_ram_locvarframe_opstack,
		ck => ck_signal,
		we => wr_sig,
		rd => rd_sig,
		addr => uscita_mar_sig(8 downto 2),
		data => io_mdr_sig 
	);

	Inst_cpool_rom: cpool_rom PORT MAP(
		ADDRESS => uscita_mar_sig(6 downto 2),
		DATA => io_mdr_sig,
		CE => CE_rom_cpool
	);

	Inst_decodifica_indirizzi: decodifica_indirizzi PORT MAP(
		address => uscita_mar_sig,
		ce_uart => CE_uart_signal,
		ce_rom => CE_rom_cpool,
		ce_ram => CE_ram_locvarframe_opstack
	);


ce_uart <= CE_uart_signal and not io_switch;
	Inst_if_uart: if_uart PORT MAP(
		TXD => TXD,
		RXD => RXD,
		CK => ck_signal,
		CE_UART => ce_uart,--CE_uart_signal,
		IO_MDR => io_mdr_sig,
		RD => rd_sig,
		WR => wr_sig
	);
	
ce_led <= CE_uart_signal and io_switch;
	inst_io_controller: io_switch_led PORT MAP(
		CK => ck_signal,
		CE_UART => ce_led, --CE_uart_signal,
		IO_MDR => io_mdr_sig,
		RD => rd_sig,
		LEDS => led,
		switch => sw,
		WR => wr_sig,
		start_read => start_read
	);

--	inst_io_controller: io_controller_v2 PORT MAP(
--		CLOCK => ck_signal,
--		CE => CE_uart_signal,
--		IO_MDR => io_mdr_sig,
--		RD => rd_sig,
--		LEDS => led,
--		switch => sw,
--		RXD	=> RXD,
--		TXD	=> TXD,
--		IO_SWITCH => IO_SWITCH,
--		WR => wr_sig,
--		start_read => start_read
--	);

read_led <= start_read; 
	
end Behavioral;

