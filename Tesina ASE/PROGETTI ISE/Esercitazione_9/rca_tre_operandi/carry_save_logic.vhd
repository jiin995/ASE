library IEEE;
    use IEEE.STD_LOGIC_1164.all;

--! Descrizione
--! Somma tre stringhe di bit per poter realizzare la logica di un carry save e viene posto
--! prima del ripple carry in un carry save adder

entity carry_save_logic is 
    generic ( width     : NATURAL := 4    );
    port (
            X       : in     STD_LOGIC_VECTOR (width-1 downto 0);
            Y       : in     STD_LOGIC_VECTOR (width-1 downto 0);
            Z       : in     STD_LOGIC_VECTOR (width-1 downto 0);
            T       : out    STD_LOGIC_VECTOR (width-1 downto 0);       --! somme dei 3 bit di stesso peso di X, Y e Z
            CS      : out    STD_LOGIC_VECTOR (width-1 downto 0)        --! riporti uscenti dai carry save blocks
    );
end entity;

architecture structural of carry_save_logic is 

    component full_adder is 
        port (
                x       :   in  STD_LOGIC;
                y       :   in  STD_LOGIC;
                c_in    :   in  STD_LOGIC;
                s       :   out STD_LOGIC;  
                c_out   :   out STD_LOGIC
        );
    end component;

    begin 

        carry_save_blocks: for i in 0 to (width-1) generate     --! generazione dei carry save blocks (full adder) 
            carry_save_block: full_adder port map (
                                            x       => X(i),
                                            y       => Y(i),
                                            c_in    => Z(i),
                                            s       => T(i),
                                            c_out   => CS(i)
        );
        end generate carry_save_blocks;

    end structural;
