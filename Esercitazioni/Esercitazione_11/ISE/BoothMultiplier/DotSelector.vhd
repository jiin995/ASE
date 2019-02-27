----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:26 11/11/2017 
-- Design Name: 
-- Module Name:    DotSelector - Behavioral 
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

entity DotSelector is
    Port ( dots : in  STD_LOGIC_VECTOR (3 downto 0);
           counter : in  STD_LOGIC_VECTOR (1 downto 0);
           dot : out  STD_LOGIC);
end DotSelector;

--si tratta di un semplice mux4_1
architecture Behavioral of DotSelector is

	COMPONENT mux4_1
	PORT(
		SEL : IN std_logic_vector(1 downto 0);
		A : IN std_logic_vector(3 downto 0);          
		X : OUT std_logic
		);
	END COMPONENT;
	
begin

	Inst_mux4_1: mux4_1 PORT MAP(
		SEL => counter,
		A => dots,
		X => dot 
	);
	
end Behavioral;

