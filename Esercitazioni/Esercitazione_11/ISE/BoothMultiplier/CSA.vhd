----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:46 11/25/2017 
-- Design Name: 
-- Module Name:    CSA - Structural 
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

entity CSA is
	generic ( n : natural :=16 );
    Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (n-1 downto 0));
end CSA;

architecture Structural of CSA is

	
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
	
	component Partial_block_CSA is
	generic (width : natural);
    Port ( A : in  STD_LOGIC_VECTOR (width-1 downto 0);
           B : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (width-1 downto 0));
	end component;
	
	
	constant p : natural := 4;
	constant M : natural := n/p;
	signal carry : std_logic_vector(M downto 0):=(others=>'0');

begin
	carry(0)<=cin;
	cout<=carry(M);
	
	Carry_select_adder: for i in 0 to M-1 generate
	
		First: if i=0 generate
			first_ripple_carry_adder: ripple_carry_adder 
			generic map(p)
			PORT MAP(
			X => A(p-1 downto 0),
			Y => B(p-1 downto 0),
			cin =>Carry(0) ,
			cout => carry(i+1),
			sum =>sum(p-1 downto 0)
			);
		end generate First;
		
		Partial_CSA: if i>0 generate
			partial_block: Partial_block_CSA
			generic map(p)
			port map(
			A=> A(((p*(i+1))-1) downto p*i),
			B=> B(((p*(i+1))-1) downto p*i),
			cin=>carry(i),
			cout=>carry(i+1),
			sum=>sum(((p*(i+1))-1) downto p*i)
			);
		end generate Partial_CSA;
	end generate Carry_select_adder;
	

end Structural;

