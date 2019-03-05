---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : half_adder
--
--! unit name: half_adder.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      half_adder è l'implementazione di un half_adder
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

--! Descrizione
--! Somma i due bit in ingresso.\n In uscita abbiamo il risultato della somma sul bit S e il riporto
--! sul bit C.

--! definisco il componente e la sua interfaccia

entity half_adder is
    port (    X:  in  STD_LOGIC;      --! half_adder input : addendo 
              Y:  in  STD_LOGIC;      --! half_adder input : addendo 
              C:  out STD_LOGIC;      --! half_adder output : carry 
              S:  out STD_LOGIC       --! half_adder output : somma 
    );
end half_adder;

--================================================================================================
--! architecture declaration
--================================================================================================
architecture dataflow of half_adder is

--================================================================================================
--! architecture dataflow of half_adder begin
--================================================================================================
begin
      C <=  (X and Y);
      S <=  (X xor Y);
end dataflow;
--================================================================================================
--! architecture dataflow of half_adder end
--================================================================================================
