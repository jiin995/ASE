---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : clock_divisor
--
-- unit name: clock_divisor.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      clock_divisor è l'implementazione di un divisore di frequenza
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothing
--!
-- modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

--Descrizione
--! Filtra i fronti del clock ad una frequenza "clock_frequency_in" per averli ad una frequenza più bassa "clock_frequency_out".
entity clock_divisor is
    generic (   clock_frequency_in  : integer := 100000000;	--! frequenza del clock in ingresso
                clock_frequency_out : integer := 1000	--! frequenza del clock in uscita
    );

    port (  enable      :   in STD_LOGIC;	--! clock_divisor input: segnale enable
            reset_n     :   in STD_LOGIC;	--! clock_divisor input: segnale reset
            clock_freq_in    :   in STD_LOGIC ;	--! clock_divisor input: segnale di clock in ingresso
            clock_freq_out   :   out STD_LOGIC	--! clock_divisor output: segnale di clock in uscita
    );

end clock_divisor;

--================================================================================================
-- architecture declaration
--================================================================================================
architecture behavioral of clock_divisor is

signal clock_out_temp : STD_LOGIC :='0';

constant max_value : integer := (clock_frequency_in/clock_frequency_out)-1;
--=============================================================================
-- architecture behavioral of clock_divisor begin
--=============================================================================
begin
    clock_freq_out <= clock_out_temp;

    clock_division : process (clock_freq_in,reset_n,enable) 
        variable counter : integer range 0 to max_value := 0;
        begin   
            if reset_n = '0' then 
                counter := 0;
                clock_out_temp <= '0';
            elsif (rising_edge (clock_freq_in) and (enable='1')) then 
                if(counter = max_value) then
                    counter := 0;
                    clock_out_temp <= '1';
                else
                    counter := counter +1;
                    clock_out_temp <= '0';
                end if;
            end if;
        end process;
end;

--=============================================================================
-- architecture behavioral of clock_divisor end
--=============================================================================
