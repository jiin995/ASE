library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_save is
	 Generic ( width : natural := 4 );
    Port ( X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Z : in  STD_LOGIC_VECTOR (width-1 downto 0);
           S : out  STD_LOGIC_VECTOR (width+1 downto 0));
end carry_save;

architecture Structural of carry_save is

	 component carry_save_logic		--! blocco che calcola la somma dei 3 bit di stesso peso di X, Y e Z
	 Generic ( 
				width : natural := width 
		); Port ( X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Z : in  STD_LOGIC_VECTOR (width-1 downto 0);
           T : out  STD_LOGIC_VECTOR (width-1 downto 0);
           CS : out  STD_LOGIC_VECTOR (width-1 downto 0));
	 end component;
	
	 component ripple_carry_adder		--! RCA per sommare T e CS
	 Generic (
			  width : natural := width
		); Port ( X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  c_in : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (width-1 downto 0);
           c_out : out  STD_LOGIC);
	 end component;
	 
	 signal T : std_logic_vector(width-1 downto 0);		--! somma del CSL
	 signal CS : std_logic_vector(width-1 downto 0);	--! riporto del CSL
	 signal A : std_logic_vector(width-1 downto 0);		--! ingresso del RCA (sarebbe T shiftato a destra)
	 
begin
	
	CSL: carry_save_logic GENERIC MAP (width => width) 
	PORT MAP(
		X => X,
		Y => Y,
		Z => Z,
		T => T,
		CS => CS
	);
	
	S(0) <= T(0);	--! S(0) è già stato determinato al primo passo
	A <= '0' & T(width-1 downto 1);	--! A sarebbe T shiftato a destra
	
	RCA: ripple_carry_adder GENERIC MAP ( width => width )	--! il RCA somma CS e A
	PORT MAP(
		X => A,
		Y => CS,
		c_in => '0',
		S => S(width downto 1),	--! otteniamo le width cifre più significative con S e c_out
		c_out => S(width+1)
	);

end Structural;

