----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:31:01 02/05/2018 
-- Design Name: 
-- Module Name:    MultiplierOnBoard - Structural 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiplierOnBoard is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load_multiplier : in  STD_LOGIC;
           load_multiplicand : in  STD_LOGIC;
			  start_mul : in STD_LOGIC;
           in_byte : in  STD_LOGIC_VECTOR (7 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end MultiplierOnBoard;

architecture Structural of MultiplierOnBoard is

	COMPONENT BoothMultiplier 
	 generic ( n : integer := 8);
    Port ( Multiplier : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Multiplicand : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Start_mul : in  STD_LOGIC;
			  reset_n 	: in std_logic;
			  clk			: in std_logic;
           Result : out  STD_LOGIC_VECTOR (2*n-1 downto 0));
	END COMPONENT;
	
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
	
	signal reset_n : std_logic;
	signal multiplier, multiplicand : std_logic_vector(7 downto 0);
	signal result, value_to_display : std_logic_vector(15 downto 0);

begin

	reset_n <= not reset;
	
	reg_multiplier: reg_clock generic map(width => 8) port map(
		value => in_byte,
		clock => clk,
		enable => load_multiplier,
		reset_n => reset_n,
		output => multiplier
	);
	
	reg_multiplicand: reg_clock generic map(width => 8) port map(
		value => in_byte,
		clock => clk,
		enable => load_multiplicand,
		reset_n => reset_n,
		output => multiplicand
	);
	
	Inst_BoothMultiplier: BoothMultiplier GENERIC MAP (8) PORT MAP(
		Multiplier => multiplier,
		Multiplicand => multiplicand,
		Start_mul => start_mul,
		reset_n => reset_n,
		clk => clk,
		Result => result
	);
	
	Inst_display_seven_segments: Seven_Segments_Display generic map(
		clock_frequency_in => 50000000,
		clock_frequency_out => 400
	) PORT MAP (
		clk => clk,
		reset_n => reset_n,
		values => value_to_display,
		dots => "0000",
		enable => "1111",
		anodes => anodes,
		cathodes => cathodes
	);

	display: process(load_multiplier, load_multiplicand, multiplier, multiplicand, result)
	begin
		if(load_multiplier = '1') then
			value_to_display <= x"00" & multiplier;
		elsif(load_multiplicand = '1') then
			value_to_display <= x"00" & multiplicand;
		else
			value_to_display <= result;
		end if;
	end process;
end Structural;

