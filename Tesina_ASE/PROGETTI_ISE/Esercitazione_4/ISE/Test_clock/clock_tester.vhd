---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : clock_tester
--
-- unit name: clock_tester.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Tester con shift register per il clock generato.
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	port(--! Clock in ports
			CLK_IN1    	: in  STD_LOGIC;
			--! Clock out ports
			LOCKED 		: out	STD_LOGIC ;
			CLK_OUT1    : out STD_LOGIC;
			CLK_OUT2		: out STD_LOGIC;
			CLK_OUT3		: out STD_LOGIC
	 );
	end component;

	component left_right_shift_register is
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

--! internal clock for connection
	signal half_clock_int 		: STD_LOGIC := '0';
	signal quarter_clock_int 	: STD_LOGIC := '0';
	signal tenth_clock_int 		: STD_LOGIC := '0';

--! locked input for shifter register
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

shifter_register_inst: left_right_shift_register generic map ( N => N)
													port map (	clock 	=> half_clock_int,
																	enable 	=> enable_int,
																	reset_n 	=> reset_n,
																	left 		=> left,
																	d_in		=> d_in,
																	q_out		=> q_out,
																	Q 			=> Q
															);
												

end Behavioral;

