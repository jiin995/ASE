----------------------------------------------------------------------------------
--! Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
--! Engineer: AIELLO MARCO MATR. 045/004437
--! 
--! Create Date:    17:59:52 01/13/2008 
--! Design Name: 
--! Module Name:    decodifica_indirizzi - Behavioral 
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

entity decodifica_indirizzi is
port(
	address:in std_logic_vector(31 downto 0);
	ce_uart:out std_logic:='0';
	ce_rom:out std_logic:='0';
	ce_ram:out std_logic:='0'
);
end decodifica_indirizzi;
--
--architecture Behavioral of decodifica_indirizzi is
--
--begin
--process(address)
--begin
--	if(address>=x"00010000" and address<x"00020000")then
--		ce_uart<='0';
--		ce_rom<='1';
--		ce_ram<='0';
--	elsif(address>=x"00020000" and address<x"FFFFFFF4")then
--		ce_uart<='0';
--		ce_rom<='0';
--		ce_ram<='1';
--	elsif(address=x"FFFFFFF4")then
--		ce_uart<='1';
--		ce_rom<='0';
--		ce_ram<='0';
--	else
--		ce_uart<='0';
--		ce_rom<='0';
--		ce_ram<='0';
--	end if;
--end process;
--
--end Behavioral;
--




architecture Behavioral of decodifica_indirizzi is
	signal app:std_logic_vector(2 downto 0):="000";
begin

	app <= "010" when (address>=x"00010000" and address<x"00020000") else
	       "001" when (address>=x"00020000" and address<x"FFFFFFF4") else
	       "100" when (address=x"FFFFFFF4") else
		   "000";
			

	ce_uart<=app(2);
	ce_rom<=app(1);
	ce_ram<=app(0);

end Behavioral;

