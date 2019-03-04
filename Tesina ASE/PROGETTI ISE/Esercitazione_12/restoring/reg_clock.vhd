----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:59:08 11/19/2012 
-- Design Name: 
-- Module Name:    reg_clock - Behavioral 
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

entity reg_clock is
	 Generic(width : integer := 8);
    Port ( value : in  STD_LOGIC_VECTOR (width-1 downto 0);
           clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (width-1 downto 0));
end reg_clock;

architecture Behavioral of reg_clock is
	signal reg: std_logic_vector(width-1 downto 0);

begin

	regist: process(clock, value, reset_n, enable)
	begin
		if reset_n = '0' then
			reg <= (others => '0');
		elsif rising_edge(clock) and enable = '1' then
			reg <= value;
		end if;
	
	end process;

	output <= reg;

end Behavioral;

