---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mux2_1
--
-- unit name: mux2_1.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera
--! @date       15/10/2018
--! @version    0.1
--! @brief      mux2_1 descrive il comportamento di un multiplexer con 2 ingressi e una uscita
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

--! Uso la libreria standard di IEEE
library IEEE;
--! Uso gli elementi logici della libreria IEEE
    use IEEE.STD_LOGIC_1164.all;

-- Descrizione comportamento
--! Quando l'ingresso SEL è basso, l'uscita assume il valore del segnale A, altrimenti quando il 
--! segnale SEL è alto l'uscita assume il valore del segnale B. 

-- definisco il componente e la sua interfaccia 

entity mux2_1 is
    port(   SEL : in  STD_LOGIC;        --! mux2_1 input : selezione 
            A   : in  STD_LOGIC;        --! mux2_1 input
            B   : in  STD_LOGIC;        --! mux2_1 input
            X   : out STD_LOGIC         --! mux2_1 output
        );
end mux2_1;

--================================================================================================
-- architecture declaration
--================================================================================================
architecture dataflow of mux2_1 is

--================================================================================================
-- architecture dataflow of mux2_1 begin
--================================================================================================
    begin
    --X <= A when SEL='0' else B;
        X <= (A and (not SEL) ) or (B and (SEL));
    end dataflow;
--================================================================================================
-- architecture dataflow of mux2_1 end
--================================================================================================