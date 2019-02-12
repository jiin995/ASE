----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:22 10/11/2012 
-- Design Name: 
-- Module Name:    flipflopd - Behavioral 
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

entity flipflopd is
    Port ( d : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  reset_n : in STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out  STD_LOGIC);
end flipflopd;

architecture Behavioral of flipflopd is

begin

ffd: process(d, en, clock, reset_n)

begin

	if reset_n = '0' then
		q <= '0';
	elsif clock'event and clock='1' and en = '1' then
		q <= d;
	end if;

end process;


end Behavioral;

