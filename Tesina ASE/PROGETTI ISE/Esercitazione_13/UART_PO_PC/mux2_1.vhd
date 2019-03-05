---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : uart_PO_PC
--
--! unit name: mux2_1.vhd
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      mux2_1 descrive il comportamento di un multiplexer con 2 ingressi e 1 uscita
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <14/11/2018> <13/11/2018> <log>
--!              create
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
--! Descrizione
--! Quando l'ingresso SEL è basso, l'uscita assume il valore del segnale A, altrimenti quando il 
--! segnale SEL è alto l'uscita assume il valore del segnale B. 

--! definisco il componente e la sua interfaccia 

entity mux2_1 is
    generic (   width : natural := 1                     --! parallelismo dell' I/O del multiplexer
    );
    port(   SEL : in  STD_LOGIC;                                    --! mux2_1 input: selezione 
            A   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: A
            B   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: B
            X   : out STD_LOGIC_VECTOR ((width-1) downto 0)         --! mux2_1 output: X
        );
end mux2_1;

--================================================================================================
--! architecture declaration
--================================================================================================
architecture dataflow of mux2_1 is

--================================================================================================
--! architecture dataflow of mux2_1 begin
--================================================================================================
    begin
    --X <= A when SEL='0' else B;
    --X <= (A and (not SEL) ) or (B and (SEL));
	X <= A when SEL='0' else
	     B when SEL='1' else (others => 'X');
    end dataflow;
--================================================================================================
--! architecture dataflow of mux2_1 end
--================================================================================================
