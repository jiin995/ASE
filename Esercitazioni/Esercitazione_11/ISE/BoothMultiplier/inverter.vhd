----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:26 11/19/2017 
-- Design Name: 
-- Module Name:    inverter - Dataflow 
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

entity inverter is
	generic( dim : natural :=8);
    Port ( a : in  STD_LOGIC_VECTOR (dim-1 downto 0);
           a_n : out  STD_LOGIC_VECTOR (dim-1 downto 0);
           invert : in  STD_LOGIC);
end inverter;

architecture Dataflow of inverter is

begin

	with invert select 
		a_n <= not a when '1',
		a when others;

end Dataflow;

