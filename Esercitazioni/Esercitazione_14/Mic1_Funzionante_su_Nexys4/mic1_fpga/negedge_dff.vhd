----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    20:30:50 01/06/2008 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity negedge_dff is
port(
	d:in std_logic;  --dato
	ck:in std_logic;  --clock
	q:out std_logic:='0'  --uscita
);
end negedge_dff;

architecture Behavioral of negedge_dff is

begin
	process(ck)
	begin
	  if (falling_edge(ck)) then   --se fronte di discesa clock
			q<=d;
	  end if;
  end process;
end Behavioral;

