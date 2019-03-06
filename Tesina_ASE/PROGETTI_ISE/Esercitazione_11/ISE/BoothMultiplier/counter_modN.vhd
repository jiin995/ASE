---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : BoothMultiplier
--
-- unit name: counter_modN.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Contatore modulo 2 alla N
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

use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.math_real.all;


entity counter_modN is
	 Generic(count_max : integer := 8);
    Port ( clock 		: in  STD_LOGIC;
           count_up 	: in  STD_LOGIC;
           reset_n 	: in  STD_LOGIC;
           value 		: out  STD_LOGIC_VECTOR ((integer(ceil(log2(real(count_max)))))-1 downto 0);
           hit 		: out STD_LOGIC);
		
end counter_modN;

architecture Behavioral of counter_modN is

signal reset : std_logic;
signal cnt : integer range 0 to count_max-1;

begin

reset <= not reset_n;

value <= conv_std_logic_vector(cnt, (integer(ceil(log2(real(count_max))))));

comparator: process(cnt)
begin
	if cnt = count_max-1 then
		hit <= '1';
	else
		hit <= '0';
	end if;

end process;
	
counter_process: process(clock, reset, count_up)
begin
	if reset = '1' then
		cnt <= 0;
	elsif rising_edge(clock) and count_up = '1' then
		if cnt < count_max then
			cnt <= cnt + 1;
		else
			cnt <= 0;
		end if;
	end if;

end process;


end Behavioral;

