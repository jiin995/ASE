library IEEE;
    use IEEE.STD_LOGIC_1164.all;

-- Descrizione
--! Somma tre stringhe di bit per poter realizzare la logica di un carry save e viene posto
--! prima del ripple carry in un carry save adder

entity carrySave_logic is 
    generic ( width     :NATURAL :=8    );
    port (
            X       : in     STD_LOGIC_VECTOR (width-1 downto 0);
            Y       : in     STD_LOGIC_VECTOR (width-1 downto 0);
            Z       : in     STD_LOGIC_VECTOR (width-1 downto 0);
            S       : out    STD_LOGIC_VECTOR (width-1 downto 0);
            CS      : out    STD_LOGIC_VECTOR (width-1 downto 0)
    );
end entity;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture structural of carrySave_logic is 

    component full_adder is 
        port (
                x       :   in  STD_LOGIC;
                y       :   in  STD_LOGIC;
                c_in    :   in  STD_LOGIC;
                s       :   out STD_LOGIC;  
                c_out   :   out STD_LOGIC
        );
    end component;

    signal S_temp   : STD_LOGIC_VECTOR (width-1 downto 0) := ( others => '0' ); 
    signal CS_temp  : STD_LOGIC_VECTOR (width-1 downto 0) := ( others => '0' );

--================================================================================================
-- architecture structural of rippleCarry_adder begin
--================================================================================================

    begin  
        S   <= S_temp;
        CS  <= CS_temp;

        carry_saves: for i in 0 to (width-1) generate
            f_adder: full_adder port map (
                                            x       => X(i),
                                            y       => Y(i),
                                            c_in    => Z(i),
                                            s       => S_temp(i),
                                            c_out   => CS_temp(i)
        );
        end generate carry_saves;
    end structural;

--================================================================================================
-- architecture structural of rippleCarry_adder end
--================================================================================================
