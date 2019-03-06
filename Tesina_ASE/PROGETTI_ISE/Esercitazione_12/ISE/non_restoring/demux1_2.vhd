---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : non_restoring
--
-- unit name: demux1_2.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Demultiplexer 1 ingresso 2 uscite
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

entity demux1_2 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC;
           X   : out STD_LOGIC_VECTOR(1 downto 0)
   );
end demux1_2;

architecture dataflow of demux1_2 is

begin
	
	X(0) <= A and (not SEL);
	X(1) <= A and SEL;

end dataflow;
