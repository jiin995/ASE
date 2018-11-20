library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity carryLookAhead_adder is 
    generic (   width     :   NATURAL :=2
    );
    port (  --! carryLookAhead_adder input   : carry 
            c_in   :   in STD_LOGIC;  
            --! carryLookAhead_adder inputs  : firsr addend
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! carryLookAhead_adder inputs  : second addend
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
            --! carryLookAhead_adder output  : carry
            c_out   :   out STD_LOGIC ;
            --! carryLookAhead_adder outputs : sum
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0)
    );
end carryLookAhead_adder;

architecture structural of carryLookAhead_adder is  

    component full_adder is 
        port (
                x   :   in  STD_LOGIC;
                y   :   in  STD_LOGIC;
                c_in :   in  STD_LOGIC;
                s   :   out STD_LOGIC;  
                c_out   :   out STD_LOGIC
        );
    end component;

    component generationPropagationCarry is
        generic (   width : NATURAL :=width
        );
        port (  X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
                Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
                G       :   out  STD_LOGIC_VECTOR (width-1 downto 0);    
                P       :   out  STD_LOGIC_VECTOR (width-1 downto 0) 
        );
    end component;

    --Segnale che tiene conto del riporto generato
    signal G    :   STD_LOGIC_VECTOR ((width-1) downto 0);
    --Segnale che tiene conto del riporto propagato
    signal P    :   STD_LOGIC_VECTOR ((width-1) downto 0);

    --Segnale di supporto per la somma
    signal S_TEMP       :   STD_LOGIC_VECTOR  ((width-1) downto 0) := (others => '0'); 
    --Segnale per collegare a niete le uscite del fulladder
    signal C_null       :   STD_LOGIC_VECTOR ((width-1) downto 0) := (others => '0'); 
    --carry calcolato con tecninca ahead
    signal C  :   STD_LOGIC_VECTOR ((width) downto 0) := (others => '0'); 
begin
--trucco per rendere la struttura generale
    C(0) <= c_in;
    c_out <= C(width) ;

    S <= S_TEMP;
    --collego la rete che calcolo i G e P
    genPropagationCarry : generationPropagationCarry port map ( X => X,
                                                                Y => Y,
                                                                G => G,
                                                                P => P
    );

    carryLookAhead: for i in 0 to (width-1) generate
        --rete che calcola il carry in ingress
        carryAhead : 
                    C(i+1) <= G(i) or (P(i) and C(i));
        --rete che fa la somma
        fullAdder : 
                    full_adder port map (   x => X(i),
                                            y => Y(i),
                                            c_in => C (i),
                                            s => S_TEMP(i)
                                            --c_out => C(i)

                    );
    end generate carryLookAhead;

end structural;