----------------------------------------------------------------------------------
--! Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
--! Engineer: AIELLO MARCO MATR. 045/004437
--! 
--! Create Date:    15:34:26 01/08/2008 
--! Design Name: 
--! Module Name:    mpc - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

----! Uncomment the following library declaration if instantiating
----! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mpc is
port(
	din:in std_logic_vector(8 downto 0);  --ingresso registro a 9 bit
	dout:out std_logic_vector(8 downto 0):="000000000";  --uscita registro a 9 bit
	ck:in std_logic  --clock
);
end mpc;

architecture Behavioral of mpc is

begin

process(ck)  --processo per registro mpc caricato sul fronte di salita
begin
	if(rising_edge(ck))then --carico MPC sul fronte di salita
		dout<=din;
	end if;
end process;

end Behavioral;

