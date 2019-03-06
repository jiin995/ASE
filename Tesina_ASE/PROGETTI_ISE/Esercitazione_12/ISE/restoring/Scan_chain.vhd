---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: Scan_chain.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Registro di n flip flop D multiplexati
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

entity Scan_chain is
	generic (scan_lenght : natural :=4; left_shift_n : std_logic :='1');
    Port ( Din : in  STD_LOGIC_VECTOR (scan_lenght-1 downto 0);
           Scan_in : in  STD_LOGIC;
			  en 	: in std_logic;
			  clock : in std_logic;
           Scan_en : in  STD_LOGIC;
			  Scan_out : out std_logic;
			  reset_n 	: in std_logic;
           Dout : out  STD_LOGIC_VECTOR (scan_lenght-1 downto 0));
end Scan_chain;

architecture Behavioral of Scan_chain is
	component Scan_component is
	Port ( Din : in  STD_LOGIC;
           Scan_in : in  STD_LOGIC;
			  en	: in std_logic;
			  clock : in std_logic;
           Scan_en : in  STD_LOGIC;
			  reset_n	: in std_logic;
           Dout : out  STD_LOGIC);
	end component;
	signal d_out : std_logic_vector(scan_lenght-1 downto 0):=(others => '0');
		
begin

	Dout<=D_out;
	
	
	Gen_scan_chain_l:	if left_shift_n='0' generate
	
		scan_out<=D_out(scan_lenght-1);
		
		Fst_Gen_Scan_component: Scan_component port map (
				Din=>Din(0),
				Scan_in=>Scan_in,
				en=>en,
				clock=>clock,
				Scan_en=>Scan_en,
				reset_n=>reset_n,
				Dout=>D_out(0)
			);
		
		Gen_Scan_component: for i in 1 to scan_lenght-1 generate
			SC: Scan_component port map (
				Din=>din(i),
				Scan_in=>d_out(i-1),
				en=>en,
				clock=>clock,
				Scan_en=>Scan_en,
				reset_n=>reset_n,
				Dout=>D_out(i)
			);
		end generate;
	
	end generate Gen_scan_chain_l; 
		
	Gen_scan_chain_r: if left_shift_n='1' generate
		
		scan_out<=D_out(0);
				
		Gen_Scan_component: for i in 0 to scan_lenght-2 generate
			SC: Scan_component port map (
				Din=>din(i),
				Scan_in=>d_out(i+1),
				en=>en,
				clock=>clock,
				Scan_en=>Scan_en,
				reset_n=>reset_n,
				Dout=>D_out(i)
			);
		end generate;
	
		Fst_Gen_Scan_component: Scan_component port map (
				Din=>Din(scan_lenght-1),
				Scan_in=>Scan_in,
				en=>en,
				clock=>clock,
				Scan_en=>Scan_en,
				reset_n=>reset_n,
				Dout=>D_out(scan_lenght-1)
			);
	end generate Gen_scan_chain_r;
end Behavioral;

