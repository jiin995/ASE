library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mac_multiplier is 
    generic (   N : NATURAL := 2;  -- parallelismo primo operando
                M : NATURAL := 2   -- parllelismo secondo operando
    );
    port    (   X   :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                Y   :   in  STD_LOGIC_VECTOR (M-1 downto 0);
                Z   :   out STD_LOGIC_VECTOR ((N+M)-1 downto 0)
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

    intializete_c_in_int        : for i in 0 to M-1 generate 
        carry_int(i,0)  <= '0';
    end generate;

    initializate_partial_sum    : for i in 0 to N-1 generate  
        partial_sum(0,i) <= '0';
    end generate;

    mac_matrix  : for i in 0 to M-1 generate 
        mac_row : for j in 0 to N-1 generate 
            mac_cell_inst : mac_cell port map ( X       => X(j),
                                                Y       => Y(i),
                                                C_in    => carry_int (i,j),
                                                S_in    => partial_sum(i,j+1),
                                                C_out   => carry_int(i,j+1),
                                                S_out   => partial_sum(i+1,j)
            );
        end generate;
        partial_sum (i+1,N) <= carry_int(i,N);
        -- primi m bit del risultato 
        Z(i)    <= partial_sum(i+1,0);
    end generate;

    complete_res : for i in 1 to N generate
        -- inserisco gli altri n bit del risultato
		Z(i+M-1) <= partial_sum(M,i);
	end generate;

end structural;