
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_carry_multiplier is
	Generic ( 	N : integer := 3;	-- parallelismo moltiplicando
					M : integer := 3	-- parallelismo moltiplicatore
					);	
    Port ( 	
				A : in  STD_LOGIC_VECTOR (N-1 downto 0);
				B : in  STD_LOGIC_VECTOR (M-1 downto 0);
				P : out  STD_LOGIC_VECTOR (N+M-1 downto 0));
end ripple_carry_multiplier;

architecture structural of ripple_carry_multiplier is

	type mat_MxN is array(M-1 downto 0) of std_logic_vector(N-1 downto 0);
	type mat_M1xN1 is array(M downto 0) of std_logic_vector(N downto 0);
	signal partial_prod : mat_MxN := ( others => ( others => '0' ) );	-- matrice dei prodotti parziali
	signal partial_sum : mat_M1xN1 := ( others => ( others => '0' ) );	-- matrice delle somme parziali
	
	component rippleCarry_adder is
		generic (
			width	: natural := M
			);
		port(
			X	: in std_logic_vector(width-1 downto 0);
			Y	: in std_logic_vector(width-1 downto 0);
			c_in : in std_logic;
			c_out: out std_logic;
			S : out std_logic_vector(width-1 downto 0)	
		);
	end component;

begin

	--generaziome matrice prodotti parziali
	gen_partial_prod_columns: for i in 0 to M-1 generate
		gen_partial_prod_rows: for j in 0 to N-1 generate
			partial_prod(j)(i)<=A(i) and B(j);
		end generate;
	end generate;
	
	-- partial_prod(0)(N)<='0';
	
	gen_rcmultiplier: for i in 0 to N-1 generate
		rca: rippleCarry_adder PORT MAP(
			X => partial_prod(i)(M-1 downto 0),
			Y => partial_sum(i)(M downto 1),
			c_in =>'0',
			s => partial_sum(i+1)(M-1 downto 0),
			c_out => partial_sum(i+1)(M)
		);
		end generate;
	
	gen_P_1: for i in 0 to N-1 generate
		p(i) <= partial_sum(i+1)(0);
	end generate;
	
	gen_P_2: for j in 0 to M-1 generate
		p(N+j) <= partial_sum(N)(j+1);
	end generate;


end Structural;

