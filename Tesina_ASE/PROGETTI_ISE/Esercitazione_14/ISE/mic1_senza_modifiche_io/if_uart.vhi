
-- VHDL Instantiation Created from source file if_uart.vhd -- 14:44:54 04/02/2009
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT if_uart
	PORT(
		RXD : IN std_logic;
		CK : IN std_logic;
		CE_UART : IN std_logic;
		RD : IN std_logic;
		WR : IN std_logic;    
		IO_MDR : INOUT std_logic_vector(31 downto 0);      
		TXD : OUT std_logic;
		LEDS : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_if_uart: if_uart PORT MAP(
		TXD => ,
		RXD => ,
		CK => ,
		CE_UART => ,
		IO_MDR => ,
		RD => ,
		LEDS => ,
		WR => 
	);


