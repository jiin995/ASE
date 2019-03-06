library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity propagation_generation_calculator is 
    generic (   width : NATURAL :=2
    );
    port (  --! propagation_generation_calculator inputs  : primo addendo
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! propagation_generation_calculator inputs  : secondo addendo
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
            --! propagation_generation_calculator inputs  : riporto generato
            G       :   out  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! propagation_generation_calculator inputs  : riporto propagato 
            P       :   out  STD_LOGIC_VECTOR (width-1 downto 0) 
    );
end propagation_generation_calculator;

architecture dataflow of propagation_generation_calculator is 

begin
    --calcolo se il riporto si genera allo stadio i-esimo 
    G <= X and Y;
    --calcolo se il riporto si propaga dallo stadio i-esimo 
    P <= X or Y;
end;