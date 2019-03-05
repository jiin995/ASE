---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : BoothMultiplier
--
-- unit name: booth_multiplier_control_unit.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Unità di controllo del moltiplicatore di Booth
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.numeric_std.all;
   use IEEE.math_real.all;
    

entity booth_multiplier_control_unit is 
    generic (   N   :   NATURAL :=8    --!  parallelismo di X
    );
    port    (   clock                   :   in      STD_LOGIC;
                start                   :   in      STD_LOGIC;
                reset_n                 :   in      STD_LOGIC;
                counter_hit             :   in      STD_LOGIC;                              --! segnala la fine della moltiplicazione
                x_lsbs    				    :   in      STD_LOGIC_VECTOR (1 downto 0);          --! ultimi due bit di x corrente
                stop                    :   out     STD_LOGIC;
                en_a                    :   out     STD_LOGIC;          --! se scan_en =1 la scan chain funziona come shifter register
                en_q                    :   out     STD_LOGIC;
                en_m                    :   out     STD_LOGIC;
                shift                   :   out     STD_LOGIC;                    
                subtract                :   out     STD_LOGIC;
                count_up                :   out     STD_LOGIC;
                reset_a                 :   out     STD_LOGIC;
                reset_count             :   out     STD_LOGIC          	--! reset il conteggio
    );
end booth_multiplier_control_unit;

architecture behavioral of booth_multiplier_control_unit is 

type state is (idle, init, choice, add_sub, right_shift);

signal current, nxt : state := idle;

begin

    state_proc: process(clock, reset_n)
        begin
            if reset_n = '0' then
                current <= idle;
            elsif rising_edge(clock) then
                current <= nxt;
            end if;
        end process;


    fsm: process(current, start, reset_n, x_lsbs, counter_hit)
        begin

            stop        <= '0';
            en_a        <= '0';
            en_q        <= '0';
            en_m        <= '0';
            shift       <= '0';
            subtract    <= '0';     --! non effettuo sottrazione
            count_up    <= '0';
            reset_a     <= '1';
            reset_count <= '1';

            case current is 
                --! fase di attesa prima di iniziare
                when idle   =>
                    stop    <=  '1';
                    if rising_edge(start)    then 
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
                        --! se 00 o 11 devo fare solo lo shift 
							if x_lsbs(0) = x_lsbs(1) then
									nxt     	<= right_shift;
							  else
									nxt     	<= add_sub;
							  end if;

                when add_sub   => 
							--! controllo se devo effettuare la somma o la sottrazione
							--! eseguo la somma se l'ultimo bit è alto

                                en_a <= '1';
                                nxt  <= right_shift;  
--!                            if x_lsbs (0) = '1' then 
--!                                en_a <= '1';
--!                                nxt  <= right_shift;  
--!                            else    
--!                                en_a     <= '1';
--!                                subtract <= '1';
--!                                nxt      <= right_shift;
--!                            end if;
                when right_shift =>             --! esegue lo shift
							en_a    <= '1';
							en_q    <= '1';
							shift   <= '1';
							--! solo ora posso aggiornare il counter e controllare se sono nello stato finale
                            if counter_hit = '0' then 
                                count_up    <= '1';
                                nxt         <= choice;
                            else
                                nxt         <= idle;
                            end if;
            end case;
        end process;
end behavioral;
