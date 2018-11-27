----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:49:41 09/16/2012 
-- Design Name: 
-- Module Name:    counter_mod4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_mod2n is

    generic (   n               :   NATURAL := 1;	--! usato per definire il valore massimo (2**n)-1 di fine conteggio.
                enable_level    :   std_logic := '1'	--! definisce il livello enable
    );
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   enable : in STD_LOGIC;
           counter : out  STD_LOGIC_VECTOR (n-1 downto 0)
		   );

end counter_mod2n;

architecture Behavioral of counter_mod4 is

	signal c : STD_LOGIC_VECTOR ((n-1) downto 0) := (others => '0');

	constant max_value : NATURAL = ((2**n)-1);

begin

	counter_process: process(clock, reset, c)

	begin
		
		counter <= c;
		
		if reset = '0' then
			c <= (others => '0');
		elsif rising_edge(clock) AND enable = '1' then
			if c = max_value then
				c <= (others => '0');
			else
				c <= std_logic_vector(unsigned(c) + 1);
			end if;
		end if;

	end process;

end Behavioral;

