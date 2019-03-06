library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity carry_select_adder is 

    generic (   
					 width : NATURAL := 8;
                M : NATURAL := 4;    --! parallelismo dei ripplecarry adder nei blocchi
                P : NATURAL := 2    --! numero di blocchi del carry select
    ); port (
					 A       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
					 B       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
					 c_in    : in    STD_LOGIC ;                             --! input carry in ingresso
					 S       : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! output somma
					 c_out   : out   STD_LOGIC                               --! output carry in uscita
    );
	 
end carry_select_adder;

architecture structural of carry_select_adder is

    component carry_select_block is 
        generic (   
						width   : NATURAL := M		--! i blocchi sono di dimensione M
        ); port (
						A       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
						B       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
						c_in    : in    STD_LOGIC ;
						S       : out   STD_LOGIC_VECTOR ((width-1) downto 0);
						c_out   : out   STD_LOGIC
        );
    end component;
	 
	   component rippleCarry_adder is  
         generic (   
							width   : NATURAL := M      
			);	port (
							X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	   
							Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	
							c_in    :   in  STD_LOGIC;                              	
							S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   	
							c_out   :   out STD_LOGIC                             	    
    );
    end component;

	signal internal_carry : STD_LOGIC_VECTOR ((P) downto 0) := (others => '0');	--! P+1 carry dei blocchi
	signal S_TEMP : STD_LOGIC_VECTOR (((M*P)-1) downto 0 ) := (others => '0');

begin

    S <= S_TEMP;

    --! collego i segnali temporanei dei carry, con i porti esterni del componenti 
    --! in modo tale da non mettere if nel for generate
    c_out <= internal_carry(P);	--! il carry in uscita è il carry dell'ultimo blocco
    internal_carry(0) <= c_in; 	--! il carry del primo blocco

	--! istanzio il primo RCA
		rca: rippleCarry_adder port map(    X       => A((M-1) downto 0),
                                          Y       => B((M-1) downto 0),
                                          c_in    => internal_carry(0),
                                          S       => S_TEMP((M-1) downto 0),
                                          c_out   => internal_carry(1)
            );

	--! istanzio i P-1 blocchi con un generate
    blocks:
        for i in 1 to P-1 generate 
            csel_block: carry_select_block port map (    A       => A ((((i+1)*M)-1) downto (i*M)),
																			B       => B ((((i+1)*M)-1) downto (i*M)),
																			c_in    => internal_carry(i),
																			S       => S_TEMP((((i+1)*M)-1) downto (i*M)),
																			c_out   => internal_carry(i+1)
                            
            );
        end generate blocks;

end structural;