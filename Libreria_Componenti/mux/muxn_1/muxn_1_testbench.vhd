LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.std_logic_arith.ALL;
--USE ieee.std_logic_unsigned.ALL;

--Dichiarazione entity del testbench: nessuna porta (non sintetizzabile, quindi non presenta porte fisiche)
entity muxn_1_testbench is

end muxn_1_testbench;

architecture behavioral of muxn_1_testbench is

--Dichiarazione component per l'Unit Under Test (UUT)
component muxn_1 is
	generic(SELECT_WIDTH : natural := 3);
	port (
		SEL : in STD_LOGIC_VECTOR(SELECT_WIDTH-1 downto 0);
		 X : in STD_LOGIC_VECTOR(2**SELECT_WIDTH-1 downto 0);
		 Y : out STD_LOGIC
	);
end component;

--Dichiarazione input ed inizializzazione
constant mux_selection_length : natural := 4;
signal SEL : STD_LOGIC_VECTOR(mux_selection_length-1 downto 0) := (others => '0');
signal X : STD_LOGIC_VECTOR(2**mux_selection_length-1 downto 0) := (others => '0');
--Dichiarazione output ed inizializzazione
signal Y : STD_LOGIC := '0';

begin
--Istanziazione dell'Unit Under Test
	uut: muxn_1 generic map(mux_selection_length) PORT MAP(
				X => X,
				SEL => SEL,
				Y => Y
			    );

--Stimulus process
	stim_proc: process
	variable l : line;
	begin
	
		wait for 10 ns;
		for i in 0 to conv_integer(2**mux_selection_length-1) loop
			SEL <= conv_std_logic_vector(i, mux_selection_length);
			--wait for 10 ns;
			for j in 0 to conv_integer(2**(2**mux_selection_length)-1) loop
				A <= conv_std_logic_vector(j, 2**mux_selection_length);
				wait for 10 ns;
			end loop;
		end loop;
		
		wait;
	end process;
END behavioral;