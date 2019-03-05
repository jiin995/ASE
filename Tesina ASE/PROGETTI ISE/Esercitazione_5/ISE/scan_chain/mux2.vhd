---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : scan_chain
--
-- unit name: mux2.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	implementazione dataflow di un mux 2 
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

--! multiplexer: l'uscita o è in0 se sel = 0, in1 se sel = 1
--! se sel assume altri valori, lo riporto in uscita per evitare fault masking

entity mux2 is
    Port ( in0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           o : out  STD_LOGIC);
end mux2;

architecture dataflow of mux2 is

begin

with sel select
	o   <=  in0 when '0',
		    in1 when '1',
		    sel when others;

end dataflow;

