library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity generationPropagationCarry is 
    generic (   width : NATURAL :=2
    );
    port (  --! generationPropagationCarry inputs  : primo addendo
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! generationPropagationCarry inputs  : secondo addendo
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
            --! generationPropagationCarry inputs  : riporto generato
            G       :   out  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! generationPropagationCarry inputs  : riporto propagato 
            P       :   out  STD_LOGIC_VECTOR (width-1 downto 0) 
    );
end generationPropagationCarry;

architecture dataflow of generationPropagationCarry is 

begin
    --calcolo se il riporto si genera allo stadio i-esimo 
    G <= X and Y;
    --calcolo se il riporto si propaga dallo stadio i-esimo 
    P <= X or Y;
end;