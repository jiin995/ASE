----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:49 02/08/2019 
-- Design Name: 
-- Module Name:    Latch_T - Behavioral 
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

entity Latch_T is
	Port ( T		:	in STD_LOGIC;
			 en	:	in STD_LOGIC;
			 Q		:	out STD_LOGIC;
			 QN	:	out STD_LOGIC);
end Latch_T;

architecture Behavioral of Latch_T is

signal Qtemp : std_logic := '0';

begin
process(en,T) is
begin
	if (T='0' and en='1') then
		Qtemp <= Qtemp;
	else if (T='1' and en='1') then
		Qtemp <= not(Qtemp);
		end if;
	end if;
end process;

Q <= Qtemp;
QN <= not Qtemp;

end Behavioral;

