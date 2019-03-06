---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: full_adder.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Sommatore Full-Adder 3 ingressi 2 uscite
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
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		x	:in std_logic;
		y	:in std_logic;
		cin	:in std_logic;
		cout:out std_logic;
		sum	:out std_logic
	);
end full_adder;

architecture structural of full_adder is

--begin 
--sum <= x XOR y XOR Cin ;
--Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y) ;


--signal declaration
	signal c0	: std_logic:='0';
	signal c1	: std_logic:='0';
	signal s1	: std_logic:='0';
	
	component half_adder is
	port(
		x 	:	in std_logic;
		y	:	in std_logic;
		s	:	out std_logic;
		c	:	out	std_logic
	);
	end component;

	begin

	HA1:half_adder port map (
							x=>x,
							y=>y,
							s=>s1,
							c=>c0
	);
	HA2:half_adder port map (s1,cin,sum,c1
	);
	cout<= c1 or c0;
	
end structural;
