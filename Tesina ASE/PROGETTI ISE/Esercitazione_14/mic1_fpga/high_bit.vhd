----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    15:49:42 01/08/2008 
-- Design Name: 
-- Module Name:    high_bit - Behavioral 
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

entity high_bit is
port(
	high_bit_out:out std_logic:='0';
	ff_n:in std_logic;  --ing. ff flag N
	ff_z:in std_logic;  --ing. ff flag Z
	jamn:in std_logic;  --jamn da MIR
	jamz:in std_logic	  --jamz da MIR
);
end high_bit;

architecture DATAFLOW of high_bit is

begin
	high_bit_out<=((jamz and ff_z) or (jamn and ff_n)); 
end DATAFLOW;

