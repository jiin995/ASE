library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use ieee.numeric_std.all;

entity carry_select_adder_testbench is 
    generic ( M_test : NATURAL := 4;
              P_test : NATURAL :=4
    );
end carry_select_adder_testbench;

architecture behavioral of carry_select_adder_testbench is 
    component carry_select_adder is 
        generic (   width       : NATURAL := 8;
                    M    : NATURAL := M_test;
                    P        : NATURAL := P_test
        );
        port (
                A       : in    STD_LOGIC_VECTOR ((M*P-1) downto 0);
                B       : in    STD_LOGIC_VECTOR ((M*P-1) downto 0);
                c_in    : in    STD_LOGIC ;
                S       : out   STD_LOGIC_VECTOR ((M*P-1) downto 0);
                c_out   : out   STD_LOGIC
        );
    end component;

signal X        : STD_LOGIC_VECTOR ((M_test*P_test)-1 downto 0) := x"0012";
signal Y        : STD_LOGIC_VECTOR ((M_test*P_test)-1 downto 0) := x"0002";
signal S        : STD_LOGIC_VECTOR ((M_test*P_test)-1 downto 0) := (others => '0');
signal c_in     : STD_LOGIC :='0';
signal c_out    : STD_LOGIC :='0';

begin

    uut: carry_select_adder port map (   A => X,
                                        B => Y,
                                        c_in => c_in,
                                        c_out => c_out,
                                        S => S

    );

    stim_proc :process 
   begin		
      --! hold reset state for 100 ns.
      wait for 100 ns;	
		
		X <= x"0111";
		Y <= x"00A6";
		
		wait for 30 ns;
		
		X <= x"032E";
		Y <= x"0989";
		
		wait for 30 ns;
		
		Y <= x"0329";
		
		wait for 30 ns;
		
		X <= x"0118";

      --! insert stimulus here 

      wait;
   end process;

end behavioral;