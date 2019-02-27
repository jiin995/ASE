----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:53 01/26/2018 
-- Design Name: 
-- Module Name:    BoothMultiplier - Behavioral 
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
use ieee.math_real."ceil";
use ieee.math_real."log2";
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BoothMultiplier is
	generic ( n : integer := 8);
    Port ( Multiplier : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Multiplicand : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Start_mul : in  STD_LOGIC;
			  reset_n 	: in std_logic;
			  clk			: in std_logic;
           Result : out  STD_LOGIC_VECTOR (2*n-1 downto 0));
end BoothMultiplier;

architecture Structural of BoothMultiplier is

	component Control_Unit is
    Port ( reset_n : in  STD_LOGIC;
			  reset_counter_n : out std_logic;
           count_in : out  STD_LOGIC;
           subtract : out  STD_LOGIC;
           start_mul : in  STD_LOGIC;
           load_aq_n : out  STD_LOGIC;
           en_a : out  STD_LOGIC;
           en_q : out  STD_LOGIC;
			  reset_a_n : out std_logic;
           counter : in  STD_LOGIC;
			  clock	: in std_logic;
           Q_0q_m1 : in  STD_LOGIC_vector(1 downto 0));
	end component;
	
	component Counter_Hit2 is
	generic( width : integer := 4);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           hit : out STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (width-1 downto 0));
	end component;
	
	component CSA is
	generic ( n : natural :=16 );
    Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component
	Accumulator_Quotient is
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
	end component;
	
	component edge_trigger_dn is
	generic ( width : integer);
    Port ( d : in  STD_LOGIC_vector(width-1 downto 0);
           en : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_vector(width-1 downto 0));
	end component;


	--segnali di collegamento tra CU e Counter
	signal reset_cnt_n, true_reset_cnt_n : std_logic:='0';
	signal count_en : std_logic:='0';
	signal counter_hit : std_logic:='0';
	--segnali di collegamento tra AQReg e CU
	signal load_data_n, en_a,en_q : std_logic:='0';
	signal reset_a_n, true_reset_a_n: std_logic:='0';
	signal Q_and_0 : std_logic_vector(n downto 0):=(others=>'0');
	signal Q0m1	: std_logic_vector(1 downto 0):=(others=>'0');
	--segnali di collegamento Con PA AQ e CU
	signal M_xor_sub_sig : std_logic_vector(n-1 downto 0):=(others=>'0'); 
	signal subtract	: std_logic:='0';
	signal sum_res		: std_logic_vector(n-1 downto 0):=(others=>'0');
	signal A_out		: std_logic_vector(n-1 downto 0):=(others=>'0');
	signal MR_And_0_sig : std_logic_vector(n downto 0):=(others=>'0');
	--segnali di collegamento con il registro MD
	signal M_sig : std_logic_vector(n-1 downto 0):=(others=>'0');

begin

	Inst_Control_Unit: Control_Unit PORT MAP(
		reset_n =>reset_n,
		reset_counter_n =>reset_cnt_n,
		count_in =>count_en,
		subtract =>subtract,
		start_mul =>start_mul,
		load_aq_n =>load_data_n,
		en_a =>en_a,
		en_q =>en_q,
		reset_a_n =>reset_a_n,
		counter =>counter_hit,
		clock=>clk,
		Q_0q_m1 =>Q0m1
	);
	
	true_reset_a_n<=reset_n and reset_a_n;
	MR_And_0_sig(n downto 1)<=multiplier;
	MR_And_0_sig(0)<='0';
	AQ_inst: Accumulator_Quotient generic map(n) PORT MAP(
		High_Reg =>sum_res,
		Load_data_n =>load_data_n,
		Low_Reg =>MR_And_0_sig,
		H_read =>A_out,
		L_read =>Q_and_0,
		clk =>clk,
		en_a =>en_a,
		en_q =>en_q,
		reset_a_n =>true_reset_a_n,
		reset_q_n =>reset_n,
		Q0_m1 =>Q0m1
	);
	result(2*n-1 downto n)<=A_out(n-1 downto 0);
	result(n-1 downto 0)<=Q_and_0(n downto 1); --l'ultimo bit è il bit fittizio aggiunto

	GenMXORSUB: for i in 0 to n-1 generate
		M_xor_sub_sig(i)<= M_sig(i) xor subtract;
	end generate;
	PA: CSA generic map(n) PORT MAP(
		A =>A_out,
		B =>M_xor_sub_sig,
		cin =>subtract,
		cout =>open,
		sum =>sum_res
	);

	MD: edge_trigger_dn generic map(n) PORT MAP(
		d =>multiplicand,
		en =>'1',
		reset_n =>reset_n,
		clk =>clk,
		q =>M_sig
	);

	true_reset_cnt_n<= reset_n and reset_cnt_n;	-- resetto se uno dei due è attivo (0)
	counter: Counter_Hit2 generic map(integer(ceil(log2(real(n))))) PORT MAP(
			clk =>clk,
			en =>count_en,
			rst_n =>true_reset_cnt_n ,
			hit =>counter_hit,
			q =>open
		);
end Structural;

