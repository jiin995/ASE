----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:45 11/25/2017 
-- Design Name: 
-- Module Name:    Partial_block_CSA - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Partial_block_CSA is
	generic (width : natural:=4);
    Port ( A : in  STD_LOGIC_VECTOR (width-1 downto 0);
           B : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (width-1 downto 0));
end Partial_block_CSA;

architecture Behavioral of Partial_block_CSA is
	component muxn_1 is
			generic ( width : natural);
			Port (
				inputs : in std_logic_vector(2**width-1 downto 0);
				selectors : in std_logic_vector(width-1 downto 0);
				output : out std_logic
			);
	end component;
	
	COMPONENT ripple_carry_adder is
	generic (width	: natural);
	port(
		X	: in std_logic_vector(width-1 downto 0);
		Y	: in std_logic_vector(width-1 downto 0);
		cin : in std_logic;
		cout: out std_logic;
		sum : out std_logic_vector(width-1 downto 0)
		
	);
	end COMPONENT;
	signal c : std_logic_vector(1 downto 0) :=(others=>'0');
	signal s : std_logic_vector(2*width-1 downto 0) :=(others=>'0');
	signal cin_rca : std_logic_vector(1 downto 0) := (others=>'0');
begin
	cin_rca(0)<='0';
	cin_rca(1)<='1';
	with cin select sum<=
		s(width-1 downto 0) when '0',
		s(2*width-1 downto width) when others;

	Inst_muxn_sum: muxn_1 
	generic map(1)
	PORT MAP(
		inputs =>c,
		selectors(0)=>cin,
		output =>cout
	);
	
	Duplicate: for i in 0 to 1 generate
		rca: ripple_carry_adder 
			generic map(width)
			PORT MAP(
			X => A,
			Y => B,
			cin =>cin_rca(i),
			cout => c(i),
			sum =>s((width*(i+1))-1 downto width*i)
			);
		end generate duplicate;
end Behavioral;

