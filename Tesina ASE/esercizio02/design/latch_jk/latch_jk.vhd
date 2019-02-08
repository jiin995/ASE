----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Mirko Pennone, Simone Penna, Gabriele Previtera
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