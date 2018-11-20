library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity complementizer_2 is
    generic ( width     :   NATURAL :=8
    );
    port (  X   :   in  STD_LOGIC_VECTOR ((width-1) downto 0);
            Y   :   out STD_LOGIC_VECTOR ((width-1) downto 0);
    );
end complementizer_2;

architecture dataflow of complementizer_2 is

signal diminishedComplement : STD_LOGIC_VECTOR ((width-1) downto 0) :=(others => '0');
signal Y_TEMP               : STD_LOGIC_VECTOR ((width-1) downto 0) :=(others => '0');

begin
    Y <= Y_TEMP;
    diminishedComplement <= not X;
    --da fare contatore modulo n con preload!
    Y_TEMP <= Y_TEMP + '1';
end;