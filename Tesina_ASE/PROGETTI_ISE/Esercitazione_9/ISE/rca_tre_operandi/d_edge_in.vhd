---------------------------------------------
--! D Flip-Flop (ESD book Chapter 2.3.1)
--! by Weijun Zhang, 04/2001
--
--! Flip-flop is the basic component in 
--! sequential logic design
--! we assign input signal to the output 
--! at the clock rising edge 
---------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;
use work.all;

---------------------------------------------

entity d_edge_in is
generic(width : natural := 8);
port(
		clock: in STD_LOGIC;
		D:	in STD_LOGIC_VECTOR(width-1 downto 0);
		Q:	out STD_LOGIC_VECTOR(width-1 downto 0));
end d_edge_in;

----------------------------------------------

architecture behv of d_edge_in is
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
