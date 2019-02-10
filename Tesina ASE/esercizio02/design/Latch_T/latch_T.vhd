----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:57 02/09/2019 
-- Design Name: 
-- Module Name:    latch_T - Behavioral 
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

entity latch_T is
    Port ( en : in  STD_LOGIC;
           T : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end latch_T;

architecture Behavioral of latch_T is

signal Qtemp : std_logic := '0';

begin

process(en,T) is
begin
	if (T='1' and en='1') then
		Qtemp <= not(Qtemp);
	end if;
end process;

Q <= Qtemp;
QN <= not Qtemp;

end Behavioral;

