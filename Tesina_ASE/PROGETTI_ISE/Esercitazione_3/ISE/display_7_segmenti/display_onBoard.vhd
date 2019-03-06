---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : display_onBoard
--
-- unit name: display_onBoard.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	display_onBoard per il display a 7 segmenti
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

entity display_onBoard is
    Port ( clock : in  STD_LOGIC;
           values : in  STD_LOGIC_VECTOR (15 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_onBoard;

architecture structural of display_onBoard is

signal enable_int : STD_LOGIC := '1';
signal enable_digit :STD_LOGIC_VECTOR (3 downto 0):= "0011";--(others => '1');
signal reset : STD_LOGIC := '0';
signal dots : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

component display_7_segmenti is
	port ( 	enable			: in STD_LOGIC;
				clock 			: in STD_LOGIC;
				reset				: in STD_LOGIC;
				values 			: in STD_LOGIC_VECTOR (15 downto 0);
				dots 				: in STD_LOGIC_VECTOR (3 downto 0) ;
				enable_digit	: in STD_LOGIC_VECTOR (3 downto 0);	
				anodes 			: out STD_LOGIC_VECTOR (3 downto 0);
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

alias anodes_0_3 is anodes (3 downto 0);	--! i bit da 3 a 0 di values
alias anodes_4_7 is anodes (7 downto 4);	--! i bit da 7 a 4 di values


begin

	display: display_7_segmenti port map (	enable => enable_int,
														clock => clock,
														reset => reset,
														values => values,
														dots => dots,
														enable_digit => enable_digit,
														anodes => anodes_0_3,
														cathodes => cathodes
											);
	anodes_4_7 <= (others => '1');
	
end structural;

