library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy is
    Port ( clock : in  BIT;
           x : in  BIT;
           y : out  BIT);
end fsm_mealy;

architecture singular_state_machine of fsm_mealy is

	type state is (init, s1, s10, s101, s1011, s10110, s101100);	-- definisco tipo stato
	type state_vector is array(natural range<>) of state;			-- definisco vettore di stati
	
	function one_of (source: state_vector) return state is			-- funzione di risoluzione: viene invocata quando
																	-- occore un evento su uno qualsiasi degli input per
																	-- il segnale a cui è applicata
	begin
		return source(source'left);		-- ritorna il primo stato di state_vector
	end one_of;
	
	signal current_state: one_of state register := init;	-- stato corrente, viene definito con la funzione di risoluzione
	
	begin
	clocking: block (clock='1' and not clock'stable)			-- condizione per la guardia
		begin
			q0: block (current_state=init and guard)			-- guardia innestata
			begin
				current_state<= guarded s1 when x='1' else init;
			end block q0;
			q1: block (current_state=s1 and guard)
			begin
				current_state<= guarded s10 when x='0' else s1;
			end block q1;
			q2: block (current_state=s10 and guard)
			begin
				current_state<= guarded s101 when x='1' else init;
			end block q2;
	
			q3: block (current_state=s101 and guard)
			begin
				current_state<= guarded s1011 when x='1' else s10;
			end block q3;
			
			q4: block (current_state=s1011 and guard)
			begin
				current_state<= guarded s10110 when x='0' else s1;
			end block q4;
			
			q5: block (current_state= s10110 and guard)
			begin
				current_state<= guarded s101100 when x='0' else s1;
			end block q5;
			
			q6: block (current_state=s101100 and guard)
			begin
				current_state<= guarded init;
				y<= guarded '1' when x='1' and current_state=s101100 else '0';	-- l'uscita è alta quando sono in s101100 e rilevo x=1 (Mealy)!
			end block q6;
			
	end block clocking;

end singular_state_machine;

