----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    20:43:12 01/06/2008 
-- Design Name: 
-- Module Name:    4to16decoder - Behavioral 
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


entity decoder is
port(
	output:out std_logic_vector(15 downto 0);
	sel : in std_logic_vector(3 downto 0)
);
end decoder;

architecture Behavioral of decoder is

begin
output<= "0000000000000001" when sel="0000" else
			"0000000000000010" when sel="0001" else
			"0000000000000100" when sel="0010" else
			"0000000000001000" when sel="0011" else
			"0000000000010000" when sel="0100" else
			"0000000000100000" when sel="0101" else
			"0000000001000000" when sel="0110" else
			"0000000010000000" when sel="0111" else
			"0000000100000000" when sel="1000" else
			"0000001000000000" when sel="1001" else
			"0000010000000000" when sel="1010" else
			"0000100000000000" when sel="1011" else
			"0001000000000000" when sel="1100" else
			"0010000000000000" when sel="1101" else
			"0100000000000000" when sel="1110" else
			"1000000000000000" ;
end Behavioral;

