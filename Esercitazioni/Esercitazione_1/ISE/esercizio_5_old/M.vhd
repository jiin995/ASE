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

entity M is
    Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : out  STD_LOGIC_VECTOR (2 downto 0));
end M;

architecture structural of M is

	component full_adder is 
	  port (  X   :   in  STD_LOGIC;
				 Y   :   in  STD_LOGIC;
				 CIN :   in  STD_LOGIC;
				 S   :   out STD_LOGIC;
				 C   :   out STD_LOGIC

	  );
	end component;
	
-- signals used for connect the carry output of full_adders to input of adder on second level adders
	signal C : STD_LOGIC_VECTOR ( 3 downto 0) :=( others => '0' );

-- signals used for connect the sum output of full_adders to input of adder on second level adders
	signal S	: STD_LOGIC_VECTOR (	3 downto 0) :=( others => '0' ); 


begin

	adder_0: full_adder port map (		X => X(0),
													Y => X(1),
													CIN => X(2),
													S => S(0),
													C => C(0) );

	adder_1: full_adder port map (		X => X(3),
													Y => X(4),
													CIN => X(5),
													S => S(1),
													C => C(1) );

	adder_2: full_adder port map (		X => S(0),
													Y => S(1),
													CIN => '0',
													S => S(2),
													C => C(2) );

	adder_3: full_adder port map (		X => C(0),
													Y => C(1),
													CIN => C(2),
													S => S(3),
													C => C(3) );

	
	Y(0) <= S(2);
	Y(1) <= S(3);
	Y(2) <= C(3);

end structural;
