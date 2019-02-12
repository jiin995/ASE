----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:55 10/11/2012 
-- Design Name: 
-- Module Name:    flipflopmux - Behavioral 
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

entity flipflopmux is
    Port ( d : in  STD_LOGIC;
           scan_in : in  STD_LOGIC;
           scan_en : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  reset_n : in STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out  STD_LOGIC);
end flipflopmux;

architecture Structural of flipflopmux is

signal true_d : std_logic;

COMPONENT flipflopd
	PORT(
		d : IN std_logic;
		en : IN std_logic;
		reset_n : in STD_LOGIC;
		clock : IN std_logic;          
		q : OUT std_logic
		);
END COMPONENT;

COMPONENT mux2
	PORT(
		in0 : IN std_logic;
		in1 : IN std_logic;
		sel : IN std_logic;          
		o : OUT std_logic
		);
END COMPONENT;

begin

mux: mux2 port map(
	in0 => d,
	in1 => scan_in,
	sel => scan_en,
	o => true_d
);

ffd: flipflopd port map(
	d => true_d,
	en => en,
	reset_n => reset_n,
	clock => clock,
	q => q
);

end Structural;

