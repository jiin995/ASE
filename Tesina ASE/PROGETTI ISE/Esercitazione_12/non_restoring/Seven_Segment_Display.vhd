---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : non_restoring
--
-- unit name: Seven_Segment_Display.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Display a 7 segmenti
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

use IEEE.math_real."ceil";
use IEEE.math_real."log2";

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Seven_Segments_Display is
generic (clock_frequency_in : natural := 50000000;
			clock_frequency_out : natural := 250);
    Port ( clk : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           values : in  STD_LOGIC_VECTOR (15 downto 0);
           dots : in  STD_LOGIC_VECTOR (3 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end Seven_Segments_Display;

architecture structural of Seven_Segments_Display is
	
	COMPONENT counter_mod_2n
	generic (N : natural);
	PORT(
		reset_n : IN std_logic;
		en : IN std_logic;
		clk : IN std_logic;          
		count : OUT std_logic_vector(N-1 downto 0);
		count_hit : OUT std_logic
		);
	END COMPONENT;

	COMPONENT CathodeManager
	PORT(
		counter : IN std_logic_vector(1 downto 0);
		nibbles : IN std_logic_vector(15 downto 0);
		dots : IN std_logic_vector(3 downto 0);          
		cathodes : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT AnodeManager
	PORT(
		counter : IN std_logic_vector(1 downto 0);
		enable : IN std_logic_vector(3 downto 0);          
		anodes : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
constant N_VALUE : natural := 2;
constant MAX_VALUE : natural := (clock_frequency_in/clock_frequency_out)-1;
constant VALUE : natural := natural(ceil(log2(real(MAX_VALUE))));

signal counter_hit : std_logic := '0';
signal count : std_logic_vector(N_VALUE-1 downto 0) := (others => '0');

begin
	
	Inst_ClockFilter: counter_mod_2n generic map(VALUE) PORT MAP(
		reset_n => reset_n,
		en => '1',
		clk => clk,
		count => open,
		count_hit => counter_hit
	);
	
	Inst_counter_modn: counter_mod_2n generic map(N_VALUE) PORT MAP(
		reset_n => reset_n,
		en => counter_hit,
		clk => clk,
		count => count,
		count_hit => open
	);
	
	Inst_CathodeManager: CathodeManager PORT MAP(
		counter => count,
		nibbles => values,
		dots => dots,
		cathodes => cathodes
	);
	
	Inst_AnodeManager: AnodeManager PORT MAP(
		counter => count,
		enable => enable,
		anodes => anodes
	);
	
end structural;

