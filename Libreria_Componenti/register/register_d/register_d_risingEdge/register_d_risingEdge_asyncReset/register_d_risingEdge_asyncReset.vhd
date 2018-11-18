---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : register_d_async_reset
--
-- unit name: register_d_async_reset.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera
--! @date       13/11/2018
--! @version    0.1
--! @brief      register_d_async_reset implementa un flipflop di tipo che commuta sul fronte di salita.
--!             con segnale di enable e reset asincrono con clock
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <16/11/2018> <16/11/2018> <log>
--              create
---------------------------------------------------------------------------------------------------

--! use IEEE standar library and standard logics

library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity register_d_async_reset is 
    generic(    dimension       :   NATURAL :=7;        --! define the parallelism of register
                reset_level     :   STD_LOGIC :='0';    --! define reset level
                enable_level    :   STD_LOGIC := '1'    --! define enable level
    );

    port(   clock   :   in  STD_LOGIC;
            enable  :   in  STD_LOGIC;
            reset   :   in  STD_LOGIC;
            D       :   in  STD_LOGIC_VECTOR    (dimension downto 0);
            Q       :   out STD_LOGIC_VECTOR    (dimension downto 0)
    );
end register_d_async_reset;

architecture behavioral of register_d_async_reset is 

--! segnale per poter inizializzare l'uscita del mio registro
signal Q_temp   :   STD_LOGIC_VECTOR    (dimension downto 0) := (others => '0');

begin
    Q <= Q_temp;

    ff : process (clock,reset)
        begin
            --! se il reset è paria al livello di reset, allora il contenuto del registro viene posto a 0
            if( reset = reset_level) then
                Q_temp <= ( others => '0');
            --! se 
            elsif rising_edge(clock) and (enable = enable_level) then
                Q_temp <= D;
            end if;
        end process ff;
end behavioral;
