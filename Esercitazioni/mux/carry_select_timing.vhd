----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:17 02/16/2019 
-- Design Name: 
-- Module Name:    mux_timing - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any XilinX primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--entity top level per calcolare il timing

entity mux_timing is
	generic (   
						width   : NATURAL := 1		-- i blocchi sono di dimensione M
        );
    Port ( clock : in  STD_LOGIC;
           A: in STD_LOGIC;
           B: in STD_LOGIC;
           SEL: in STD_LOGIC;
           X: out STD_LOGIC
			  );
end mux_timing;

architecture Behavioral of mux_timing is

	component mux2_1 is 
    generic (   
						width   : NATURAL := width		-- i blocchi sono di dimensione M
        );
    Port ( 
           A: in STD_LOGIC;
           B: in STD_LOGIC;
           SEL: in STD_LOGIC;
           X: out STD_LOGIC
			  );
end component;

	component d_edge is
		generic(width : natural := width);
		port(
			clock: in STD_LOGIC;
			D: in STD_LOGIC_VECTOR(width-1 downto 0);
			Q:	OUT STD_LOGIC_VECTOR(width-1 downto 0));
	end component;

	signal my_a  : std_logic_vector(width-1 downto 0);
	signal my_b : std_logic_vector(width-1 downto 0);
	signal my_sel : std_logic_vector(width-1 downto 0);
	signal my_x : std_logic_vector(width-1 downto 0);
	
begin
	
	Inst_mux: mux2_1 generic map(1) PORT MAP(
		A => my_a(0),
		B  => my_b(0),
		SEL => my_sel(0),
		X => my_x(0)
	);

	Load_a: d_edge generic map(1) PORT MAP(
		D(0) => A,
		clock => clock,
		Q => my_a
	);
	
	Load_b: d_edge generic map(1) PORT MAP(
		D(0) => B,
		clock => clock,
		Q => my_b
	);
	
		Load_sel: d_edge generic map(1) PORT MAP(
		D(0) => SEL,
		clock => clock,
		Q => my_sel
	);
	
	Load_x: d_edge generic map(1) PORT MAP(
		D => my_x,
		clock => clock,
		Q(0) => X
	);


end Behavioral;

