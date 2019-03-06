---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : latch_T
--
-- unit name: latch_T.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Latch T behavioural
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

entity latch_T is
    Port ( en : in  STD_LOGIC;
           T : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end latch_T;

architecture Behavioral of latch_T is

signal Qtemp : std_logic := '0';

begin
process(en,T) is
begin
	if (T='0' and en='1') then
		Qtemp <= Qtemp;
	else if (T='1' and en='1') then
		Qtemp <= not(Qtemp);
		end if;
	end if;
end process;

Q <= Qtemp;
QN <= not Qtemp;

end Behavioral;

