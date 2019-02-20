library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.numeric_std.all;
   use IEEE.math_real.all;
    

entity robertson_control_unit is 
    generic (   N   :   NATURAL :=8    --  parallelismo di X
    );
    port    (   clock                   :   in      STD_LOGIC;
                start                   :   in      STD_LOGIC;
                reset_n                 :   in      STD_LOGIC;
                current_multiplicand    :   in      STD_LOGIC;          -- moltiplicando corrente
                counter_hit             :   in      STD_LOGIC;          -- segnala la fine della moltiplicazione
                stop                    :   out     STD_LOGIC;
                en_a                    :   out     STD_LOGIC;          -- se scan_en =1 la scan chain funziona come shifter register
                en_q                    :   out     STD_LOGIC;
                en_m                    :   out     STD_LOGIC;
                shift                   :   out     STD_LOGIC;                    
                subtract                :   out     STD_LOGIC;
                count_up                :   out     STD_LOGIC;
                sel                     :   out     STD_LOGIC;          -- sel pilota il secondo input dell'adder 0 in input è Y 1 sono tutti 0
                reset_a                 :   out     STD_LOGIC;
                reset_count             :   out     STD_LOGIC          	-- reset il conteggio
    );
end robertson_control_unit;

architecture behavioral of robertson_control_unit is 

type state is (idle, init, choice, add, right_shift,check_sign,sub,end_state);

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
            subtract    <= '0';     -- non effettuo sottrazione
            count_up    <= '0';
            sel         <= '0';     -- in uscita dal mux va sempre M
            reset_a     <= '1';
            reset_count <= '1';

            case current is 
                -- fase di attesa prima di iniziare
                when idle   =>
                    stop    <=  '1';
                    if start    = '1' then 
                        nxt <= init;
                    else
                        nxt <= idle;
                    end if;

                -- inizializzazione 
                when init       =>
                    en_q        <= '1';
                    en_m        <= '1'; 
                    reset_count <= '0';
                    reset_a     <= '0';
                    nxt         <= choice;
                
                -- fase di scelta dell'operazione da fare
                when choice     =>
						  if counter_hit = '0' then 
							  if current_multiplicand = '0' then
									nxt     <= right_shift;
							  else
									nxt     <= add;
							  end if;
							else
								nxt 		  <= check_sign;
							end if;
							
                when add    => 
--						  if counter_hit = '1' then
--								en_a        <= '1';
--								subtract    <= '1';
--								nxt 			<= right_shift;
--							else
								en_a    <= '1';             -- abilito a così carica il risultato dell'adder che lavora sempre!
								nxt     <= right_shift;
--							end if;
                    
                when right_shift =>             -- esegue lo shift
							en_a    <= '1';
							en_q    <= '1';
							sel     <= '1';
							shift   <= '1';
							x_sign  <= current_multiplicand;

						-- solo ora posso controllare/aggiornare il counter e controllare se sono nello stato finale

                   -- if counter_hit = '0' then
                      count_up    <= '1';
                      nxt         <= choice;
--                    else if (current_multiplicand = '1' ) then 
--									en_a        <= '1';
--									subtract    <= '1';  
--									nxt <= idle;
--							else 
--									nxt <= idle;                  
						  
                       -- nxt         <= check_sign;
--							end if;
--							end if;

                when check_sign =>
                    -- controllo se il segno di X è negativo
                    -- il caso del segno di Y negativo lo risolvo con la and all'ingresso della scan chain
--  						en_a    <= '1';
--							en_q    <= '1';
--							sel     <= '1';
--							shift   <= '1';
                    if (x_sign = '1' ) then  
								nxt 	<= sub;
								--nxt <= right_shift;
						  else 
								nxt 	<= idle;
						  end if;

					 when sub =>
							en_a        <= '1';
                     subtract    <= '1'; 
							nxt			<= end_state;
					 when end_state =>
							nxt <= idle;
            end case;
        end process;
end behavioral;