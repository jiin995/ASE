--------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : controlled_not
--
-- unit name: controlled_not.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      controlled_not è un componente che, a seconda del valore "invert" in ingresso, restituisce l'ingresso complementato o meno
--! @details
--!
--! <b>Dependencies:</b>\n
--!   controlled_not
--!
-- modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Descrizione
--! L'uscita dipende dal valore di "invert".
--! Se invert=0 ==> output = input
--! Se invert=1 ==> output = !input
entity controlled_not is
	 Generic(width : integer := 8);	--! numero di bit della stringa in ingresso
    Port ( input : in  STD_LOGIC_VECTOR (width - 1 downto 0);	--! controlled_not input: stringa in ingresso
           invert : in  STD_LOGIC;				--! controlled_not input: bit di decisione
           output : out  STD_LOGIC_VECTOR (width - 1 downto 0));	--! controlled_not output: string in ingresso negata o meno
end controlled_not;

--================================================================================================
-- architecture declaration
--================================================================================================
architecture Dataflow of controlled_not is

--================================================================================================
-- architecture dataflow of controlled_not begin
--================================================================================================
begin

with invert select
	output <= not input when '1',
				 input when others;

end Dataflow;
--================================================================================================
-- architecture dataflow of controlled_not end
--================================================================================================
