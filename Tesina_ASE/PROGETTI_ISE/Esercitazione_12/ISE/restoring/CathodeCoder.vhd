---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: CathodeCoder.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente che codifica i catodi di un display a 7 segmenti
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CathodeCoder is
    Port ( nibble : in  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (6 downto 0));
end CathodeCoder;

architecture Behavioral of CathodeCoder is

constant zero   : std_logic_vector(6 downto 0) := "1000000"; 
constant one    : std_logic_vector(6 downto 0) := "1111001"; 
constant two    : std_logic_vector(6 downto 0) := "0100100"; 
constant three  : std_logic_vector(6 downto 0) := "0110000"; 
constant four   : std_logic_vector(6 downto 0) := "0011001"; 
constant five   : std_logic_vector(6 downto 0) := "0010010"; 
constant six    : std_logic_vector(6 downto 0) := "0000010"; 
constant seven  : std_logic_vector(6 downto 0) := "1111000"; 
constant eight  : std_logic_vector(6 downto 0) := "0000000"; 
constant nine   : std_logic_vector(6 downto 0) := "0010000"; 
constant a   	 : std_logic_vector(6 downto 0) := "0001000"; 
constant b      : std_logic_vector(6 downto 0) := "0000011"; 
constant c      : std_logic_vector(6 downto 0) := "1000110"; 
constant d      : std_logic_vector(6 downto 0) := "0100001"; 
constant e      : std_logic_vector(6 downto 0) := "0000110"; 
constant f      : std_logic_vector(6 downto 0) := "0001110";

begin

	with nibble select cathodes <=
		zero 	 				when x"0",
		one  	 				when x"1",
		two  	 				when x"2",
		three	 				when x"3",
		four 	 				when x"4",
		five 	 				when x"5",
		six  	 				when x"6",
		seven	 				when x"7",
		eight	 				when x"8",
		nine 	 				when x"9",
		a   	 				when x"A",
		b    	 				when x"B",
		c    	 				when x"C",
		d    	 				when x"D",
		e    	 				when x"E",
		f    	 				when x"F",
		"1111111"			when others;

end Behavioral;

