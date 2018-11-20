library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity generationPropagationCarry_testbench is 
    generic ( width_test : NATURAL :=3);
end generationPropagationCarry_testbench;

architecture bahavioral of generationPropagationCarry_testbench is
    component generationPropagationCarry is 
        generic (   width : NATURAL :=width_test
        );
        port (  --! ripplecarry_adder inputs  : primo addendo
                X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
                --! ripplecarry_adder inputs  : secondo addendo
                Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
                --! ripplecarry_adder inputs  : riporti generati 
                G       :   out  STD_LOGIC_VECTOR (width-1 downto 0);    
                --! ripplecarry_adder inputs  : riporto propagato 
                P       :   out  STD_LOGIC_VECTOR (width-1 downto 0)
        );
    end component;

    signal X : STD_LOGIC_VECTOR (width_test-1 downto 0) := (0 =>'0', 1 => '1', others => '0');
    signal Y : STD_LOGIC_VECTOR (width_test-1 downto 0) := (0 =>'1', 1 => '1', others => '0');
    signal G : STD_LOGIC_VECTOR (width_test-1 downto 0) := (others => '0');
    signal P : STD_LOGIC_VECTOR (width_test-1 downto 0) := (others => '0');

begin 
    uut: generationPropagationCarry port map (
        X => X,
        Y => Y,
        G => G,
        P => P
    );
    stim_proc :process 
        begin  
            wait  for 200 ns;
            wait;
        end process;
end bahavioral;