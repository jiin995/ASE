----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:33 11/11/2017 
-- Design Name: 
-- Module Name:    Counter_Hit2n - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_Hit2 is
	generic( width : integer := 4);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           hit : out STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (width-1 downto 0));
end Counter_Hit2;

architecture Behavioral of Counter_Hit2 is
	signal count : std_logic_vector(width-1 downto 0):= (others=>'0');
begin

	q<=count;
	
--	with conv_integer(count) select hit<=
--		'1' when (2**width-1),
--		'0' when others;
		
	process(count)
	begin
		if count=2**width-1 then
			hit<='1';
		else
			hit<='0';
		end if;
	end process;
	
process(clk,rst_n)
begin
	if(rst_n ='0') then 
		count<=(others=>'0');
	elsif(rising_edge(clk)) then	
		if(en='1') then
			count<= std_logic_vector(unsigned(count)+1);
		end if;
	end if;
end process;

end Behavioral;

