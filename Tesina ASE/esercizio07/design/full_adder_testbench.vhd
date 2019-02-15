---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : full_adder
--
-- unit name: full_adder_testbench.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       25/10/2018
--! @version    0.1
--! @brief     	full_adder_testbench è l'implementazione del testbench di un full_adder
--! @details
--!
--! <b>Dependencies:</b>\n
--!   half_adder
--!
-- modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
-- last changes: <21/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity full_adder_testbench is
end full_adder_testbench;

architecture behavioral of full_adder_testbench is 

    component full_adder is
        port (  X   : in  STD_LOGIC;
                Y   : in  STD_LOGIC;
                CIN : in  STD_LOGIC;
                C   : out STD_LOGIC;
                S   : out STD_LOGIC
        );
    end component;

    signal X    : STD_LOGIC :='0';
    signal Y    : STD_LOGIC :='0';
    signal CIN  : STD_LOGIC :='0';

    signal C    : STD_LOGIC :='0';
    signal S    : STD_LOGIC :='0';

-- Scelgo di testare la definzione architetturale del componente!
    for all : full_adder use entity
        work.full_adder(structural);

    begin
        uut: full_adder port map (
                                    X   => X,
                                    Y   => Y,
                                    CIN => CIN,
                                    C   => C,
                                    S   => S
        );

        stim_proc : process
            begin   
                X <=    '0', '1' after 10 ns, '0' after 20 ns, '1' after 35 ns,
                        '0' after 45 ns,'1' after 50 ns;
                Y <=    '0', '0' after 10 ns, '1' after 20 ns, '1' after 35 ns,
                        '0'after 45 ns ,'1' after 50 ns; 
                CIN <=  '0', '0' after 10 ns, '1' after 20 ns, '1' after 35 ns,
                        '0'after 45 ns ,'1' after 50 ns; 
                wait;
        end process;
end behavioral;
