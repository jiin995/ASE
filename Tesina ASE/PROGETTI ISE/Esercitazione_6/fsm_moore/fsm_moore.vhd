library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_moore is
    Port ( clock : in  STD_LOGIC;			--! clock in ingresso
           value_in : in  STD_LOGIC;		--! valori della sequenza
           value_out : out  STD_LOGIC);		--! alto se viene rilevata la sequenza
end fsm_moore;

architecture Behavioral of fsm_moore is
	type state_type is (init, s1,s10, s101, s1011, s10110, s101100, s1011001);	--! si crea un tipo per gli stati possibili

	signal current_state, next_state: state_type;	--! stato corrente e stato prossimo
begin

	--process 1: aggiornamento di stato (sul fronte di salita del clock)
	update_state: process(clock)
		begin
			if rising_edge(clock) then
				current_state <= next_State;
			end if;
	end process;
	
	
	--process 2: parte combinatoria (determinazione dello stato prossimo e dell'uscita)
	
	choose_next_state: process(current_state, value_in)
		begin
		value_out <= '0'; 			--assegnazione di default per l'uscita
		case current_state is
		when init => 
			if value_in = '0' then next_state <= init; else next_state <= s1;
			end if;
		when s1 =>
			if value_in = '0' then next_state <= s10; else next_state <= s1;
			end if;
		when s10 =>
			if value_in = '0' then next_state <= init; else next_state <= s101;
			end if;
		when s101 =>
			if value_in = '0' then next_state <= s10; else next_state <= s1011;
			end if;
		when s1011 =>
			if value_in = '0' then next_state <= s10110; else next_state <= s1;
			end if;
		when s10110 =>
			if value_in = '0' then next_state <= s101100; else next_state <= s101;
			end if;
		when s101100 =>
			if value_in = '0' then next_state <= init; else next_state <= s1011001;
			end if;
		when s1011001 =>			--! stringa rilevata
			value_out <= '1';		--! uscita alta, dipende solo dallo stato (Moore)!
			if value_in = '0' then next_state <= init; else next_state <= s1;	--! torno allo stato init o s1
			end if;
		when others => 
			next_state <= init;
		end case;
		
	end process;

end Behavioral;

