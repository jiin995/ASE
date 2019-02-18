library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac_multiplier_testbench is
end mac_multiplier_testbench;

architecture behavioral of mac_multiplier_testbench is
component mac_multiplier is
    generic (   N : NATURAL := 2;  -- parallelismo primo operando
                M : NATURAL := 3  -- parllelismo secondo operando
    );
    port    (   X   :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                Y   :   in  STD_LOGIC_VECTOR (M-1 downto 0);
                Z   :   out STD_LOGIC_VECTOR ((N+M)-1 downto 0)
    );
end component;


constant column : natural := 2;
constant row : natural := 3;
signal X : std_logic_vector(column-1 downto 0) := (others => '0');
signal Y : std_logic_vector(row-1 downto 0) := (others => '0');
signal Z : std_logic_vector(row+column-1 downto 0) := (others => '0');

begin
	uut : mac_multiplier
		generic map(
			column,
			row
		)
		port map(
		    X => X,
			Y => Y,
			Z => Z
		);
	stimulus : process
	begin
		for i in 0 to 2**column-1 loop
			X <= std_logic_vector(to_unsigned(i,column));
			for j in 0 to 2**row-1 loop
				Y <= std_logic_vector(to_unsigned(j,row));
				wait for 10 ns;
			end loop;
		end loop;
		wait;
	end process;
end behavioral;