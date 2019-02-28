library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity io_switch_led is
	Port (	CK		: in std_logic:= '0'; --clock
		  	CE_UART		: in std_logic 	:= '0'; --chip enable del componente
			IO_MDR	: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";  --verso il data bus a 32 bit
		 	RD		: in std_logic 	:= '0';  --segnale di lettura
			LEDS	: out std_logic_vector(7 downto 0) := "01010101"; --eco sui led del carattere ricevuto
			SWITCH : in std_logic_vector(7 downto 0);
		  	WR		: in std_logic 	:= '0';--segnale di scrittura
			start_read: In STD_LOGIC
			);
end io_switch_led;

architecture Behavioral of io_switch_led is
	
	--dichiarazione stati della fsm di controllo
	type stato_fsm is(
		zero,
		leggendo,
		uno
	);
	
	
	signal state_reg,state_next: stato_fsm;	

	signal	io_mdr_sig :  std_logic_vector(31 downto 0):=x"00000000";
	signal	tx_data_in_sig :  std_logic_vector(7 downto 0):=x"00";
--	signal	tx_data_en_sig :  std_logic:='0';          
	signal	rx_data_out_sig :  std_logic_vector(7 downto 0):=x"00";
--	signal	start_read:  std_logic:='0';
	signal	tx_ch_rdy_sig :  std_logic:='0';
	signal	buffer_rx_sig :  std_logic_vector(7 downto 0):=x"00";
	signal	zero_leggi_sig :  std_logic:='0';          
	
begin

	io_mdr<=io_mdr_sig;
	
	LEDS<=tx_data_in_sig;
	rx_data_out_sig <= switch;
	
	output_buffer:process(ck)  --processo per registro buffer tx in scrittura su uart
	begin
		if(falling_edge(ck))then  --sul fronte di discesa del clock
			if(CE_uart='1' and wr='1')then  --se abilito uart in scrittura
				tx_data_in_sig<=io_mdr(7 downto 0);  --memorizza valore sul data busa
			end if;
		end if;
	end process;
	
	
	input_buffer:process(ck)  --processo per registro buffer rx per dato ricevuto da uart
	begin
		if(rising_edge(ck))then  --sul fronte di salita del clock
			if(start_read ='1')then  --se ho ricevuto un dato
				buffer_rx_sig<=rx_data_out_sig;  --memorizza valore dall'uart
			end if;
		end if;
	end process;

	--mux che manda al data bus dato ricevuto oppure 0 se non ho dato oppure alta impedenza
	io_mdr_sig <= (others => 'Z') when CE_uart='0' else  --uando disabilitata
					  x"00000000" when (CE_uart='1' and rd='1' and zero_leggi_sig='1') else --quando non ho ricevuto dati
					  (x"000000" & buffer_rx_sig) when (CE_uart='1' and rd='1' and zero_leggi_sig='0') else  --quando  ho ricevuto dati
					  (others => 'Z'); --per default


	--FSM per controllo dato emesso in lettura da uart (0 oppure dato ricevuto)
	
	state_register:process(ck)--processo per registro di stato
	begin
		if(rising_edge(ck))then
			state_reg<=state_next;
		end if;
	end process;
	
	logica_stato_futuro:process(state_reg,CE_uart,rd,start_read)--processo per logica calcolo stato futuro
	begin
		case state_reg is
		
			when zero =>
				if(start_read='1')then
					state_next<=leggendo;
				else
					state_next<=zero;
				end if;
	
			when leggendo =>
				if(CE_uart='1' and rd='1')then
					state_next<=uno;
				else
					state_next<=leggendo;
				end if;	

			when uno =>
				if(CE_uart='0')then
					state_next<=zero;
				else
					state_next<=uno;
				end if;					
		end case;
	end process;

	--processo per  calcolo uscite
	logica_uscite:process(state_reg)
	begin
		zero_leggi_sig<='0';  --valore di default
		case state_reg is
			when zero=>
				zero_leggi_sig<='1';
			when uno=>
				zero_leggi_sig<='0';	
			when leggendo=>
				zero_leggi_sig<='0';					
			when others =>
				zero_leggi_sig<='1';				
		end case;
	end process;

end Behavioral;

