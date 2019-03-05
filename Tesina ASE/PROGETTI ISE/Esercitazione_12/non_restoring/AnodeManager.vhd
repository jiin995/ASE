---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : non_restoring
--
-- unit name: AnodesManager.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Componente per gestire gli anodi di un display a 7 segmenti
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


entity AnodeManager is
    Port ( counter : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
end AnodeManager;

architecture structural of AnodeManager is

	COMPONENT demux1_4
	PORT(
		SEL : IN std_logic_vector(1 downto 0);
		A : IN std_logic;          
		X : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
signal anode_selected : std_logic_vector(3 downto 0) := (others => '0');

begin

	Inst_demux1_4: demux1_4 PORT MAP(
		SEL => counter,
		A => '1',
		X => anode_selected
	);
	
	anodes <= not(anode_selected and enable);
	
end structural;

