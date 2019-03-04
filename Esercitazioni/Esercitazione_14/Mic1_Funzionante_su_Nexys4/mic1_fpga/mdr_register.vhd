----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:59 03/30/2009 
-- Design Name: 
-- Module Name:    mdr_register - Behavioral 
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

entity mdr_register is
	port(
		ck : in std_logic;
		wcbtr_mdr : in std_logic;
		rread_ritardato : in std_logic;
		inguscita_mdr : in std_logic_vector(31 downto 0);
		c_bus : in std_logic_vector(31 downto 0);
		uscita_mdr : out std_logic_vector(31 downto 0):=x"00000000"
	);
end mdr_register;

architecture Behavioral of mdr_register is
		signal select_input : std_logic_vector(31 downto 0);

begin

	process(ck)  --processo per registro con logica di enable
	begin
		if (rising_edge(ck)) then  --fronte di salita clock	
			if ((wcbtr_mdr = '1' and rread_ritardato = '0') or (wcbtr_mdr = '0' and rread_ritardato = '1')) then  
				uscita_mdr<=select_input;  --legge dal mux e memorizza solo se ad 1 uno solo dei due ingressi di selezione
			end if;
		end if;	
	end process;

   --mux per selezione dell'ingresso tra i due
	select_input <= c_bus when (wcbtr_mdr = '1' and rread_ritardato = '0') else
						 inguscita_mdr when (wcbtr_mdr = '0' and rread_ritardato = '1') else
						 c_bus;  --per default
	

end Behavioral;

