---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : d_edge_behav
--
-- unit name: d_edge_behav.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	flipflop d realizzato con descrizione behavioural
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


library ieee ;
use ieee.std_logic_1164.all;
use work.all;

---------------------------------------------

entity d_edge is
generic(width : natural := 8);
port(
		clock: in STD_LOGIC;
		D:	in STD_LOGIC_VECTOR(width-1 downto 0);
		Q:	out STD_LOGIC_VECTOR(width-1 downto 0));
end d_edge;

----------------------------------------------

architecture behv of d_edge is
begin

    process(D, clock)
    begin
        --! clock rising edge
		if rising_edge(clock) then
			Q <= D;
		end if;
    end process;	

end behv;

----------------------------------------------
