library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.numeric_std.all;
   use IEEE.math_real.all;
    

entity robertson_control_unit is 
    generic (   N   :   NATURAL :=8    --!  parallelismo di X
    );
    port    (   clock                   :   in      STD_LOGIC;
                start                   :   in      STD_LOGIC;
                reset_n                 :   in      STD_LOGIC;
                current_multiplicand    :   in      STD_LOGIC;          --! moltiplicando corrente
                counter_hit             :   in      STD_LOGIC;          --! segnala la fine della moltiplicazione
                stop                    :   out     STD_LOGIC;
                en_a                    :   out     STD_LOGIC;          --! se scan_en =1 la scan chain funziona come shifter register
                en_q                    :   out     STD_LOGIC;
                en_m                    :   out     STD_LOGIC;
                shift                   :   out     STD_LOGIC;                    
                subtract                :   out     STD_LOGIC;
                count_up                :   out     STD_LOGIC;
                sel                     :   out     STD_LOGIC;          --! sel pilota il secondo input dell'adder 0 in input è Y 1 sono tutti 0
                reset_a                 :   out     STD_LOGIC;
                reset_count             :   out     STD_LOGIC          	--! reset il conteggio
    );
end robertson_control_unit;

architecture behavioral of robertson_control_unit is 

type state is (idle, init, choice, add_sub, right_shift);

signal current, nxt : state := idle;

signal x_sign : STD_LOGIC := '0';


begin

    state_proc: process(clock, reset_n)
        begin
            if reset_n = '0' then
                current <= idle;
            elsif rising_edge(clock) then
                current <= nxt;
            end if;
        end process;


    fsm: process(current, start, reset_n, current_multiplicand, counter_hit)
        begin

            stop        <= '0';
            en_a        <= '0';
            en_q        <= '0';
            en_m        <= '0';
            shift       <= '0';
            subtract    <= '0';     --! non effettuo sottrazione
            count_up    <= '0';
            sel         <= '0';     --! in uscita dal mux va sempre M
            reset_a     <= '1';
            reset_count <= '1';

            case current is 
                --! fase di attesa prima di iniziare
                when idle   =>
                    stop    <=  '1';
                    if start    = '1' then 
                        nxt <= init;
                    else
                        nxt <= idle;
                    end if;

                --! inizializzazione 
                when init       =>
				    --! resetto i regestri e il contatore
                    en_q        <= '1';
                    en_m        <= '1'; 
                    reset_count <= '0';
                    reset_a     <= '0';
                    nxt         <= choice;
                
                --! fase di scelta dell'operazione da fare
                when choice     =>
						  if counter_hit = '0' then 
							  if current_multiplicand = '0' then
									nxt     	<= right_shift;
							  else
									nxt     	<= add_sub;
							  end if;
							else
								if x_sign = '0' then
									nxt     	<= idle;
								else
									nxt     	<= add_sub;
								end if;
							end if;

                when add_sub   => 
							--! controllo se devo effettuare la somma o la sottrazione
							if counter_hit = '0' then
							   --! abilito a così carica il risultato dell'adder che lavora sempre!
								en_a    		<= '1';             
								nxt     		<= right_shift;
							else 
								--! faccio la correzione
								en_a        <= '1';
								subtract    <= '1'; 
								nxt	  		<= idle;
							end if;
                    
                when right_shift =>             --! esegue lo shift
							en_a    <= '1';
							en_q    <= '1';
							sel     <= '1';
							shift   <= '1';
							--! tiene traccia del segno di x che dopo n shift si perde!!! e quindi non riesco a capire se 
							--! se devo fare la somma o la sottrazione
							x_sign  <= current_multiplicand;
	
							--! solo ora posso aggiornare il counter e controllare se sono nello stato finale
                     count_up    <= '1';
                     nxt         <= choice;
            end case;
        end process;
end behavioral;
