library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use ieee.numeric_std.all;

entity carry_save_logic_testbench is 
    generic ( width_test : NATURAL := 4
    );
end carry_save_logic_testbench;

architecture behavioral of carry_save_logic_testbench is 
    component  carry_save_logic is 
        generic ( width     :NATURAL :=width_test    );
        port (
                X       : in     STD_LOGIC_VECTOR (width-1 downto 0);
                Y       : in     STD_LOGIC_VECTOR (width-1 downto 0);
                Z       : in     STD_LOGIC_VECTOR (width-1 downto 0);
                T       : out    STD_LOGIC_VECTOR (width-1 downto 0);
                CS      : out    STD_LOGIC_VECTOR (width-1 downto 0)
        );
    end component;

    signal X    :   STD_LOGIC_VECTOR (width_test-1 downto 0) := x"1";
    signal Y    :   STD_LOGIC_VECTOR (width_test-1 downto 0) := x"3";
    signal Z    :   STD_LOGIC_VECTOR (width_test-1 downto 0) := x"4";
    signal T    :   STD_LOGIC_VECTOR (width_test-1 downto 0);
    signal CS   :   STD_LOGIC_VECTOR (width_test-1 downto 0);

    begin 
        uut: carry_save_logic port map ( X   => X,
                                        Y   => Y,
                                        Z   => Z,
                                        T   => T,
                                        CS  => CS
        );

  stim_proc :process 
        begin  
            wait  for 10 ns;
            for i in 0 to 10 loop 
                X <= std_logic_vector(to_unsigned(to_integer(unsigned( X )) + 5, (width_test)));
                wait for 10 ns;
            end loop;
            wait for 20 ns;

            --! testo il c_out
            Y <= x"F";
            wait for 20 ns;
            wait;
        end process;

end behavioral;
    

