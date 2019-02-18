library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL;

-- funziona solo su ise


entity muxn_1 is 
    generic (   SELECT_WIDTH    : NATURAL := 3);
    port    (   SEL             : in    STD_LOGIC_VECTOR (SELECT_WIDTH downto 0);
                X               : in    STD_LOGIC_VECTOR (2**SELECT_WIDTH downto 0);
                Y               : out   STD_LOGIC 
    );
end muxn_1;


architecture dataflow of muxn_1 is 

begin

    Y <= X(conv_integer(SEL));

end dataflow; 