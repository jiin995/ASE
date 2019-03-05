library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port(
		x 	:	in std_logic;
		y	:	in std_logic;
		s	:	out std_logic;
		c	:	out	std_logic
	);
end half_adder;

architecture dataflow of half_adder is

begin
	s <= x xor y;
	c <= x and y;

end dataflow;