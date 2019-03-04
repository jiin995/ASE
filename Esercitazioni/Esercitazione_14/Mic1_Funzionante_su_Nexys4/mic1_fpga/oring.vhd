----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    15:40:49 01/08/2008 
-- Design Name: 
-- Module Name:    oring - Behavioral 
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

entity oring is
port(
	uscita_oring:out std_logic_vector(7 downto 0):=x"01";  --uscita oring ,al reset è a  indirizzo main1
	jmpc:in std_logic; --ingresso jmpc
	addr:in std_logic_vector(7 downto 0);  --ingresso addr dal mir
	reg_mbr:in std_logic_vector(7 downto 0)  --ing. registro MBR
);
end oring;

architecture Behavioral of oring is

--begin
--
--process(jmpc,reg_mbr,addr)  --processo per registro mpc caricato sul fronte di salita
--begin
--	if(jmpc='0')then
--		uscita_oring<=addr(7 downto 0);  --se JMPC=0 uscita oring = next address
--	   else
--		uscita_oring<=addr(7 downto 0) or reg_mbr;  --se JMPC=1 uscita oring = next address OR  MBR
--	end if;
--end process;
--
--end Behavioral;

begin
	uscita_oring<= addr(7 downto 0) when jmpc='0' else (addr(7 downto 0) or reg_mbr);  --se JMPC=0 uscita oring = next address
end Behavioral;