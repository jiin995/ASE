----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:09 02/08/2019 
-- Design Name: 
-- Module Name:    flipflop_jk - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity flipflop_jk is
    Port ( j: in std_logic;
           k: in std_logic;
			  reset_n: in std_logic;
			  clock: in std_logic;
           q: out std_logic;
			  not_q: out std_logic);
end flipflop_jk;

architecture behavioral of flipflop_jk is
	signal q_temp: std_logic := '0';
begin

	q <= q_temp;
	not_q <= not q_temp;
	
	process(clock, reset_n) is
	begin
		if(reset_n = '0') then
			q_temp <= '0';
		else
			if(rising_edge(clock)) then
				q_temp <= ((not K) and q_temp) or (J and (not q_temp));
			end if;
		end if;
	end process;

end Behavioral;

