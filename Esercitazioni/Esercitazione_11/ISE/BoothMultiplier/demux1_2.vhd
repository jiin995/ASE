--This file describes a mux2_1
--Mario Barbareschi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_2 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC;
           X   : out STD_LOGIC_VECTOR(1 downto 0)
   );
end demux1_2;

architecture dataflow of demux1_2 is

begin
	
	X(0) <= A and (not SEL);
	X(1) <= A and SEL;

end dataflow;
