----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:23 01/23/2018 
-- Design Name: 
-- Module Name:    Accumulator_Quotient - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Accumulator_Quotient is
	generic ( N : integer := 8);
    Port ( High_Reg: in  STD_LOGIC_VECTOR (N-1 downto 0);
			  Load_data_n		: in std_logic;
           Low_Reg : in  STD_LOGIC_VECTOR (N downto 0);	--l'ultimo bit è quello fittizio usato dall'algoritmo di booth
           H_read : out  STD_LOGIC_VECTOR (N-1 downto 0);
           L_read : out  STD_LOGIC_VECTOR (N downto 0);
			  clk : in std_logic;
			  en_a	: in std_logic;
			  en_q	: in std_logic;
			  reset_a_n : in std_logic;
			  reset_q_n  : in std_logic;
           Q0_m1 : out  STD_LOGIC_vector(1 downto 0));
end Accumulator_Quotient;

architecture structural of Accumulator_Quotient is

--per i registri A e Q
	component Scan_chain is
	generic (scan_lenght : natural :=4; left_shift_n : std_logic :='1');
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
	signal A_out : std_logic_vector(n-1 downto 0):=(others=>'0');
	signal Q_out : std_logic_vector(n downto 0):=(others=>'0');
begin
	q0_m1(1)<=Q_out(1);
	L_read<=Q_out;
	Q: Scan_chain generic map(N+1,'1') port map(
		din=>Low_reg,
		scan_in=>a_to_q,
		en=>en_q,
		clock=>clk,
		scan_en=>load_data_n,
		scan_out=>Q0_m1(0),
		reset_n=>reset_q_n,
		dout=>Q_out
	);
	
	A: Scan_chain generic map(N,'1') port map(
		din=>High_reg,
		scan_in=>A_out(n-1),
		en=>en_a,
		clock=>clk,
		scan_en=>load_data_n,
		scan_out=>a_to_q,
		reset_n=>reset_a_n,
		dout=>a_out	
		);
	H_read<=A_out;

end structural;

