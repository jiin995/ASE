---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : non_restoring
--
-- unit name: half_adder.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Sommatore half_adder 2 ingressi 2 uscite
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
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port(
		x 	:	in std_logic;
		y	:	in std_logic;
		s	:	out std_logic;
		c	:	out	std_logic
	);
end half_adder;

architecture dataflow of half_adder is

begin
	s <= x xor y;
	c <= x and y;

end dataflow;
