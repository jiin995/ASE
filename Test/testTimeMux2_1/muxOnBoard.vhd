----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:08 11/27/2018 
-- Design Name: 
-- Module Name:    muxOnBoard - Behavioral 
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

entity muxOnBoard is
	generic ( width	: NATURAL := 4);
    Port ( A : in  STD_LOGIC_VECTOR (width-1 downto 0);
           B : in  STD_LOGIC_VECTOR (width-1 downto 0);
           sel : in  STD_LOGIC;
			  X : OUT  STD_LOGIC_VECTOR (width-1 downto 0));
end muxOnBoard;

architecture Behavioral of muxOnBoard is

	component mux2_1 is 
		generic (   width : natural :=width                 --! parallelismo dell' I/O del multiplexer
    );
		port(  	SEL : in  STD_LOGIC;                                    --! mux2_1 input: selezione 
					A   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: A
					B   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: B
					X   : out STD_LOGIC_VECTOR ((width-1) downto 0)         --! mux2_1 output: X
        );
	end component;

begin
	mux2_1istance : mux2_1 port map (	A=>A,
													B=>B,
													SEL=>SEL,
													X=>X
	);

end Behavioral;

