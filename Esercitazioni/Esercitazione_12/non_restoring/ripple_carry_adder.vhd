library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder is
	generic (width	: natural);
	port(
		X	: in std_logic_vector(width-1 downto 0);
		Y	: in std_logic_vector(width-1 downto 0);
		cin : in std_logic;
		cout: out std_logic;
		sum : out std_logic_vector(width-1 downto 0)
		
	);
end ripple_carry_adder;

architecture structural of ripple_carry_adder is


	signal carry : std_logic_vector(width downto 0) :=(others => '0');
	
	component  full_adder is
		port(
			x	:in std_logic;
			y	:in std_logic;
			cin	:in std_logic;
			cout:out std_logic;
			sum	:out std_logic
		);
	end component;

	begin
	carry(0)<=cin;
	cout<=carry(width);
	
	Ripple_carry: for i in 0 to width-1 generate
		rca: full_adder port map(
								x=> X(i),
								y=>Y(i),
								cin=>carry(i),
								cout=>carry(i+1),
								sum=>sum(i)
								);
	end generate;

		
end structural;