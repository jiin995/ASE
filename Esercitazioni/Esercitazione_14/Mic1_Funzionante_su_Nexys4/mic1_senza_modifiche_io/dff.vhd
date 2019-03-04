----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

entity dff is
port(
	d:in std_logic;  --dato
	ck:in std_logic;  --clock
	q:out std_logic:='0'  --uscita
);
end dff;

architecture Behavioral of dff is

begin
	process(ck)
	begin
	  if (rising_edge(ck)) then   --se fronte di salita clock
			q<=d;
	  end if;
  end process;
end Behavioral;

