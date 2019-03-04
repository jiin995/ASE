library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity carrySelect_adder is 
    generic (  
    -- M parallelismo dei ripplecarry adder
                M    : NATURAL := 4;
    -- P parallelismo delle celle dell carry select
                P        : NATURAL := 2
    -- Come metto M e P, marco e co fanno la stima dei tempi e mettono solo (M*P) da cui ricavano poi M e P 
    -- io direi di fare una versione con M e P espliciti e una versione come l'hanno fatta loro, ma su quella
    --resta da capire come fanno a prendere solo una parte del segnale 
    );
    port (
            A       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- input addendo
            B       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- input addendo
            c_in    : in    STD_LOGIC ;                             -- input carry in ingresso
            S       : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- output somma
            c_out   : out   STD_LOGIC                               -- output carry in uscita
    );
end carrySelect_adder;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture structural of carrySelect_adder is

    component carrySelect_cell is 
        generic (   width   : NATURAL := M
        );
        port (
                A       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
                B       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
                c_in    : in    STD_LOGIC ;
                S       : out   STD_LOGIC_VECTOR ((width-1) downto 0);
                c_out   : out   STD_LOGIC
        );
    end component;

signal internal_carry : STD_LOGIC_VECTOR ((P) downto 0) := (others => '0');

--type arrays_of_VECTOR is array (0 to P-1) of STD_LOGIC_VECTOR ((M-1) downto 0);
--signal internal_sums : arrays_of_VECTOR; 

signal S_TEMP : STD_LOGIC_VECTOR (((M*P)-1) downto 0 ) := (others => '0');

begin

    S <= S_TEMP;

    -- collego i segnali temporanei dei carry, con i porti esterni del componenti 
    -- in modo tale da non mettere if nel for generate
    c_out <= internal_carry(P);
    internal_carry(0) <= c_in; 

-- istanzio il numero di celle e le mappo con gli ingressi
    cells:
        for i in 0 to P-1 generate 
            cell: carrySelect_cell port map (   A       => A ((((i+1)*M)-1) downto (i*M)),
                                                B       => B ((((i+1)*M)-1) downto (i*M)),
                                                c_in    => internal_carry(i),
                                                S       => S_TEMP((((i+1)*M)-1) downto (i*M)),
                                                c_out   => internal_carry(i+1)
                            
            );
        end generate cells;

end structural;