---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : display_7_segmenti
--
-- unit name: display_7_segmenti.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       27/11/2018
--! @version    0.1
--! @brief      implementazione del display a 7 segmenti
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothing
--!
-- modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

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
    Generic(
				clock_frequency_in : integer := 50000000;
				clock_frequency_out : integer := 5000000
				);
		Port ( clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           values : in  STD_LOGIC_VECTOR (15 downto 0);
           dots : in  STD_LOGIC_VECTOR (3 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_7_segmenti;

architecture Structural of display_7_segmenti is

	signal counter : std_logic_vector(1 downto 0);
	signal clock_fx : std_logic := '0';	-- il clock diviso dal divisore

	component clock_divisor is
		 generic (   clock_frequency_in  : integer := 100000000;	--! frequenza del clock in ingresso
						 clock_frequency_out : integer := 1000	--! frequenza del clock in uscita
		 );
		port (  enable      :   in STD_LOGIC;	--! clock_divisor input: segnale enable
					reset_n     :   in STD_LOGIC;	--! clock_divisor input: segnale reset
					clock_freq_in    :   in STD_LOGIC ;	--! clock_divisor input: segnale di clock in ingresso
					clock_freq_out   :   out STD_LOGIC	--! clock_divisor output: segnale di clock in uscita
		 );
		 
	end component;

	component counter_mod2n is
		 generic (   n               :   NATURAL := 1;	--! usato per definire il valore massimo (2**n)-1 di fine conteggio.
						 enable_level    :   std_logic := '1'	--! definisce il livello enable
		 );
		 Port ( clock : in  STD_LOGIC;	--! segnale di clock
				  reset_n : in  STD_LOGIC;	--! se portato a 0, il contatore è resettato
				enable : in STD_LOGIC;	--! abilita il contatore se è pari a enable_level
				  counter : out  STD_LOGIC_VECTOR (n-1 downto 0)	--! n bit del contatore
				);
	end component;

	component cathodes_manager is 
		 port (  select_digit    : in    STD_LOGIC_VECTOR (1 downto 0);	--! cathodes_manager input: seleziona digit	
					values          : in    STD_LOGIC_VECTOR (15 downto 0);	--! cathodes_manager input: valore da mostrare (codifica esadecimale)
					dots            : in    STD_LOGIC_VECTOR (3 downto 0);	--! cathodes_manager input: punto da accendere per la parte decimale
					cathodes        : out   STD_LOGIC_VECTOR (7 downto 0)	--! cathodes_manager output: catodo da accendere
		 );
	end component;

	component anodes_manager is 
		 port (  select_digit    :   in  STD_LOGIC_VECTOR (1 downto 0) ;	--! anodes_manager input: seleziona digit
					enable_digit    :   in  STD_LOGIC_VECTOR (3 downto 0) ;	--! anodes_manager input: abilita digit
					anodes          :   out STD_LOGIC_VECTOR (3 downto 0)	--! anodes_manager output: digit da accendere
		 );
	end component;

begin

		clock_divisor_instance: clock_divisor generic map(
		clock_frequency_in => clock_frequency_in,
		clock_frequency_out => clock_frequency_out
		)
		port map(
			enable => clock,
			reset_n => reset_n,
			clock_freq_in => clock,
			clock_freq_out => clock_fx
		);

		counter_instance: counter_mod2n generic map(
			n => natural(2),
			enable_level => '1'
		)
		port map(
			clock => clock,
			enable => clock_fx,
			reset_n => reset_n,
			counter => counter
		);

		cathodes_instance: cathodes_manager port map(
			select_digit => counter,
			values => values,
			dots => dots,
			cathodes => cathodes
		);

		anodes_instance: anodes_manager port map(
			select_digit => counter,
			enable_digit => enable,
			anodes => anodes
		);

end Structural;

