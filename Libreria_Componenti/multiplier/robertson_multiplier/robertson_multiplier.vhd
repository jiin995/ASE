library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity robertson_multiplier is
    GENERIC ( N :   INTEGER :=  8
        );
    PORT    (   X       :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                Y       :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                start   :   in  STD_LOGIC;
                clock   :   in  STD_LOGIC;
                reset_n :   in  STD_LOGIC;
                stop    :   out STD_LOGIC;
                Z       :   out STD_LOGIC_VECTOR ((2*N)-1 downto 0);
        );

end robertson_multiplier;

architecture Structural of robertson_multiplier is

component

begin
end Structural;