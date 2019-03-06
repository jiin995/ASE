---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : uart_PO_PC
--
-- unit name: flag_FF.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Flip Flop che segnala lo stato dell'UART (buffer pieno o vuoto)
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
--! buffer per l'UART che segnala il suo stato: che può essere vuoto o pieno
--! flag : 0 il registro è vuoto ci si può scrivere all'interno
--			 1 il registro è pieno si può consumare il dato all'interno
entity flag_FF is 
    port    ( clock     : in  STD_LOGIC;
              reset     : in  STD_LOGIC;
              clr_flag  : in  STD_LOGIC;			--! setto lo stato del buffer come vuoto
              set_flag  : in  STD_LOGIC;			--! setta lo stato del buffer come pieno
              flag      : out  STD_LOGIC			--! segnala lo stato del buffer
    );
end flag_FF; 

architecture behavioral of flag_FF is 

    signal flag_reg, flag_next  : STD_LOGIC := '0' ;

begin
--! evoluzione dello stato
    process (clock, reset) begin    --! reset asincrono
        if (reset = '1' ) then
            flag_reg    <= '0';
        elsif (rising_edge(clock)) then
            flag_reg    <= flag_next;
        end if;
    end process;

    process (flag_reg,clr_flag, set_flag ) begin
        --! se non ci sono cambiamenti rimango nello stato precedente
        flag_next   <= flag_reg;

        if ( set_flag = '1' ) then
            flag_next   <= '1';
        elsif ( clr_flag = '1' ) then
            flag_next   <= '0';
        end if;
    end process;

    flag    <= flag_reg; 

end behavioral;
