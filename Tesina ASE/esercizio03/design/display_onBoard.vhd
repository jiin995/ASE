----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:34 11/18/2018 
-- Design Name: 
-- Module Name:    display_onBoard - Behavioral 
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

entity display_onBoard is
    Port ( clock : in  STD_LOGIC;
           values : in  STD_LOGIC_VECTOR (15 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_onBoard;

architecture structural of display_onBoard is

signal enable_digit :STD_LOGIC_VECTOR (3 downto 0):= "0011";--(others => '1');
signal reset : STD_LOGIC := '0';
signal dots : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

component display_7_segmenti is
	port ( 	clock 			: in STD_LOGIC;
				reset				: in STD_LOGIC;
				values 			: in STD_LOGIC_VECTOR (15 downto 0);
				dots 				: in STD_LOGIC_VECTOR (3 downto 0) ;
				enable_digit	: in STD_LOGIC_VECTOR (3 downto 0);	
				anodes 			: out STD_LOGIC_VECTOR (3 downto 0);
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

alias anodes_0_3 is anodes (3 downto 0);	-- i bit da 3 a 0 di values
alias anodes_4_7 is anodes (7 downto 4);	-- i bit da 7 a 4 di values


begin

	display: display_7_segmenti port map (	clock => clock,
														reset => reset,
														values => values,
														dots => dots,
														enable_digit => enable_digit,
														anodes => anodes_0_3,
														cathodes => cathodes
											);
	anodes_4_7 <= (others => '1');
	
end structural;

