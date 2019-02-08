----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:09 02/08/2019 
-- Design Name: 
-- Module Name:    flipflop_jk_Re_Sr - Behavioral 
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

entity flipflop_jk_Re_Sr is
    Port ( j: in std_logic;
           k: in std_logic;
			  reset_n: in std_logic;
			  clock: in std_logic;
           q: out std_logic;
			  not_q: out std_logic);
end flipflop_jk_Re_Sr;

architecture behavioral of flipflop_jk_Re_Sr is
	signal q_temp: std_logic := '0';
begin

	q <= q_temp;
	not_q <= not q_temp;
	
	process(clock, reset_n) is
	begin
		if(rising_edge(clock)) then
			if(reset_n = '0') then
				q_temp <= '0';
			else
				q_temp <= ((not K) and q_temp) or (J and (not q_temp));
			end if;
		end if;
	end process;

end Behavioral;

