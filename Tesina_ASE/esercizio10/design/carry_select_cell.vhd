library IEEE;
    use IEEE.STD_LOGIC_1164.all;

--! blocco carry select è formato da due RCA e due multiplexer 2-1. 
--! I due addizionatori si occuperanno di sommare le due stringhe in ingresso A e B
--! (di lunghezza generica width) con c_in pari, rispettivamente, a 0 e 1.
--! In base al valore c_in effettivo in ingresso al blocco, i due multiplexer
--! sceglieranno quali dei due valori S e c_out, calcolati dai due RCA,
--! riportare in uscita. 

entity carry_select_block is 
    generic (   
					width   : NATURAL := 4
    ); port (  A       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
					B       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
					c_in    : in    STD_LOGIC ;
					S       : out   STD_LOGIC_VECTOR ((width-1) downto 0);
					c_out   : out   STD_LOGIC
    );
end carry_select_block;

architecture structural of carry_select_block is 

    component mux2_1 is 
            generic (   
								width : natural := width                    --! parallelismo dell' I/O del multiplexer
				);  port(   SEL : in  STD_LOGIC;                                    --! mux2_1 input: selezione 
								A   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: A
								B   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: B
								X   : out STD_LOGIC_VECTOR ((width-1) downto 0)         --! mux2_1 output: X
     );
    end component;

    component rippleCarry_adder is  
         generic (   
							width   : NATURAL := width      
			);	port (
							X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	   
							Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	
							c_in    :   in  STD_LOGIC;                              	
							S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   	
							c_out   :   out STD_LOGIC                             	    
    );
    end component;

	--segnale che mantiene i carry in uscita dei due ripplecarry
    signal internal_carry_out   : STD_LOGIC_VECTOR (1 downto 0) := "00";
	 
	--array di segnali che mantengono la somma dei ripplecarry
    type arrays_of_VECTOR is array (0 to 1) of STD_LOGIC_VECTOR ((width-1) downto 0);
    signal internal_sum : arrays_of_VECTOR;
	 
	--aegnale temporaneo per l'uscita
    signal S_TEMP : STD_LOGIC_VECTOR ((width - 1) downto 0) := ( others => '0');
	 
begin

	S <= S_TEMP;

	--adders che procedono alla somma degli width bits con i carry differenti 

	adder_0: rippleCarry_adder port map(    X       => A,
                                           Y       => B,
                                           c_in    => '0',
                                           S       => internal_sum(0),
                                           c_out   => internal_carry_out(0)
            );
				
	adder_1: rippleCarry_adder port map(    X       => A,
                                           Y       => B,
                                           c_in    => '1',
                                           S       => internal_sum(1),
                                           c_out   => internal_carry_out(1)
            );
	
	--multiplexer che seleziona il carry in uscita in base al carry in ingresso
	
   mux2_1_carry_select : mux2_1 generic map (width => 1) 
                                    port map (  A(0)   => internal_carry_out(0),
                                                B(0)   => internal_carry_out(1),
                                                SEL    => c_in,
                                                X(0)   => c_out
                                            );
                                            
	--multiplexer che seleziona la somma in uscita in base al carry in ingresso 
    mux2_1_sum_select : mux2_1 generic map (width => width) 
											port map ( A   => internal_sum(0),
                                            B   => internal_sum(1),
                                            SEL =>  c_in,
                                            X   => S_TEMP
                                         );
													  
end structural;