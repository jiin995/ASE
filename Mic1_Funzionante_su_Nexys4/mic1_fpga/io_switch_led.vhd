library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity io_switch_led is
	Port (	CLOCK				: in std_logic	:= '0'; 	-- clock
				CE					: in std_logic := '0'; 	-- chip enable del componente
				RD					: in std_logic := '0'; 	-- segnale di lettura
				WR					: in std_logic := '0';	-- segnale di scrittura
				START_READ		: in STD_LOGIC	:= '0';	-- avvia la lettura dagli switch, come se premessimo enter quando usiamo l'uart
				SWITCH 			: in std_logic_vector(7 downto 0);
				LEDS				: out std_logic_vector(7 downto 0) := (others => '0');
				IO_MDR			: inout std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"  --verso il data bus a 32 bit
			);
end io_switch_led;

architecture Behavioral of io_switch_led is
	
	--dichiarazione stati della fsm di controllo della lettura
	type stato_fsm is( idle,reading,read_done);
	
	
	signal state_reg,state_next: stato_fsm;	

	signal	io_mdr_sig 		:  std_logic_vector(31 downto 0):=x"00000000";
	signal	output_buffer 	:  std_logic_vector(7 downto 0):=x"00";			-- buffer di output
	signal	switch_in 		:  std_logic_vector(7 downto 0):=x"00";			-- buffer in ingresso dagli switch
	signal	input_buffer 	:  std_logic_vector(7 downto 0):=x"00";			-- buffer di output
	signal	zero_leggi_sig :  std_logic:='0';          
	
begin

	io_mdr		<= io_mdr_sig;
	switch_in 	<= switch;			
	
	leds	<= output_buffer;	-- il buffer in uscita va sui led
	
	out_buffer:process(CLOCK)  --processo per registro buffer tx in scrittura su uart
	begin
		if(falling_edge(CLOCK))then  					--sul fronte di discesa del clock
			if(CE='1' and wr='1')then  				--se abilito il dispositivo in scrittura, output sul buffer in uscita
				output_buffer	<=	io_mdr(7 downto 0);  --memorizza valore sul data bus
			end if;
		end if;
	end process;
	
	
	in_buffer:process(CLOCK)  --processo per lettura nel registro input_buffer dagli switch
	begin
		if(rising_edge(CLOCK))then  					-- sul fronte di salita del clock
			if(start_read ='1')then  					-- se ho ricevuto un dato ed è stato premuto il bottone
				input_buffer	<=	switch_in;  				-- memorizza valore dagli switch
			end if;
		end if;
	end process;
 
	-- mux che manda al data bus:
	-- il dato ricevuto, se il dato è stato inserito (zero_leggi_sig='1'),
	-- 0, se non ho inserito il dato, 0 se non ho ricevuto il dato (zero_leggi_sig='0'), 
	-- alta impedenza altrimenti (es. se CE='0')
	
	-- alta impedenza serve perchè io_mdr è un segnale di io, cioè sia di input che di output, quando il mio 
	-- componente è in alta impedenza gli altri possono usare lo stesso bus condiviso
	
	io_mdr_sig <= (others => 'Z') when CE='0' else  											--quando il dispositivo è disabilitato
					  x"00000000" when (CE='1' and rd='1' and zero_leggi_sig='1') else 	--quando non ho ricevuto dati
					  (x"000000" & input_buffer) when (CE='1' and rd='1' and zero_leggi_sig='0') else  --quando ho ricevuto dati
					  (others => 'Z'); 																	-- default


	--FSM per controllo dello stato di lettura
	
	state_register:process(CLOCK)	--processo per registro di stato
	begin
		if(rising_edge(CLOCK))then
			state_reg<=state_next;
		end if;
	end process;
	
	next_state:process(state_reg,CE,rd,start_read)--processo per logica calcolo stato futuro
	begin
		state_next <= state_reg;
		
		case state_reg is
		
			when idle =>
				if(start_read='1')then		-- start_read='1' indica che la lettura deve partire
					state_next<=reading;
				end if;
	
			when reading =>
				if(CE='1' and rd='1')then	-- rd = '1' indica che la lettura è terminata
					state_next<=read_done;
				end if;	

			when read_done=>
				if(CE='0')then
					state_next<=idle;			-- torno in idle quando disabilito il controller (CE='0')
				end if;					
		end case;
	end process;

	--processo per  calcolo uscite
	logica_uscite:process(state_reg)
	begin
		zero_leggi_sig<='0';  --valore di default
		case state_reg is
			when idle=>
				zero_leggi_sig<='1';	-- non ho il dato nel buffer
			when read_done=>
				zero_leggi_sig<='0';	-- ho il dato nel buffer
			when reading=>
				zero_leggi_sig<='0';					
			when others =>
				zero_leggi_sig<='1';				
		end case;
	end process;

end Behavioral;



