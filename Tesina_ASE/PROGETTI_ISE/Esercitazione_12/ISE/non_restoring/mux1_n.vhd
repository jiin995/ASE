library ieee;
use ieee.std_logic_1164.all;
--! ieee=synopsys (lanciarla con questa opzione: ghdl -a ieee=synopsys mux1_n.vhd // ghdl -r --ieee=synopsys mux1_n_tsb --vcd=mux1_n.vcd
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity muxn_1 is
			generic ( width : natural);
			Port (
				inputs : in std_logic_vector(2**width-1 downto 0);
				selectors : in std_logic_vector(width-1 downto 0);
				output : out std_logic
			);
end entity;

architecture dataflow of muxn_1 is
	begin
	output <= inputs(conv_integer(selectors));
end architecture;