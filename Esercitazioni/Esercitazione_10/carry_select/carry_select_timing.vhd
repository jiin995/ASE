----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:17 02/16/2019 
-- Design Name: 
-- Module Name:    carry_select_timing - Behavioral 
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

entity carry_select_timing is
	generic (M : NATURAL := 1;    -- parallelismo dei ripplecarry adder nei blocchi
            P : NATURAL := 8);
    Port ( clock : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR ((M*P)-1 downto 0);
           B : in  STD_LOGIC_VECTOR ((M*P)-1 downto 0);
           c_in : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR ((M*P)-1 downto 0);
           c_out : out  STD_LOGIC);
end carry_select_timing;

architecture Behavioral of carry_select_timing is

	component carry_select_adder is 
    generic (M : NATURAL := M;    -- parallelismo dei ripplecarry adder nei blocchi
				 P : NATURAL := P     
    );
    port (
            A       :   in  STD_LOGIC_VECTOR ((M*P)-1 downto 0);	    
            B       :   in  STD_LOGIC_VECTOR ((M*P)-1 downto 0);    	
            c_in    :   in  STD_LOGIC;                              	
            S       :   out STD_LOGIC_VECTOR  ((M*P)-1 downto 0);   
            c_out   :   out STD_LOGIC                             	    
    );
end component;

	component d_edge is
		generic(width : natural := M*P);
		port(
			clock: in STD_LOGIC;
			D:	in STD_LOGIC_VECTOR(width-1 downto 0);
			Q:	out STD_LOGIC_VECTOR(width-1 downto 0));
	end component;

	signal my_a : std_logic_vector((M*P)-1 downto 0);
	signal my_b : std_logic_vector((M*P)-1 downto 0);
	signal my_sum : std_logic_vector((M*P)-1 downto 0);
	
	signal my_c_out : std_logic;

begin
	
	Load_c_in: d_edge generic map(1) PORT MAP(
		D(0) => c_in,
		clock => clock,
		Q => open
	);

	Load_a: d_edge PORT MAP(
		D => A,
		clock => clock,
		Q => my_a
	);
	
	Load_b: d_edge PORT MAP(
		D => B,
		clock => clock,
		Q => my_b
	);
	
	Inst_carry_select: carry_select_adder PORT MAP(
		A => my_a,
		B => my_b,
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

