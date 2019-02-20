library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_carry_multiplier_testbench is
    generic (   N : NATURAL := 8;  -- parallelismo primo operando
                M : NATURAL := 8  -- parllelismo secondo operando
    );
end ripple_carry_multiplier_testbench;

architecture behavioral of ripple_carry_multiplier_testbench is
component ripple_carry_multiplier is
    generic (   N : NATURAL := N;  -- parallelismo primo operando
                M : NATURAL := M  -- parllelismo secondo operando
    );
    port    (   A   :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                B   :   in  STD_LOGIC_VECTOR (M-1 downto 0);
                P   :   out STD_LOGIC_VECTOR ((N+M)-1 downto 0)
    );
end component;


signal A : std_logic_vector(N-1 downto 0) := (others => '0');
signal B : std_logic_vector(M-1 downto 0) := (others => '0');
signal P : std_logic_vector(M+N-1 downto 0) := (others => '0');

begin
	uut : ripple_carry_multiplier
		generic map(
			M,N
		)
		port map(
		    A => A,
			B => B,
			P => P
		);
	stimulus : process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		A <= x"11";
		B <= x"A6";
		
		wait for 30 ns;
		
		A <= x"2E";
		B <= x"89";
		
		wait for 30 ns;
		
		B <= x"29";
		
		wait for 30 ns;
		
		A <= x"18";

      -- insert stimulus here 

      wait;
   end process;
end behavioral;