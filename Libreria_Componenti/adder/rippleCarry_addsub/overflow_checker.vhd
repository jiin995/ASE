---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : overflow_checker
--
-- unit name: overflow_checker.vhdl
--     
-- file description:
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
-- modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Descrizione
--! aaa

entity overflow_checker is 
port (
            s_a:   in  STD_LOGIC;
            s_b:   in  STD_LOGIC;
            s_s:   in  STD_LOGIC;
            overflow: out STD_LOGIC
    );
end overflow_checker;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture dataflow of overflow_checker is

--================================================================================================
-- architecture behavioural of overflow_checker begin
--================================================================================================
    begin

      --  overflow_check: process(s_a,s_b,s_s)

      --  begin

        overflow <= '1' when ((s_a = '0' AND s_b = '0' AND s_s='1') OR (s_a = '1' AND s_b = '1' AND s_s = '0' ) )
                        else '0';
        
    end dataflow;
--================================================================================================
-- architecture behavioural of overflow_checker end
--================================================================================================
