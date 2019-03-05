---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : BoothMultiplier
--
-- unit name: full_adder.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Sommatore Full-Adder 3 ingressi 2 uscite
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

--! Descrizione
--! Somma i 3 bit in ingresso (2 addendi e 1 carry in ingresso).\n In uscita abbiamo il risultato della somma sul bit S e il riporto
--! sul bit C.

entity full_adder is
  PORT (  X   :   in  STD_LOGIC;	--! full_adder input : addendo
          Y   :   in  STD_LOGIC;	--! full_adder input : addendo
          C_in:   in  STD_LOGIC;	--! full_adder input : carry in ingresso
          S   :   out STD_LOGIC;	--! full_adder output : somma
          C_out   :   out STD_LOGIC		--! full_adder output : carry

  );
end full_adder;
--================================================================================================
--! architecture declaration
--================================================================================================
architecture dataflow of full_adder is
--================================================================================================
--! architecture dataflow of full_adder begin
--================================================================================================
  begin
    S <=  (X xor Y xor C_in);
    C_out <=  ((X and Y) or ((X xor Y) and C_in));
  end dataflow;
--================================================================================================
--! architecture dataflow of full_adder end
--================================================================================================
