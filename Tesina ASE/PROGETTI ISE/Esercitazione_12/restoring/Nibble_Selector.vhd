---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: Nibble_Selector.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente che seleziona il nibble corretto
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


entity NibbleSelector is
    Port ( nibbles : in  STD_LOGIC_VECTOR (15 downto 0);
           counter : in  STD_LOGIC_VECTOR (1 downto 0);
           nibbleSelected : out  STD_LOGIC_VECTOR (3 downto 0));
end NibbleSelector;

architecture structural of NibbleSelector is

COMPONENT mux4_1
PORT(
	SEL : IN std_logic_vector(1 downto 0);
	A : IN std_logic_vector(3 downto 0);          
	X : OUT std_logic
	);
END COMPONENT;

type matrix is array(0 to 3) of std_logic_vector(3 downto 0);
signal nibble : matrix;

begin
	
	with counter select nibbleSelected <=
		nibbles(3 downto 0) when "00",
		nibbles(7 downto 4) when "01",
		nibbles(11 downto 8) when "10",
		nibbles(15 downto 12) when "11",
		x"0" when others;
		
--	nibble(0) <= (nibbles(15),nibbles(11),nibbles(7),nibbles(3));
--	nibble(1) <= (nibbles(14),nibbles(10),nibbles(6),nibbles(2));
--	nibble(2) <= (nibbles(13),nibbles(9),nibbles(5),nibbles(1));
--	nibble(3) <= (nibbles(12),nibbles(8),nibbles(4),nibbles(0));	
--	
--	gen : for i in 0 to 3 generate
--		Inst_mux4_1: mux4_1 PORT MAP(
--			SEL => counter,
--			A => nibble(i),
--			X => nibbleSelected(i)
--		);
--	end generate;

end structural;

