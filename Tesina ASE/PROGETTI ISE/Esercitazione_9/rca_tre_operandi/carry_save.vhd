---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : rca_tre_operandi
--
--! unit name: carry_save.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      Sommatore Carry Save
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <14/11/2018> <13/11/2018> <log>
--!              create
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_tre_operandi is
	 Generic ( width : natural := 128 );
    Port ( X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Z : in  STD_LOGIC_VECTOR (width-1 downto 0);
           S : out  STD_LOGIC_VECTOR (width+1 downto 0));
end rca_tre_operandi;

architecture Structural of rca_tre_operandi is

	 component ripple_carry_adder
	 Generic (
			  width : natural := width
		); Port ( X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  c_in : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (width-1 downto 0);
           c_out : out  STD_LOGIC);
	 end component;

	signal T : STD_LOGIC_VECTOR (width-1 downto 0) := ( others => '0' );
	signal C : STD_LOGIC := '0';
	signal A : STD_LOGIC_VECTOR (width downto 0) := ( others => '0' ); --! ingresso RCA2
	signal B : STD_LOGIC_VECTOR (width downto 0) := ( others => '0' ); --! ingresso RCA2

begin	
	
	RCA1: ripple_carry_adder GENERIC MAP ( width => width )	--! il RCA somma CS e A
	PORT MAP(
		X => X,
		Y => Y,
		c_in => '0',
		S => T,	--! otteniamo le width cifre più significative con S e c_out
		c_out => C
	);	
	
	A <= C & T;
	B <= '0' & Z;
	
	RCA2: ripple_carry_adder GENERIC MAP ( width => width+1 )	--! il RCA somma CS e A
	PORT MAP(
		X => A,
		Y => B,
		c_in => '0',
		S => S(width downto 0),	--! otteniamo le width cifre più significative con S e c_out
		c_out => S(width+1)
	);

end Structural;

