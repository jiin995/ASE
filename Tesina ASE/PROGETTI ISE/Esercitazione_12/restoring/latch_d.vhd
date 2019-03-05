----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    20:33:55 11/07/2017 
--! Design Name: 
--! Module Name:    latch_d - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity edge_trigger_dn is
	generic ( width : integer);
    Port ( d : in  STD_LOGIC_vector(width-1 downto 0);
           en : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_vector(width-1 downto 0));
end edge_trigger_dn;

architecture Behavioral of edge_trigger_dn is

begin

process(d,clk,en,reset_n)

	begin
			if( reset_n='0') then
				q<=(others=>'0');
			elsif ( en ='1' and rising_edge(clk)) then
				q<=d;
			end if;
end process;
end Behavioral;

