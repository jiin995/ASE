----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:35 02/14/2019 
-- Design Name: 
-- Module Name:    fsm_moore - Behavioral 
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

entity fsm_moore is
    Port ( clock : in  STD_LOGIC;
           value_in : in  STD_LOGIC;
           value_out : out  STD_LOGIC);
end fsm_moore;

architecture Behavioral of fsm_moore is
	type state_type is (init, got1,got10, got101, got1011, got10110, got101100, got1011001);

	signal current_state, next_state: state_type;
begin

	--process 1: aggiornamento di stato (Moore)
	update_state: process(clock)
		begin
			if rising_edge(clock) then
				current_state <= next_State;
			end if;
	end process;
	
	value_out <= '1' when current_state = got1011001 else '0';
	
	--process 2: parte combinatoria della fsm (Mealy)
	
	process(current_state, value_in)
		begin
		case current_state is
		when init => 
			if value_in = '0' then next_state <= init; else next_state <= got1;
			end if;
		when got1 =>
			if value_in = '0' then next_state <= got10; else next_state <= got1;
			end if;
		when got10 =>
			if value_in = '0' then next_state <= init; else next_state <= got101;
			end if;
		when got101 =>
			if value_in = '0' then next_state <= got10; else next_state <= got1011;
			end if;
		when got1011 =>
			if value_in = '0' then next_state <= got10110; else next_state <= got1;
			end if;
		when got10110 =>
			if value_in = '0' then next_state <= got101100; else next_state <= got101;
			end if;
		when got101100 =>
			if value_in = '0' then next_state <= init; else next_state <= got1011001;
			end if;
		when got1011001 =>
			if value_in = '0' then next_state <= init; else next_state <= got1;
			end if;
		when others => 
			next_state <= init;
		end case;
		
	end process;

end Behavioral;

