----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:41 11/09/2018 
-- Design Name: 
-- Module Name:    flipflop_d - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flipflop_d is
    Port ( clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end flipflop_d;

architecture Behavioral of flipflop_d is

signal q_temp : std_logic := '0';

begin
	q <= q_temp;
	-- Versione async, guardo attivamente il reset_n quando commuta
	-- Versione sync: basta eliminare il reset_n dalla sensitivity list
	ff: process(clock, reset_n)
	begin
		if reset_n = '0' then
			q_temp <= '0';
		elsif rising_edge(clock) and enable = '1' then
			q_temp <= d;
		end if;
	end process ff;

end Behavioral;
