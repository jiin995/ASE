---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : restoring
--
-- unit name: Counter_Hit2n.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Contatore modulo 2 alla N
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity counter_UpN_Re_Sr is
	generic( n : integer := 4);
    port(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR (n-1 downto 0)    --! COUNT output
    );
end counter_UpN_Re_Sr;

architecture Behavioral of counter_UpN_Re_Sr is
	signal count : std_logic_vector(n-1 downto 0):= (others=>'0');
begin

	counts<=count;
	
--	with conv_integer(count) select hit<=
--		'1' when (2**width-1),
--		'0' when others;
		
	process(count)
	begin
		if count=2**n-1 then
			count_hit<='1';
		else
			count_hit<='0';
		end if;
	end process;
process(clock,reset_n)
begin
	if(reset_n ='0') then 
		count<=(others=>'0');
	elsif(rising_edge(clock)) then	
		if(enable='1') then
			count<= std_logic_vector(unsigned(count)+1);
		end if;
	end if;
end process;

end Behavioral;

