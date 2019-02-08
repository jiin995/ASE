----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Piccolo
-- 
-- Create Date:    11:23:00 02/08/2019 
-- Design Name: 
-- Module Name:    latch_jk - Behavioral 
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

	signal state: std_logic := '0';
	
begin

	p: process(J,K) is
	
		begin
		
			if(J='1' and K='0') then
				state<='1';
			else 
				if(J='0' and K='1') then
					state<='0';
				else 
					if(J='1' and K ='1') then
						state<= not state;
					end if;
				end if;
			end if;
		end process;

	Q <= state;

	Qnot <= not state;

end behavioral;