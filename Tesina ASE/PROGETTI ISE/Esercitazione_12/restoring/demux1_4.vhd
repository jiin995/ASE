--This file describes a mux4_1
--Mario Barbareschi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_4 is
    Port ( SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           A   : in  STD_LOGIC;
           X   : out STD_LOGIC_VECTOR(3 downto 0)
   );
end demux1_4;

architecture structural of demux1_4 is

	component demux1_2 is
    	Port ( 	SEL : in  STD_LOGIC;
				A   : in  STD_LOGIC;
				X   : out STD_LOGIC_VECTOR(1 downto 0)
			  );
	end component;

signal demux_out0 : std_logic_vector(1 downto 0) := "00";
--signal demux_out1 : std_logic_vector(1 downto 0) := "00";
--signal demux_out2 : std_logic_vector(1 downto 0) := "00";

begin

	inst_demux0 : demux1_2 port map(
								SEL => SEL(1),
								A => A,
								x => demux_out0
								);
	
	inst_demux1 : demux1_2 port map(
								SEL => SEL(0),
								A => demux_out0(0),
								x => X(1 downto 0)
								);
	
	inst_demux2 : demux1_2 port map(
								SEL => SEL(0),
								A => demux_out0(1),
								x => X(3 downto 2)
								);


end structural;
