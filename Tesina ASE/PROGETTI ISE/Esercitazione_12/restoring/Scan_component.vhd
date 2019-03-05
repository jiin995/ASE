----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    16:53:56 11/18/2017 
--! Design Name: 
--! Module Name:    Scan_component - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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

