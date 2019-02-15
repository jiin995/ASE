----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:10:25 02/12/2019 
-- Design Name: 
-- Module Name:    Clock - Behavioral 
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

entity clk_tester is
	GENERIC( N 	: integer := 8
			);
    Port ( clock_in 			: in  STD_LOGIC;
			  enable 			: in  STD_LOGIC;
			  reset_n 			: in 	STD_LOGIC;
			  d_in				: in 	STD_LOGIC;
			  q_out				: out STD_LOGIC;
           Q 					: out STD_LOGIC_VECTOR (N-1 downto 0);
			  half_clock 		: out STD_LOGIC;
			  quarter_clock	: out STD_LOGIC;
			  tenth_clock		: out STD_LOGIC;
   		  locked 			: out STD_LOGIC
		);
end clk_tester;

architecture Behavioral of clk_tester is

	component my_clock is
	port(-- Clock in ports
			CLK_IN1    	: in  STD_LOGIC;
			-- Clock out ports
			LOCKED 		: out	STD_LOGIC ;
			CLK_OUT1    : out STD_LOGIC;
			CLK_OUT2		: out STD_LOGIC;
			CLK_OUT3		: out STD_LOGIC
	 );
	end component;

	component shifterRegister is
		 GENERIC (N			: integer := 8);
		 Port ( clock 		: in  STD_LOGIC;
				  enable 	: in  STD_LOGIC;
				  reset_n 	: in 	STD_LOGIC;
				  left 		: in  STD_LOGIC;
				  d_in		: in 	STD_LOGIC;
				  q_out		: out STD_LOGIC;
				  Q 			: out  STD_LOGIC_VECTOR (N-1 downto 0)
				 );
	end component;

-- internal clock for connection
	signal half_clock_int 		: STD_LOGIC := '0';
	signal quarter_clock_int 	: STD_LOGIC := '0';
	signal tenth_clock_int 		: STD_LOGIC := '0';

-- locked input for shifter register
	signal left 				: STD_LOGIC := '1';
	signal enable_int 		: STD_LOGIC	:='1';	

begin

half_clock		<= half_clock_int;
quarter_clock  <= quarter_clock_int;
tenth_clock 	<= tenth_clock_int;

locked 			<= enable_int;

clock_Ints: my_clock port map(	CLK_IN1	=> clock_in,
											CLK_OUT1	=> half_clock_int,
											CLK_OUT2 => quarter_clock_int,
											CLK_OUT3 => tenth_clock_int,
											LOCKED 	=> enable_int
									);

shifter_register_inst: shifterRegister generic map ( N => N)
													port map (	clock 	=> half_clock_int,
																	enable 	=> enable_int,
																	reset_n 	=> reset_n,
																	left 		=> left,
																	d_in		=> d_in,
																	q_out		=> q_out,
																	Q 			=> Q
															);
												

end Behavioral;

