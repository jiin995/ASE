---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : non_restoring
--
-- unit name: CathodeManager.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente che permette di gestire i catodi di un display a 7 segmenti
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

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CathodeManager is
    Port ( counter : in  STD_LOGIC_VECTOR (1 downto 0);
           nibbles : in  STD_LOGIC_VECTOR (15 downto 0);
           dots : in  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end CathodeManager;

architecture structural of CathodeManager is
	
	COMPONENT mux4_1
	PORT(
		SEL : IN std_logic_vector(1 downto 0);
		A : IN std_logic_vector(3 downto 0);          
		X : OUT std_logic
		);
	END COMPONENT;

	COMPONENT NibbleSelector
	PORT(
		nibbles : IN std_logic_vector(15 downto 0);
		counter : IN std_logic_vector(1 downto 0);          
		nibbleSelected : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT CathodeCoder
	PORT(
		nibble : IN std_logic_vector(3 downto 0);          
		cathodes : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

signal dot : std_logic := '0';
signal nibble : std_logic_vector(3 downto 0) := (others => '0');

begin

	Inst_mux4_1: mux4_1 PORT MAP(
		SEL => counter,
		A => dots,
		X => dot
	);

	cathodes(7) <= not(dot);
	
	Inst_NibbleSelector: NibbleSelector PORT MAP(
		nibbles => nibbles,
		counter => counter,
		nibbleSelected => nibble
	);
	
	Inst_CathodeCoder: CathodeCoder PORT MAP(
		nibble => nibble,
		cathodes => cathodes(6 downto 0)
	);

end structural;
