---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : scan_chain_on_board
--
-- unit name: display_7_segmenti.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente che permette di pilotare fino a 4 digit ricevendo il valore da
--! mostrare sul display come sequenza di bit
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

--Descrizione
--! Componente che permette di pilotare fino a 4 digit ricevendo il valore da
--! mostrare sul display come sequenza di bit

entity display_7_segmenti is
	PORT ( 	enable			: in STD_LOGIC;								--! enable del componente
				clock 			: in STD_LOGIC;								--! clock
				reset				: in STD_LOGIC;								--! reset 1-attivo
				values 			: in STD_LOGIC_VECTOR (31 downto 0);	--! Stringa di bit del valore da mostrare
				dots 				: in STD_LOGIC_VECTOR (7 downto 0) ;	--! Segnali che permette di pilotare i punti
				enable_digit	: in STD_LOGIC_VECTOR (7 downto 0);		--! Segnali che attiva le digit
				anodes 			: out STD_LOGIC_VECTOR (7 downto 0);	--! Uscita che pilota gli anodi
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)		--! Uscita che pilota i catodi
	);
end display_7_segmenti;

architecture structural of display_7_segmenti is

component clock_divisor is
    GENERIC (   clock_frequency_in  : integer := 100000000;
                clock_frequency_out : integer := 10000
    );

    PORT(	enable      		:   in STD_LOGIC;
            reset_n     		:   in STD_LOGIC;
            clock_freq_in    	:   in STD_LOGIC ;
            clock_freq_out   	:   out STD_LOGIC 
    );
end component;

component counter_UpMod2n_Re_Sr is 
    GENERIC (   n 	: NATURAL :=3
    );
	 
    PORT (	enable      : in STD_LOGIC ;                                
            reset_n     : in STD_LOGIC;                                 
            clock       : in STD_LOGIC;                                 
            count_hit   : out STD_LOGIC;                                
            COUNTS      : out STD_LOGIC_VECTOR ((n-1) downto 0)    
    );
end component;

component anodes_manager is
    PORT ( 	select_digit 	: in  STD_LOGIC_VECTOR (2 downto 0);
				enable_digit 	: in  STD_LOGIC_VECTOR (7 downto 0);
				anodes 			: out  STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

component cathodes_manager is 
    PORT(  	select_digit    : in    STD_LOGIC_VECTOR (2 downto 0);
            values          : in    STD_LOGIC_VECTOR (31 downto 0);
            dots            : in    STD_LOGIC_VECTOR (7 downto 0);
            cathodes        : out   STD_LOGIC_VECTOR (7 downto 0)
    );
end component;


signal select_digit 		: STD_LOGIC_VECTOR (2 downto 0) := ( others =>'0');
signal clockfx 			: STD_LOGIC :='0';
signal reset_internal 	: STD_LOGIC :='0';
signal enable_internal 	: STD_LOGIC :='1';
signal count_hit			: STD_LOGIC :='0';

begin

	reset_internal 	<= not reset ;
	enable_internal 	<= enable;
	
	cathodes_instance : 
			cathodes_manager port map (	select_digit    => select_digit,
													values          => values,
													dots            => dots,
													cathodes        => cathodes
											);
					
	anodes_instance : 
		anodes_manager port map ( 	select_digit => select_digit,
											enable_digit => enable_digit,
											anodes => anodes
										);
									
	clock_divisor_instance : 
		clock_divisor port map (	enable      =>  enable_internal,
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
										
end structural;

