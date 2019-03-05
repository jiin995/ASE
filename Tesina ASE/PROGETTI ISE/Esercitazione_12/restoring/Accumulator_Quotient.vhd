----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    10:34:23 01/23/2018 
--! Design Name: 
--! Module Name:    Accumulator_Quotient - Behavioral 
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

entity Accumulator_Quotient is
	generic ( N : integer := 8; M : integer := 8);
    Port ( High_Reg: in  STD_LOGIC_VECTOR (N-1 downto 0);	--! ha dimensione n+1 perch l'algoritmo di divisione nel primo passo richiede uno shift per fare spazio al quoziente in posizione Q(0)
			  shift		: in std_logic;
           Low_Reg : in  STD_LOGIC_VECTOR (m-1 downto 0);	
           H_read : out  STD_LOGIC_VECTOR (N-1 downto 0);
           L_read : out  STD_LOGIC_VECTOR (m-1 downto 0);
			  clk : in std_logic;
			  en_a	: in std_logic;
			  en_q	: in std_logic;
			  reset_a_n : in std_logic;
			  reset_q_n  : in std_logic;
			  Sign_A		: out std_logic;
           Q_0 : in  STD_LOGIC);
end Accumulator_Quotient;

architecture structural of Accumulator_Quotient is

--per i registri A e Q
	component Scan_chain is
	generic (scan_lenght : natural :=4; left_shift_n : std_logic :='0');
    Port ( Din : in  STD_LOGIC_VECTOR (scan_lenght-1 downto 0);
           Scan_in : in  STD_LOGIC;
			  en	: in std_logic;
			  clock : in std_logic;
           Scan_en : in  STD_LOGIC;
			  Scan_out : out std_logic;
			  reset_n  : in std_logic;
           Dout : out  STD_LOGIC_VECTOR (scan_lenght-1 downto 0));
	end component;
	
	
	signal A_to_Q: std_logic:= '0';
begin
	Q: Scan_chain generic map(m,'0') port map(
		din=>Low_reg,
		scan_in=>Q_0,
		en=>en_q,
		clock=>clk,
		scan_en=>shift,
		scan_out=>a_to_q,
		reset_n=>reset_q_n,
		dout=>L_read
	);
--! Ha dimensione N+1 perch alla prima operazione la divisione richiede uno shift iniziale del dividendo per 
--!liberare Q[0]; in questo modo in Q[0] potr essere inserito il quoziente calcolato	
	A: Scan_chain generic map(N,'0') port map( 
		din=>High_reg,
		scan_in=>a_to_q,
		en=>en_a,
		clock=>clk,
		scan_en=>shift,
		scan_out=>Sign_A,
		reset_n=>reset_a_n,
		dout=>H_read	
		);

end structural;

