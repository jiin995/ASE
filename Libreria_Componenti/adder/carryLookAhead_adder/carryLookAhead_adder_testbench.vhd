library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity carryLookAhead_adder_testbench is 
    generic ( width_test : NATURAL :=3 );
end entity;

architecture behavioral of carryLookAhead_adder_testbench is

signal c_in     : STD_LOGIC :='0';
signal X        : STD_LOGIC_VECTOR  ( width_test-1 downto 0 ) := (others => '0') ;
signal Y        : STD_LOGIC_VECTOR  ( width_test-1 downto 0 ) := (others => '0') ;
signal c_out    : STD_LOGIC :='0';
signal S        : STD_LOGIC_VECTOR ( width_test-1 downto 0) := (others => '0') ;

component carryLookAhead_adder is 
    generic (   width     :   NATURAL :=width_test
    );
    port (  c_in   :   in STD_LOGIC;  
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
            c_out   :   out STD_LOGIC ;
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0)
    );
end component;

begin
    uuit : carryLookAhead_adder  port map ( c_in => c_in,
                                            X => X,
                                            Y=> Y,
                                            c_out => c_out,
                                            S => S
    );

    stim_proc : process 
        begin
            wait for 10 ns;
            c_in <= '1';
                for i in 0 to width_test-1 loop 
                    X(i) <= '1';
                    if i >1  then
                        Y(i) <= not Y(i-1);
                    end if;
                    wait for 10 ns;
                end loop;
            c_in <='0';
            wait for 20 ns;
            wait;
        end process;
end behavioral;