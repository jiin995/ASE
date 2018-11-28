library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity carrySelect_adder is 
    generic (   width   : NATURAL := 8
    -- Come metto M e P, marco e co fanno la stima dei tempi e mettono solo width da cui ricavano poi M e P 
    -- io direi di fare una versione con M e P espliciti e una versione come l'hanno fatta loro, ma su quella
    --resta da capire come fanno a prendere solo una parte del segnale 
    );
    port (
            A       : in    STD_LOGIC_VECTOR ((M*P-1) downto 0);
            B       : in    STD_LOGIC_VECTOR ((M*P-1) downto 0);
            c_in    : in    STD_LOGIC ;
            S       : out   STD_LOGIC_VECTOR ((M*P-1) downto 0);
            c_out   : out   STD_LOGIC
    );
end carrySelect_adder;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture structural of carrySelect_adder is



begin
    c_out <= c_in;
end structural;