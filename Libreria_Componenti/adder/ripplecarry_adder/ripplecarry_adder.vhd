library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity ripplecarry_adder is 
    generic (
                width   : NATURAL := 8          --! used for define parallelismo of adder
    );

    port (--! ripplecarry_adder inputs  : firsr addend
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
        --! ripplecarry_adder inputs  : second addend
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
        --! ripplecarry_adder input   : carry 
            c_in    :   in  STD_LOGIC;                              
        --! ripplecarry_adder outputs : sum
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   
        --! ripplecarry_adder output  : carry
            c_out   :   out STD_LOGIC                             
    );
end ripplecarry_adder;

architecture structural of ripplecarry_adder is

    component full_adder is 
        port (
                x   :   in  STD_LOGIC;
                y   :   in  STD_LOGIC;
                cin :   in  STD_LOGIC;
                s   :   out STD_LOGIC;  
                c   :   out STD_LOGIC
        );
    end component;
     
    signal S_temp   : STD_LOGIC_VECTOR (width-1 downto 0) := ( others => '0' );
    signal carrys   : STD_LOGIC_VECTOR (width downto 0) := ( others => '0' );

   -- for all : full_adder use entity
     --   work.full_adder (dataflow);
    begin
        S <= S_temp;
        
        carrys (0) <= c_in;
        c_out <= carrys( width );

        ripplecarry_adder : for i in 0 to width-1 generate 
            f_adder: full_adder port map (
                                                x   => X(i),
                                                y   => Y(i),
                                                cin => carrys(i),
                                                s   => S_temp(i),
                                                c   => carrys(i+1)
            );
        end generate ripplecarry_adder;
    end structural;