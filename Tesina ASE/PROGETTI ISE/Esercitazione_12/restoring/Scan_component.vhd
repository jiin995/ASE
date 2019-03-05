---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: Scan_component.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Implementazione di una scan chain
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


entity Scan_component is
	Port ( Din : in  STD_LOGIC;
           Scan_in : in  STD_LOGIC;
			  en	: in std_logic;
			  clock : in std_logic;
           Scan_en : in  STD_LOGIC;
			  reset_n : in std_logic;
           Dout : out  STD_LOGIC);
end Scan_component;

architecture Behavioral of Scan_component is
	component edge_trigger_dn is
	generic ( width : integer);
    Port ( d : in  STD_LOGIC_vector(width-1 downto 0);
           en : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_vector(width-1 downto 0));
	end component;
	
	component mux2_1 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC;
           B   : in  STD_LOGIC;
           X   : out STD_LOGIC
   );
	end component;
	signal mux_out : std_logic:='0';
begin
		Mux_gen : mux2_1 
					port map(
						A=> Din,
						B=>Scan_in,
						SEL =>Scan_en,
						X=>mux_out
					);

		Gen_edge_tr_D : edge_trigger_dn 
					generic map(width=>1)
					port map(
						clk=>clock,
						reset_n=>reset_n,
						en=>en,
						d(0)=>mux_out,
						q(0)=>Dout
						
					);

end Behavioral;

