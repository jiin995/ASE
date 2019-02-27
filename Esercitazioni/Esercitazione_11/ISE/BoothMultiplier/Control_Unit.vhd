----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:08 01/26/2018 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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

entity Control_Unit is
    Port ( reset_n : in  STD_LOGIC;
			  reset_counter_n : out std_logic;
           count_in : out  STD_LOGIC;
           subtract : out  STD_LOGIC;
           start_mul : in  STD_LOGIC;
           load_aq_n : out  STD_LOGIC;
           en_a : out  STD_LOGIC;
           en_q : out  STD_LOGIC;
			  reset_a_n : out std_logic;
           counter : in  STD_LOGIC;
			  clock	: in std_logic;
           Q_0q_m1 : in  STD_LOGIC_vector(1 downto 0));
end Control_Unit;

architecture Behavioral of Control_Unit is

	type state is (Idle,Init,Operate,shift);
	signal next_state,current_state : state :=idle;

begin
	Reg: process(clock,reset_n)
		begin 
			if reset_n='0' then
				current_state<=Idle;
			elsif (clock='1' and clock'event) then
				current_state<=next_state;
			end if;
	end process;

	Comb: process(q_0q_m1,counter,current_state,start_mul)
		begin
		
		en_a<='0';
		en_q<='0';
		reset_a_n<='1';
		load_aq_n<='0';
		count_in<='0';
		reset_counter_n<='1';
		subtract<='0';		-- per rimuovere il latch che altrimenti si verrebbe a creare
		
		case current_state is
		
			when idle=>
				if start_mul='1' then
					next_state<=Init;
				else
					next_state<=Idle;
				end if;
					
			when Init=>
				reset_counter_n<='0';
				en_a<='1';
				en_q<='1';
				reset_a_n<='0';
				next_state<=Operate;
			
			when Operate=>
				if Q_0q_m1="01" then
					en_a<='1';
					subtract<='0';
					next_state<=shift;
				elsif Q_0q_m1="10" then
					en_a<='1';
					subtract<='1';
					next_state<=shift;
				else
					next_state<=shift;
				end if;
				
			when shift=>
				en_a<='1';
				en_q<='1';
				load_aq_n<='1';
				if counter='0' then
					count_in<='1';
					next_state<=Operate;
				else
					next_state<=Idle;
				end if;
		end case;
	end process;
end Behavioral;

