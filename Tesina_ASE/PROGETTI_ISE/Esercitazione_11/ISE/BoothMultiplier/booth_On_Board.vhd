---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : BoothMultiplier
--
-- unit name: booth_On_Board.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente di alto livello per implementare il moltiplicatore di Booth su board
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


entity booth_multiplier_onBoard is
    generic (	 N       : NATURAL :=  4
    );
    port (	clock 		: in 	  STD_LOGIC ;
				--clock_booth : in 		STD_LOGIC;
				start			: in		STD_LOGIC;
				start_led	: out		STD_LOGIC;
				stop			: out		STD_LOGIC;
				enable_a    : in	  STD_LOGIC ;
				enable_b		: in 	  STD_LOGIC ;
            subtract    : in    STD_LOGIC ;
				input       : in    STD_LOGIC_VECTOR (3 downto 0);  --! input addendo
				overflow    : out   STD_LOGIC ;
            c_out       : out   STD_LOGIC ;
				anodes 		: out   STD_LOGIC_VECTOR (7 downto 0);
				leds 			: out   STD_LOGIC_VECTOR (2*N-1 downto 0);
				cathodes		: out   STD_LOGIC_VECTOR (7 downto 0)
                             --! output carry in uscita
    );
end booth_multiplier_onBoard;

architecture Behavioral of booth_multiplier_onBoard is

component display_7_segmenti is
	port ( 	clock 			: in STD_LOGIC;
				enable 			: in STD_LOGIC;
				reset				: in STD_LOGIC;
				values 			: in STD_LOGIC_VECTOR (31 downto 0);
				dots 				: in STD_LOGIC_VECTOR (7 downto 0) ;
				enable_digit	: in STD_LOGIC_VECTOR (7 downto 0);	
				anodes 			: out STD_LOGIC_VECTOR (7 downto 0);
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

component booth_multiplier is 
    GENERIC ( N :   INTEGER :=  N			 
        );
    PORT    (   X       :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                Y       :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                start   :   in  STD_LOGIC;
                clock   :   in  STD_LOGIC;
                reset_n :   in  STD_LOGIC;
                stop    :   out STD_LOGIC;
                Z       :   out STD_LOGIC_VECTOR ((2*N)-1 downto 0)
        );
end component;

component  register_d_Re_Ar is 
    generic(    width       :   NATURAL :=32;        --! definisce il parallelismo del registro
                reset_level     :   STD_LOGIC :='1';    --! definisce il livello reset
                enable_level      :   STD_LOGIC := '1'    --! definisce il livello enable
    );

    port(   clock   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale di clock per sincronizzare
            enable 	  :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale enable
            reset   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale reset
            d       :   in  STD_LOGIC_VECTOR    (width-1 downto 0);	--! register_d_Re_Ar input    : inpput data 
            q       :   out STD_LOGIC_VECTOR    (width-1 downto 0)	--! register_d_Re_Ar input    : output data
    );

end component;

signal internal_S 		: STD_LOGIC_VECTOR (2*N-1 downto 0) := ( others => '0');
signal internal_a 		: STD_LOGIC_VECTOR (N-1 downto 0) := ( others => '0');
signal internal_b 		: STD_LOGIC_VECTOR (N-1 downto 0) := ( others => '0');

signal enable_int  		: STD_LOGIC := '1';	
signal reset  				: STD_LOGIC := '0';
signal reset_n				: STD_LOGIC := '1';

signal stop_temp  		: STD_LOGIC := '0';

signal value_int			: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0');
signal dots					: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal enable_digit		: STD_LOGIC_VECTOR (7 downto 0) := x"0F";

begin

	reset_n <= not reset;
	start_led <= start;
	stop <= stop_temp;
	
	display: display_7_segmenti port map (	clock 			=> clock,
														enable 			=> enable_int,
														reset 			=> reset,
														values 			=> value_int,
														dots 				=> dots,
														enable_digit 	=> enable_digit,
														anodes 			=> anodes,
														cathodes 		=> cathodes
												);
	
	reg_a : register_d_Re_Ar 	generic map (N)
										port map (    clock  => clock,
														  enable 	=> enable_a,
														  reset  => reset,
														  d      => input,
														  q 		=> internal_a
												);										
	reg_b : register_d_Re_Ar 	generic map (N)
										port map (    clock  => clock,
														  enable 	=> enable_b,
														  reset  => reset,
														  d      => input,
														  q 		=> internal_b
												);
--	
--	
	booth_multiplier_onBoard: booth_multiplier generic map (N)
																	port map  ( X 			=> internal_a ,
																				   Y 			=> internal_b,
																					clock 	=> clock, --clock_booth,
																					reset_n	=> reset_n,
																					Z 			=> leds,
																					start		=> start,
																					stop		=> stop_temp
									);
									
	
									
	process(enable_a,enable_b,internal_a,internal_b,internal_s,stop_temp)
	begin
		if(enable_a='1') then
			value_int <= x"0000000" & internal_a;
		elsif(enable_b='1') then
			value_int <= x"0000000" & internal_b;
		elsif(stop_temp='1') then
			value_int <= x"000000" & internal_S;
		end if;
	end process;
									
end Behavioral;

