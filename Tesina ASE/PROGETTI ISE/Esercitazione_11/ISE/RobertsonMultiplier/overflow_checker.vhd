---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : overflow_checker
--
--! unit name: overflow_checker.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       28/11/2018
--! @version    0.1
--! @brief      overflow_checker è l'implementazione di un overflow_checker
--! @details
--!
--! <b>Dependencies:</b>\n
--!   full_adder
--!
--! modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

--! Descrizione
--! La macchina controlla se vi è overflow nel risultato confrontando le cifre più significative
--! (segno) dei due operandi e del risultato con subtract. Ho overflow in caso di:
--! - somma di due positivi con risultato negativo
--! - somma di due negativi con risultato positivo
--! - differenza di positivo e negativo con risultato negativo
--! - differenza di negativo e positivo con risultato positivo

entity overflow_checker is 
port (
            a:   in  STD_LOGIC; --! bit più significativo (segno) di A
            b:   in  STD_LOGIC; --! bit più significativo (segno) di B
            subtract: in STD_LOGIC; --! bit di operazione: 1 se sottrazione, 0 se addizione
            s:   in  STD_LOGIC; --! bit più significativo (segno) di S
            overflow: out STD_LOGIC --! bit alto se ho una condizione di overflow
    );
end overflow_checker;

--================================================================================================
--! architecture declaration
--================================================================================================



architecture dataflow of overflow_checker is
	 signal overflow_int	: STD_LOGIC := '0';

--================================================================================================
--! architecture behavioural of overflow_checker begin
--================================================================================================
    begin
		 overflow <= overflow_int;
        overflow_int <= ( (not a) AND (not b) AND (not subtract) AND s )
			    OR ( a AND b AND (not subtract) AND (not s) )
                OR ( (not a) AND b AND subtract AND s )
                OR ( a AND (not b) AND subtract AND (not s) ) ;    --! ricavato tramite tabella di verità
        
    end dataflow;
--================================================================================================
--! architecture behavioural of overflow_checker end
--================================================================================================
