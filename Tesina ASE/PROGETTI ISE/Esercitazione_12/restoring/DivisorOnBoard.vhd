----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    05:31:10 02/10/2018 
--! Design Name: 
--! Module Name:    DivisorOnBoard - Structural 
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

entity DivisorOnBoard is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load_divisor : in  STD_LOGIC;
           load_dividend : in  STD_LOGIC;
           start_division : in  STD_LOGIC;
           in_byte : in  STD_LOGIC_VECTOR (7 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end DivisorOnBoard;

architecture Structural of DivisorOnBoard is

	component Seven_Segments_Display 
	generic (clock_frequency_in : natural := 50000000;
			clock_frequency_out : natural := 250);
    Port ( clk : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           values : in  STD_LOGIC_VECTOR (15 downto 0);
           dots : in  STD_LOGIC_VECTOR (3 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	COMPONENT reg_clock 
	 Generic(width : integer := 8);
    Port ( value : in  STD_LOGIC_VECTOR (width-1 downto 0);
           clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (width-1 downto 0));
	END COMPONENT;
	
	component R_Division 
	 generic ( n : integer := 4);
    Port ( Dividend : in  STD_LOGIC_VECTOR (2*n-1 downto 0);
           Divisor : in  STD_LOGIC_VECTOR (2*n-1 downto 0); 
           Quotient : out  STD_LOGIC_VECTOR (2*n-1 downto 0);
           Remainder : out  STD_LOGIC_VECTOR (2*n-1 downto 0);
           Reset_n : in  STD_LOGIC;
			  clock	: in	std_logic;
           start : in  STD_LOGIC);
	end component;

	
	signal reset_n : std_logic;
	signal divisor, dividend, remainder, quotient : std_logic_vector(7 downto 0);
	signal value_to_display : std_logic_vector(15 downto 0);

begin

	reset_n <= not reset;

	reg_divisor: reg_clock generic map(width => 8) port map(
		value => in_byte,
		clock => clk,
		enable => load_divisor,
		reset_n => reset_n,
		output => divisor
	);
	
	reg_dividend: reg_clock generic map(width => 8) port map(
		value => in_byte,
		clock => clk,
		enable => load_dividend,
		reset_n => reset_n,
		output => dividend
	);
	
	Division_Calculator: R_Division PORT MAP(
		Dividend => dividend,
		Divisor => divisor,
		Quotient => quotient,
		Remainder => remainder,
		Reset_n => reset_n,
		clock => clk,
		start => start_division
	);
	
	Inst_display_seven_segments: Seven_Segments_Display generic map(
		clock_frequency_in => 50000000,
		clock_frequency_out => 250
	) PORT MAP (
		clk => clk,
		reset_n => reset_n,
		values => value_to_display,
		dots => "0100",
		enable => "1111",
		anodes => anodes,
		cathodes => cathodes
	);
	
	display: process(load_dividend, load_divisor)
	begin
		if(load_dividend = '1' or load_divisor = '1') then
			value_to_display <= dividend & divisor;
		else
			value_to_display <= quotient & remainder;
		end if;
	end process;


end Structural;

