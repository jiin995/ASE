library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_timing is
	generic (width : natural := 32);
    Port ( clock : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
           c_in : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (width-1 downto 0);
           c_out : out  STD_LOGIC);
end rca_timing;

architecture Behavioral of rca_timing is

	component rippleCarry_adder is 
    generic (   width   : NATURAL :=  width     
    );
    port (
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	    
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	
            c_in    :   in  STD_LOGIC;                              	
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   
            c_out   :   out STD_LOGIC                             	    
    );
end component;

	component d_edge is
		generic(width : natural := width);
		port(
			clock: in STD_LOGIC;
			D:	in STD_LOGIC_VECTOR(width-1 downto 0);
			Q:	out STD_LOGIC_VECTOR(width-1 downto 0));
	end component;

	signal my_a : std_logic_vector(width-1 downto 0);
	signal my_b : std_logic_vector(width-1 downto 0);
	signal my_sum : std_logic_vector(width-1 downto 0);
	
	signal my_c_out : std_logic;

begin
	
	Load_c_in: d_edge generic map(1) PORT MAP(
		D(0) => c_in,
		clock => clock,
		Q => open
	);

	Load_a: d_edge PORT MAP(
		D => X,
		clock => clock,
		Q => my_a
	);
	
	Load_b: d_edge PORT MAP(
		D => Y,
		clock => clock,
		Q => my_b
	);
	
	Inst_ripple_carry_adder: rippleCarry_adder PORT MAP(
		X => my_a,
		Y => my_b,
		c_in => c_in,
		S => my_sum,
		c_out => my_c_out
	);
	
	Load_sum: d_edge PORT MAP(
		D => my_sum,
		clock => clock,
		Q => S
	);

	Load_c_out: d_edge generic map(1) PORT MAP(
		D(0) => my_c_out,
		clock => clock,
		Q(0) => c_out
	);


end Behavioral;

