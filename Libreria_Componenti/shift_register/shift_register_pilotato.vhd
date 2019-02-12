----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:07 10/11/2012 
-- Design Name: 
-- Module Name:    shift_register_pilotato - Behavioral 
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

entity shift_register_pilotato is
    generic(
			  width : integer := 8;
			  right_left_n_shift : std_logic := '0'
	 );
    Port ( reg_in : in  STD_LOGIC_VECTOR (width-1 downto 0);
           scan_in : in  STD_LOGIC;
           scan_en : in  STD_LOGIC;
           en : in  STD_LOGIC;
		   reset_n : in STD_LOGIC;
           clock : in  STD_LOGIC;
           scan_out : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (width-1 downto 0));
end shift_register_pilotato;

architecture Behavioral of shift_register_pilotato is

signal connections : std_logic_vector(width downto 0);

COMPONENT flipflopmux
	PORT(
		d : IN std_logic;
		scan_in : IN std_logic;
		scan_en : IN std_logic;
		en : IN std_logic;
		reset_n : in STD_LOGIC;
		clock : IN std_logic;          
		q : OUT std_logic
		);
END COMPONENT;

begin

shift_reg: for i in 0 to width-1 generate

	shift_reg_left: if right_left_n_shift = '1' generate
		ffd_with_mux: flipflopmux port map(
			d => reg_in(i),
			clock => clock,
			en => en,
			reset_n => reset_n,
			scan_en => scan_en,
			scan_in => connections(i),
			q => connections(i+1)
			);
	   connections(0) <= scan_in;
		scan_out <= connections(width);
		q <= connections(width downto 1);
	end generate;
	
	shift_reg_right: if right_left_n_shift = '0' generate
		ffd_with_mux: flipflopmux port map(
			d => reg_in(i),
			clock => clock,
			en => en,
			reset_n => reset_n,
			scan_en => scan_en,
			scan_in => connections(i+1),
			q => connections(i)
			);
		connections(width) <= scan_in;
		scan_out <= connections(0);
		q <= connections(width-1 downto 0);
	end generate;
	
end generate;


end Behavioral;

