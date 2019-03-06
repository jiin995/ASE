----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    12:07:33 11/11/2017 
--! Design Name: 
--! Module Name:    counter_UpN_Re_Srn - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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

