----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:34 11/17/2018 
-- Design Name: 
-- Module Name:    display_7_segmenti - Behavioral 
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

entity display_7_segmenti is
	port ( 	clock 			: in STD_LOGIC;
				reset				: in STD_LOGIC;
				values 			: in STD_LOGIC_VECTOR (15 downto 0);
				dots 				: in STD_LOGIC_VECTOR (3 downto 0) ;
				enable_digit	: in STD_LOGIC_VECTOR (3 downto 0);	
				anodes 			: out STD_LOGIC_VECTOR (3 downto 0);
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)
	);
end display_7_segmenti;

architecture architectural of display_7_segmenti is

component clock_divisor is
    generic (   clock_frequency_in  : integer := 100000000;
                clock_frequency_out : integer := 10000
    );

    port (  enable      :   in STD_LOGIC;
            reset_n     :   in STD_LOGIC;
            clock_freq_in    :   in STD_LOGIC ;
            clock_freq_out   :   out STD_LOGIC 
    );
end component;

component counter_UpMod2n_Re_Sr is 
    generic (   n 	: NATURAL :=2
    );
    port(   enable      : in STD_LOGIC ;                                
            reset_n     : in STD_LOGIC;                                 
            clock       : in STD_LOGIC;                                 
            count_hit   : out STD_LOGIC;                                
            COUNTS      : out STD_LOGIC_VECTOR ((n-1) downto 0)    
    );
end component;

component anodes_manager is
    Port ( 	select_digit : in  STD_LOGIC_VECTOR (1 downto 0);
				enable_digit : in  STD_LOGIC_VECTOR (3 downto 0);
				anodes : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

component cathodes_manager is 
    port (  select_digit    : in    STD_LOGIC_VECTOR (1 downto 0);
            values          : in    STD_LOGIC_VECTOR (15 downto 0);
            dots            : in    STD_LOGIC_VECTOR (3 downto 0);
            cathodes        : out   STD_LOGIC_VECTOR (7 downto 0)
    );
end component;


signal select_digit 		: STD_LOGIC_VECTOR (1 downto 0) := ( others =>'0');
signal clockfx 			: STD_LOGIC :='0';
signal reset_internal 	: STD_LOGIC :='0';
signal enable_internal 	: STD_LOGIC :='1';
signal count_hit			: STD_LOGIC :='0';
begin

	reset_internal <= not reset ;
	
	cathodes_instance : 
			cathodes_manager port map (	select_digit    => select_digit,
													values          => values,
													dots            => dots,
													cathodes        => cathodes
				);
					
	anodes_instance : anodes_manager port map ( 	select_digit => select_digit,
																enable_digit => enable_digit,
																anodes => anodes
															);
									
	clock_filter : clock_divisor port map (	enable      =>  enable_internal,
															reset_n     =>  reset_internal,
															clock_freq_in    =>  clock ,
															clock_freq_out   =>  clockfx 
    );

	counter_mod4 : 
		counter_UpMod2n_Re_Sr port map (    enable      => enable_internal ,                      
														reset_n     => reset_internal,                             
														clock       => clockfx,      
														count_hit 	=> count_hit,
														COUNTS      => select_digit 
											 );
										
end architectural;

