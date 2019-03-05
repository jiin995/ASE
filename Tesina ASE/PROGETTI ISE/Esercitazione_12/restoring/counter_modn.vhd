----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    10:01:38 11/08/2017 
--! Design Name: 
--! Module Name:    counter_modn - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_mod_2n is
	 generic (N : natural := 2);
    Port ( 	reset_n : in  STD_LOGIC;
			en : in  STD_LOGIC;
			clk : in  STD_LOGIC;
			count : out  STD_LOGIC_VECTOR (N-1 downto 0);
			count_hit : out STD_LOGIC);
end counter_mod_2n;

architecture Behavioural of counter_mod_2n is

signal x : std_logic_vector(N-1 downto 0) := (others => '0');
constant all_ones : std_logic_vector(N-1 downto 0) := (others => '1');

begin
	
	count <= x;
	count_hit <= '1' when x = (all_ones) else '0';
	
--	with x select count_hit <=
--		'1' when (all_ones),
--		'0' when others;
		
--nella sensitivity list non metto EN e X poichè la loro variazione
--dipende da quelle di reset_n e di clk
bh_description: process(en,x,clk,reset_n)
begin
	if (reset_n = '0') then
		x <= (others => '0') ;
	elsif (en = '1' and rising_edge(clk)) then
		x <= std_logic_vector(unsigned(x)+1);
	end if;
	count <= x;	
end process;

end Behavioural;



