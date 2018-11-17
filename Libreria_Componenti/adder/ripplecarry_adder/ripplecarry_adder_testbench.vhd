library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;

entity ripplecarry_adder_testbench is 
    generic (
                par : NATURAL :=8
    );
end ripplecarry_adder_testbench;

architecture behaviral of ripplecarry_adder_testbench is 

signal  X       : STD_LOGIC_VECTOR (par-1 downto 0) := (others => '0');    
signal  Y       : STD_LOGIC_VECTOR (par-1 downto 0) := (others => '1');    
signal  c_in    : STD_LOGIC := '0';

signal  S       : STD_LOGIC_VECTOR (par-1 downto 0); 
signal  c_out   : STD_LOGIC := '0';

component ripplecarry_adder is 
    generic (
                width   : NATURAL := 8          
    );

    port (  X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            c_in    :   in  STD_LOGIC;                              
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   
            c_out   :   out STD_LOGIC                             
    );
end component;

begin

    uuit : ripplecarry_adder port map ( X       => X,
                                        Y       => Y,
                                        c_in    => c_in,
                                        S       => S,
                                        c_out   => c_out
    );

    stim_proc: process
        begin
            c_in <= '0';
            wait for 40 ns;
                for i in 0 to par-1 loop 
                    X(i) <= '1';
                    --std_logic_vector(to_unsigned(i, X'length));
                    Y(i)<= '0';
                    wait for 10 ns;
                end loop;
            wait;
        end process;
end behaviral;