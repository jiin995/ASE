library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use ieee.numeric_std.all;

entity carrySelect_adder_testbench is 
    generic ( M_test : NATURAL := 4;
              P_test : NATURAL :=4
    );
end carrySelect_adder_testbench;

architecture behavioral of carrySelect_adder_testbench is 
    component carrySelect_addSub is 
        generic (   width       : NATURAL := 8;
                    M    : NATURAL := M_test;
                    P        : NATURAL := P_test
        );
        port (
                A           : in    STD_LOGIC_VECTOR ((M*P-1) downto 0);
                B           : in    STD_LOGIC_VECTOR ((M*P-1) downto 0);
                subtract    : in    STD_LOGIC ;
                S           : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- output somma
                overflow    : out   STD_LOGIC ;
                c_out       : out   STD_LOGIC
        );
    end component;

signal X        : STD_LOGIC_VECTOR ((M_test*P_test)-1 downto 0) := x"0012";
signal Y        : STD_LOGIC_VECTOR ((M_test*P_test)-1 downto 0) := x"0002";
signal subtract : STD_LOGIC := '0';
signal S        : STD_LOGIC_VECTOR ((M_test*P_test)-1 downto 0) := (others => '0');
signal overflow : STD_LOGIC :='0';
signal c_out    : STD_LOGIC :='0';

begin

    uut: carrySelect_addSub port map (  A => X,
                                        B => Y,
                                        subtract => subtract,
                                        overflow => overflow,
                                        c_out => c_out,
                                        S => S

    );

    stim_proc :process 
        begin  
            wait  for 10 ns;
            for i in 0 to 5 loop 
                -- aggiungo 5 a X convertedo il vettore in intero senza segno e poi riconvertendolo
                -- in std logic vector
                X <= std_logic_vector(to_unsigned(to_integer(unsigned( X )) + i, (M_test*P_test)));
                wait for 10 ns;
            end loop;

            subtract <= '1';

            for i in 0 to 5 loop 
                Y <= std_logic_vector(to_unsigned(to_integer(unsigned( X )) + i, (M_test*P_test)));
                wait for 10 ns;
            end loop;
            -- testo la variazione dell carry
            wait for 20 ns;

            -- testo il c_out
            Y <= x"FFFF";
            wait for 20 ns;
            wait;
        end process;

end behavioral;