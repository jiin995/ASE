----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:56 02/14/2019 
-- Design Name: 
-- Module Name:    fsm_mealy - Behavioral 
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

entity fsm_mealy is
    Port ( clock : in  BIT;
           x : in  BIT;
           y : out  BIT);
end fsm_mealy;

architecture singular_state_machine of fsm_mealy is

	type state is (init, got1, got10, got101, got1011, got10110, got101100);
	
	type state_vector is array(natural range<>) of state;
	function one_of (source: state_vector) return state is
	begin
		return source(source'left);
	end one_of;
	
	signal current: one_of state register := init;
	
	begin
	clocking: block(clock='1' and not clock'stable)
		begin
			q0: block (current=init and guard)
			begin
				current<= guarded got1 when x='1' else init;
			end block q0;
			q1: block (current=got1 and guard)
			begin
				current<= guarded got10 when x='0' else got1;
			end block q1;
			q2: block (current=got10 and guard)
			begin
				current<= guarded got101 when x='1' else init;
			end block q2;
	
			q3: block (current=got101 and guard)
			begin
				current<= guarded got1011 when x='1' else got10;
			end block q3;
			
			q4: block (current=got1011 and guard)
			begin
				current<= guarded got10110 when x='0' else got1;
			end block q4;
			
			q5: block (current= got10110 and guard)
			begin
				current<= guarded got101100 when x='0' else got1;
			end block q5;
			
			q6: block (current=got101100 and guard)
			begin
				current<= guarded init;
				y<= '1' when x='1' and current=got101100 else '0';
			end block q6;
			
	end block clocking;

end singular_state_machine;

