----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:12 11/10/2018 
-- Design Name: 
-- Module Name:    machine_M - structural 
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
--todo 
	-- si puo' fare con un unico for generate e si deve provare anche 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity machine_M is
    Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : out  STD_LOGIC_VECTOR (2 downto 0));
end machine_M;

architecture structural of machine_M is

	component full_adder is 
	  port (  X   :   in  STD_LOGIC;
				 Y   :   in  STD_LOGIC;
				 CIN :   in  STD_LOGIC;
				 S   :   out STD_LOGIC;
				 C   :   out STD_LOGIC

	  );
	end component;
-- signals used for connect the carry output of full_adders to input of adder on second level adders
	signal C : STD_LOGIC_VECTOR ( 1 downto 0) :=( others => '0' );

-- signals used for connect the sum output of full_adders to input of adder on second level adders
	signal S	: STD_LOGIC_VECTOR (	1 downto 0) :=( others => '0' ); 

-- signals used for connect the carry output of second level adder to adder of same level
	signal C_1 : STD_LOGIC :='0';

begin

-- generate the two adders on input
	in_adders_0: for i in 0 to 1 generate 
		in_adder_0: full_adder port map (	X => X(i*3),
														Y => X((i*3)+1),
														CIN => X((i*3)+2),
														S => S(i),
														C => C(i));
	end generate in_adders_0;

	adder_1_1: full_adder port map (		X => S(0),
													Y => S(1),
													CIN => '0',
													S => Y(0),
													C => C_1);

	adder_1_2: full_adder port map (		X => C(0),
													Y => C(1),
													CIN => C_1,
													S => Y(1),
													C => Y(2));

end structural;

