----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:23 02/14/2019 
-- Design Name: 
-- Module Name:    left_right_shift_register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		Registro a scorrimento con ingresso seriale e uscita seriale e parallela. 
--		se left 	= '1' shifta a sinistra
-- 	se left  = '0' shifta a destra 
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity left_right_shift_register is
	 GENERIC( N 	: integer := 8
			);
    Port ( clock 		: in  STD_LOGIC;
           enable 	: in  STD_LOGIC;
			  reset_n 	: in 	STD_LOGIC;
           left 		: in  STD_LOGIC;
			  d_in		: in 	STD_LOGIC;
			  q_out		: out STD_LOGIC;
           Q 			: out  STD_LOGIC_VECTOR (N-1 downto 0)
			 );
end shifterRegister;

architecture Behavioral of left_right_shift_register is

-- segnali interni al componente
signal q_temp 		: STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
signal q_out_temp	: STD_LOGIC := '0';

begin
	
	Q 		<= q_temp;
	q_out <= q_out_temp;
	
	shift:
		process(enable,clock,reset_n)
			begin 
				--reset, imposto tutte le celle a 0
				if(reset_n = '0') then 
					for i in 0 to N-1 loop
						q_temp(i) <= '0';
					end loop;
				-- controllo se devo eseguire un operazione di shift
				else if (rising_edge(clock) and enable = '1') then
					-- shift a sinistra
					if( left = '1') then 
						-- bit in uscita
						q_out_temp <= q_temp(N-1);
						-- shift a sinistra i bit che non sono nè il primo e nè l'ultimo
						for i in 0 to N-2 loop
							q_temp(i+1) <= q_temp(i);
						end loop;
						-- bit in ingresso
						q_temp(0) <= d_in; 
					--shift a destra
					else
						-- bit in uscita
						q_out_temp <= q_temp(0);
						-- shift a sinistra i bit che non sono nè il primo e nè l'ultimo
						for i in N-1 downto 2 loop
							q_temp(i) <= q_temp(i-1);
						end loop;
						-- bit in ingresso						
						q_temp(N-1) <= d_in;
					end if;
				end if;
				end if;
			end process;

end Behavioral;

