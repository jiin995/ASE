----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:14 03/30/2009 
-- Design Name: 
-- Module Name:    posedge_reg_enable - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity posedge_reg_enable is
	generic(valore_iniziale: std_logic_vector(31 downto 0) := x"00000000");
	port(
		ck : in std_logic;
		en : in std_logic;
		input_reg : in std_logic_vector(31 downto 0);
		output_reg : out std_logic_vector(31 downto 0):=valore_iniziale
	);
end posedge_reg_enable;

architecture Behavioral of posedge_reg_enable is

begin

	process (ck)
	begin  
		if (rising_edge(ck)) then  --fronte di salita clock
			if(en ='1')	then
				output_reg<=input_reg; 
			end if;
		end if;
	end process;

end Behavioral;

