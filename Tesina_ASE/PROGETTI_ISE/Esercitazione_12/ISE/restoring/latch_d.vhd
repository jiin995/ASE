---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: latch_d.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	latch D
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

entity edge_trigger_dn is
	generic ( width : integer);
    Port ( d : in  STD_LOGIC_vector(width-1 downto 0);
           en : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_vector(width-1 downto 0));
end edge_trigger_dn;

architecture Behavioral of edge_trigger_dn is

begin

process(d,clk,en,reset_n)

	begin
			if( reset_n='0') then
				q<=(others=>'0');
			elsif ( en ='1' and rising_edge(clk)) then
				q<=d;
			end if;
end process;
end Behavioral;

