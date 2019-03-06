----------------------------------------------------------------------------------
--! Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
--! Engineer: AIELLO MARCO MATR. 045/004437
--! 
--! Create Date:    18:38:30 01/10/2008 
--! Design Name: 
--! Module Name:    neg_edge_reg - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

----! Uncomment the following library declaration if instantiating
----! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity neg_edge_reg is
port(
	input:in std_logic_vector(8 downto 0); --ingresso
	output:out std_logic_vector(8 downto 0):="000000000"; --uscita
	ck:in std_logic --clock
);
end neg_edge_reg;
--
--architecture Behavioral of neg_edge_reg is
--
--begin
--process(ck,input)
--variable mem:std_logic_vector(8 downto 0):="000000000";
--begin
--	if(falling_edge(ck))then
--		mem:=input;
--	end if;
--	output<=mem;
--end process;
--
--end Behavioral;
--



architecture Behavioral of neg_edge_reg is

begin
process(ck)
begin
	if(falling_edge(ck))then
		output <= input;
	end if;
end process;
end Behavioral;

