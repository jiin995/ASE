library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;

entity rippleCarry_addsub_testbench is 
    generic (
                width : NATURAL := 4
    );
end rippleCarry_addsub_testbench;

architecture behavioural of rippleCarry_addsub_testbench is 

signal  A       : STD_LOGIC_VECTOR (width-1 downto 0) := (others => '0');    
signal  B       : STD_LOGIC_VECTOR (width-1 downto 0) := (others => '0'); 
signal  subtract: STD_LOGIC := '0';
signal  S       : STD_LOGIC_VECTOR (width-1 downto 0); 
signal  overflow   : STD_LOGIC := '0';

component rippleCarry_addsub is 
    generic (
                width   : NATURAL := width          
    );

    port (  A       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            B       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            subtract:   in STD_LOGIC;
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   
            overflow   :   out STD_LOGIC                             
    );
end component;

begin

    uut : rippleCarry_addsub generic map (
                                        width => width
    )
        port map (                      A       => A,
                                        B       => B,
                                        subtract=> subtract,
                                        S       => S,
                                        overflow   => overflow
    );

    stim_proc: process
        begin		
      --! hold reset state for 100 ns.
      wait for 100 ns;	
      
            subtract <= '1';
            wait for 40 ns;
                for i in 0 to width-1 loop 
                    b(i)<= '1';
                    wait for 10 ns;
						subtract <= '0';
                    wait for 10 ns;
                    a(i) <= '1'; --std_logic_vector(to_unsigned(i, X'length));
                    wait for 10 ns;
						subtract <= '1';
                    wait for 10 ns;
                end loop;
					 wait for 10 ns;
					 subtract <= '1';
					 A <= "0111";
					 B <= "1101";

            wait;
        end process;
end behavioural;