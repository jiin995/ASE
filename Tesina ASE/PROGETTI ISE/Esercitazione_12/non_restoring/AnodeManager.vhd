----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    21:38:24 11/12/2017 
--! Design Name: 
--! Module Name:    AnodeManager - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AnodeManager is
    Port ( counter : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
end AnodeManager;

architecture structural of AnodeManager is

	COMPONENT demux1_4
	PORT(
		SEL : IN std_logic_vector(1 downto 0);
		A : IN std_logic;          
		X : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
signal anode_selected : std_logic_vector(3 downto 0) := (others => '0');

begin

	Inst_demux1_4: demux1_4 PORT MAP(
		SEL => counter,
		A => '1',
		X => anode_selected
	);
	
	anodes <= not(anode_selected and enable);
	
end structural;

