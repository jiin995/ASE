---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : rca_tre_operandi
--
--! unit name: full_adder.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      full_adder è l'implementazione di un full_adder
--! @details
--!
--! <b>Dependencies:</b>\n
--!   half_adder
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Descrizione
--! Somma i 3 bit in ingresso (2 addendi e 1 carry in ingresso).\n In uscita abbiamo il risultato della somma sul bit S e il riporto
--! sul bit C.

entity full_adder is
  PORT (  x       :   in  STD_LOGIC;	--! full_adder input : addendo
          y       :   in  STD_LOGIC;	--! full_adder input : addendo
          c_in    :   in  STD_LOGIC;	--! full_adder input : carry in ingresso
          s       :   out STD_LOGIC;	--! full_adder output : somma
          c_out   :   out STD_LOGIC		--! full_adder output : carry

  );
end full_adder;

architecture dataflow of full_adder is

 begin
    s <=  (x xor y xor c_in);
    c_out <=  ((x and y) or ((x xor y) and c_in));
  end dataflow;
