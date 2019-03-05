----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    18:27:49 01/08/2008 
-- Design Name: 
-- Module Name:    shifter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is
port(
	sll8:in std_logic;
	sra1:in std_logic;
	input:in std_logic_vector(31 downto 0);
	output:out std_logic_vector(31 downto 0)
);
end shifter;

--architecture Behavioral of shifter is
--
--begin
--process(sll8,sra1,input)
--variable app:std_logic_vector(31 downto 0):=x"00000000";
--variable msb:std_logic:='0';
--
--constant otto:integer:=8;
--begin
--	if(sll8='1')then  --se sll8 alto
--		app:=x"00000000";--azzera app
--		app(31 downto 8):=input(23 downto 0);  --shift logico a sx di 8 bit	
--	elsif(sra1='1')then  --se sra1 alto
--		msb:=input(31);--in msb bit di segno
--		app(30 downto 0):=input(31 downto 1);--copia bit 31...1 di input nella parte bassa
--		app(31):=msb;--ricopia bit di segno
--	else  --se nessun comando di shift allora
--		app:=input;  --pass through
--	end if;
--	output<=app;
--end process;
--
--end Behavioral;
--






architecture Behavioral of shifter is

begin
--process(sll8,sra1,input)
--variable app:std_logic_vector(31 downto 0):=x"00000000";
--variable msb:std_logic:='0';
--
--constant otto:integer:=8;
--begin
--	if(sll8='1')then  --se sll8 alto
--		app:=x"00000000";--azzera app
--		app(31 downto 8):=input(23 downto 0);  --shift logico a sx di 8 bit	
--	elsif(sra1='1')then  --se sra1 alto
--		msb:=input(31);--in msb bit di segno
--		app(30 downto 0):=input(31 downto 1);--copia bit 31...1 di input nella parte bassa
--		app(31):=msb;--ricopia bit di segno
--	else  --se nessun comando di shift allora
--		app:=input;  --pass through
--	end if;
--	output<=app;
--end process;


output <=	(input(23 downto 0) & x"00") when sll8='1' else
				(input(31) & input(31 downto 1)) when sra1='1' else
				input;



end Behavioral;

