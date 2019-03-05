---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : latch jk
--
-- unit name: latch_jk.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Latch JK behavioural
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


entity latch_jk is
port ( J		:	in STD_LOGIC;
		 K		:	in STD_LOGIC;
       Q		:	out STD_LOGIC;
		 Qnot	:	out STD_LOGIC
		);
		 
end latch_jk;

architecture behavioral of latch_jk is

	signal Qtemp: std_logic := '0';
	
begin

	p: process(J,K) is
		begin
			if(J='1' and K='0') then
				Qtemp<='1';
			else 
				if(J='0' and K='1') then
					Qtemp<='0';
				else 
					if(J='1' and K ='1') then
						Qtemp<= not Qtemp;
					end if;
				end if;
			end if;
		end process;

	Q <= Qtemp;
	Qnot <= not Qtemp;

end behavioral;