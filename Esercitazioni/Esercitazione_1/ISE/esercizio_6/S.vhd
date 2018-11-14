----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:24 11/14/2018 
-- Design Name: 
-- Module Name:    S - Behavioral 
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

entity S is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           C : in  STD_LOGIC_VECTOR (2 downto 0);
           D : in  STD_LOGIC_VECTOR (2 downto 0);
           E : in  STD_LOGIC_VECTOR (2 downto 0);
           F : in  STD_LOGIC_VECTOR (2 downto 0);
			  W : out STD_LOGIC_VECTOR (5 downto 0)
			  );
			  
end S;

architecture structural of S is

	component full_adder is 
	  port (  X   :   in  STD_LOGIC;
				 Y   :   in  STD_LOGIC;
				 CIN :   in  STD_LOGIC;
				 S   :   out STD_LOGIC;
				 C   :   out STD_LOGIC
			);
	end component;
	
	component M is
    Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : out  STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
-- signals used to store the output of the M0, M1 and M2 machines
	signal Y0 : STD_LOGIC_VECTOR ( 2 downto 0) :=( others => '0' );
	signal Y1 : STD_LOGIC_VECTOR ( 2 downto 0) :=( others => '0' );
	signal Y2 : STD_LOGIC_VECTOR ( 2 downto 0) :=( others => '0' );

-- signals used to store the carry output of full_adders 
	signal CARRY : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' );

-- signals used to store the sum output of full_adders 
	signal S	: STD_LOGIC_VECTOR (	5 downto 0) :=( others => '0' ); 
	
-- signals used to store the digits of same weight of the inputs (weight 0, 1 and 2)
	signal I0 : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' ); 
	signal I1 : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' ); 
	signal I2 : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' ); 

begin

	I0 <= (0 => A(0), 1 => B(0), 2 => C(0), 3 => D(0), 4 => E(0), 5 => F(0));
	I1 <= (0 => A(1), 1 => B(1), 2 => C(1), 3 => D(1), 4 => E(1), 5 => F(1));
	I2 <= (0 => A(2), 1 => B(2), 2 => C(2), 3 => D(2), 4 => E(2), 5 => F(2));

	M_0: M port map (	X => I0,
							Y => Y0
						);

	M_1: M port map (	X => I1,
							Y => Y1
						);
						
	M_2: M port map (	X => I2,
							Y => Y2
						);
						
	FA_0: full_adder port map (		X => Y0(1),
												Y => Y1(0),
												CIN => '0',
												S => S(0),
												C => CARRY(0)
										);
										
	FA_1: full_adder port map (		X => Y0(2),
												Y => Y1(1),
												CIN => Y2(0),
												S => S(1),
												C => CARRY(1)
										);
										
	FA_2: full_adder port map (		X => S(1),
												Y => CARRY(0),
												CIN => '0',
												S => S(2),
												C => CARRY(2)
										);
										
	FA_3: full_adder port map (		X => Y1(2),
												Y => Y2(1),
												CIN => CARRY(1),
												S => S(3),
												C => CARRY(3)
										);
										
	FA_4: full_adder port map (		X => S(3),
												Y => CARRY(2),
												CIN => '0',
												S => S(4),
												C => CARRY(4)
										);
										
	FA_5: full_adder port map (		X => Y2(2),
												Y => CARRY(3),
												CIN => CARRY(4),
												S => S(5),
												C => CARRY(5)
										);
									
	W <= (0 => Y0(0),1 => S(0),2 => S(2),3 => S(4),4 => S(5),5 => CARRY(5));


end structural;

