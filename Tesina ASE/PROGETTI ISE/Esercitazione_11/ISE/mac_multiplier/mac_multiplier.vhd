library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mac_multiplier is 
    generic (   N : NATURAL := 128;  -- parallelismo primo operando
                M : NATURAL := 128   -- parllelismo secondo operando
    );
    port    (   X   :   in  STD_LOGIC_VECTOR (N-1 downto 0);    -- moltiplicando
                Y   :   in  STD_LOGIC_VECTOR (M-1 downto 0);    -- moltiplicatore
                P   :   out STD_LOGIC_VECTOR ((N+M)-1 downto 0) -- prodotto (su M+N bit)
    );
end mac_multiplier;

architecture structural of mac_multiplier is

component mac_cell is 
    port (  X       : in    STD_LOGIC;
            Y       : in    STD_LOGIC;
            C_in    : in    STD_LOGIC;
            S_in    : in    STD_LOGIC;
            C_out   : out   STD_LOGIC;
            S_out   : out   STD_LOGIC
    );
end component;

--matrici più grandi per fare un for generate regolare e evitare if generate
type matrix is array(M downto 0, N downto 0) of std_logic;
signal carry_int    : matrix := (others => (others => '0')); --ultima riga non usata
signal partial_sum  : matrix := (others => (others => '0'));-- (0,0) primo bit del risultato

begin

    mac_rows : for i in 0 to M-1 generate           -- i indice di riga
        mac_columns : for j in 0 to N-1 generate    -- j indice di colonna
            mac_cell_inst : mac_cell port map ( X       => X(j),                -- ogni cella (i,j), avrà X(j) e Y(i) in ingresso
                                                Y       => Y(i),
                                                C_in    => carry_int (i,j),     -- carry in ingresso (i,j)
                                                S_in    => partial_sum(i,j+1),  -- somma parziale in ingresso (i, j+1)
                                                C_out   => carry_int(i,j+1),    -- carry in uscita (i, j+1)
                                                S_out   => partial_sum(i+1,j)   -- somma parziale (i+1, j)
            );
        end generate;
        partial_sum (i+1,N) <= carry_int(i,N); -- l'ultimo carry in uscita della riga diventa la somma parziale iniziale della colonna successiva
    end generate;


    result_M : for i in 0 to M-1 generate 
        P(i) <= partial_sum(i+1,0); -- i primi M bit del risultato sono ricavabili in corrispondenza delle somme parziali (i+1, 0)
    end generate;


    result_N : for i in 1 to N generate
	    P(i+M-1) <= partial_sum(M,i);  -- i restanti N bit del risultato sono ricavabili dall'ultima riga della matrice delle somme parziali
	end generate;

end structural;