----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    14:00:52 02/16/2019 
--! Design Name: 
--! Module Name:    carry_save_timing - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity carry_save_timing is
	generic (width : natural := 128);
    Port ( clock : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  Z : in  STD_LOGIC_VECTOR (width-1 downto 0);
           S : out  STD_LOGIC_VECTOR (width+1 downto 0)
			  );
end carry_save_timing;

architecture Behavioral of carry_save_timing is

	component carry_save is 
    generic (   width     :   NATURAL := width
    );
    port (  
           X : in  STD_LOGIC_VECTOR (width-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  Z : in  STD_LOGIC_VECTOR (width-1 downto 0);
           S : out  STD_LOGIC_VECTOR (width+1 downto 0)
    );
	end component;

	component d_edge_in is
		generic(width : natural := width);
		port(
				clock: in STD_LOGIC;
				D:	in STD_LOGIC_VECTOR(width-1 downto 0);
				Q:	out STD_LOGIC_VECTOR(width-1 downto 0));
	end component;
	
	component d_edge_out is
		generic(width : natural := width+2);
		port(
				clock: in STD_LOGIC;
				D:	in STD_LOGIC_VECTOR(width-1 downto 0);
				Q:	out STD_LOGIC_VECTOR(width-1 downto 0));
	end component;
	
	signal my_a : std_logic_vector(width-1 downto 0);
	signal my_b : std_logic_vector(width-1 downto 0);
	signal my_c : std_logic_vector(width-1 downto 0);
	signal my_sum : std_logic_vector(width+1 downto 0);


begin
	

	Load_a: d_edge_in PORT MAP(
		D => X,
		clock => clock,
		Q => my_a
	);
	
	Load_b: d_edge_in PORT MAP(
		D => Y,
		clock => clock,
		Q => my_b
	);
	
	Load_c: d_edge_in PORT MAP(
		D => Z,
		clock => clock,
		Q => my_c
	);
	
	Load_sum: d_edge_out PORT MAP(
		D => my_sum,
		clock => clock,
		Q => S
	);

	Inst_carry_save: carry_save PORT MAP(
		X => my_a,
		Y => my_b,
		Z => my_c,
		S => my_sum
	);
	

end Behavioral;

