---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : carry_select
--
--! unit name: d_edge_behav.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      Implementazione di un flipflop D rising edge
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <14/11/2018> <13/11/2018> <log>
--!              create
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
