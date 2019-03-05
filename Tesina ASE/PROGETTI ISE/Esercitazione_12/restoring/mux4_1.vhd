---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: mux4_1.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Multiplexer con 4 ingressi e 1 uscita
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

entity mux4_1 is
    Port ( SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           A   : in  STD_LOGIC_VECTOR(3 downto 0);
           X   : out STD_LOGIC
   );
end mux4_1;

architecture structural of mux4_1 is

	component mux2_1 is
    	Port( 
       		SEL : in  STD_LOGIC;
           	A   : in  STD_LOGIC;
           	B   : in  STD_LOGIC;
           	x   : out STD_LOGIC
  	 );
	end component;

signal mux_out1 : std_logic := '0';
signal mux_out2 : std_logic := '0';

begin

	inst_mux0: mux2_1 port map(
								SEL => SEL(0),
								A => A(0),
								B => A(1),
								x => mux_out1
								);
	
	inst_mux1: mux2_1 port map(
								SEL => SEL(0),
								A => A(2),
								B => A(3),
								x => mux_out2
								);
		
	inst_mux2: mux2_1 port map(
								SEL => SEL(1),
								A => mux_out1,
								B => mux_out2,
								x => X
								);


end structural;
