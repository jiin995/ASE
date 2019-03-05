----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    13:13:13 01/31/2018 
--! Design Name: 
--! Module Name:    NR_Division - Strucutal 
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
use ieee.math_real.all;
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity R_Division is
	 generic ( n : integer := 4);
    Port ( Dividend : in  STD_LOGIC_VECTOR (2*n-1 downto 0);
           Divisor : in  STD_LOGIC_VECTOR (2*n-1 downto 0); 
           Quotient : out  STD_LOGIC_VECTOR (2*n-1 downto 0);
           Remainder : out  STD_LOGIC_VECTOR (2*n-1 downto 0);
           Reset_n : in  STD_LOGIC;
			  clock	: in	std_logic;
           start : in  STD_LOGIC);
end R_Division;

architecture Strucutal of R_Division is

	COMPONENT Control_Unit
	PORT(
		Counter : IN std_logic;
		sel_q0	: out std_logic;
		S : IN std_logic;
		reset_n : IN std_logic;
		start_division : IN std_logic;
		clock : IN std_logic;          
		count_in : OUT std_logic;
		subtract : OUT std_logic;
		en_a : OUT std_logic;
		en_q : OUT std_logic;
		en_q0 : OUT std_logic;
		reset_a_n : OUT std_logic;
		load_data_n : OUT std_logic;
		reset_counter_n : OUT std_logic
		);
	END COMPONENT;
	
	component Counter_Hit2 is
	generic( width : integer := 4);
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           hit : out STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (width-1 downto 0));
	end component;
	
	component Accumulator_Quotient is
	generic ( N : integer := 8; M : integer := 8);
    Port ( High_Reg: in  STD_LOGIC_VECTOR (N-1 downto 0);	--! ha dimensione n+1 perchè l'algoritmo di divisione nel primo passo richiede uno shift per fare spazio al quoziente in posizione Q(0)
			  Load_data_n		: in std_logic;
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
	end component;
	
	component edge_trigger_dn is
	generic ( width : integer);
    Port ( d : in  STD_LOGIC_vector(width-1 downto 0);
           en : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_vector(width-1 downto 0));
	end component;

	component ripple_carry_adder is
	generic (width	: natural);
	port(
		X	: in std_logic_vector(width-1 downto 0);
		Y	: in std_logic_vector(width-1 downto 0);
		cin : in std_logic;
		cout: out std_logic;
		sum : out std_logic_vector(width-1 downto 0)
		
	);
	end component;
	
	component mux2_1 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC;
           B   : in  STD_LOGIC;
           X   : out STD_LOGIC
   );
end component;
	signal hit,en_count,rst_n_cnt,reset_count_n,subtract   : std_logic:='0';
	signal sig_a_sig, sig_a_sig_n, en_a, en_q,en_q0,reset_a_n,rst_a_n,load_data_n,sel_q0,q0_outmux,q0_out : std_logic :='0';
	signal sum_out,M_out,true_op_b,a_out : std_logic_vector(2*n-1 downto 0);
begin

	Inst_Control_Unit: Control_Unit PORT MAP(
		Counter =>hit,
		sel_q0=>sel_q0,
		count_in =>en_count,
		S =>Sig_A_sig,
		subtract =>subtract,
		reset_n =>reset_n,
		en_a =>en_a,
		en_q =>en_q,
		en_q0 =>en_q0,
		reset_a_n =>rst_a_n,
		load_data_n =>load_data_n,
		start_division =>start,
		clock =>clock,
		reset_counter_n =>rst_n_cnt
	);
		
		sig_a_sig_n<= not sig_a_sig;
		selQ0_mux2_1: mux2_1 PORT MAP(
		SEL =>sel_q0,
		A =>dividend(0),
		B =>sig_a_sig_n,
		X =>q0_outmux
	);

	
		Q0_edge_trigger_dn: edge_trigger_dn generic map(1) PORT MAP(
		d(0)=>q0_outmux,
		en =>en_q0,
		reset_n =>reset_n,
		clk =>clock,
		q(0)=>q0_out
	);		
	quotient(0)<=q0_out;
	
		Divisor_M: edge_trigger_dn generic map(2*n) PORT MAP(
		d =>divisor,
		en =>'1',
		reset_n =>reset_n,
		clk =>clock,
		q =>M_out
	);

	
		reset_a_n<= reset_n and rst_a_n;
		Inst_Accumulator_Quotient: Accumulator_Quotient generic map(2*n,2*n-1) PORT MAP(
		High_Reg =>sum_out,
		Load_data_n =>load_data_n,
		Low_Reg =>dividend(2*n-1 downto 1),
		H_read =>a_out,
		L_read =>quotient(2*n-1 downto 1),
		clk =>clock,
		en_a =>en_a,
		en_q =>en_q,
		reset_a_n =>reset_a_n,
		reset_q_n =>reset_n,
		sign_a=>sig_a_sig,
		Q_0 =>q0_out
	);
	remainder<=a_out;
	
	
	
	xor_gen: for i in 0 to 2*n-1 generate
		true_op_b(i)<=subtract xor M_out(i);
	end generate;
	

	Inst_ripple_carry_adder: ripple_carry_adder generic map(2*n) PORT MAP(
		X =>a_out,
		Y =>true_op_b,
		cin =>subtract,
		cout =>open,
		sum =>sum_out
	);
	
	reset_count_n<=reset_n and rst_n_cnt;
	Inst_Counter_Hit2: Counter_Hit2 generic map (integer(ceil(log2(real(2*n)))))PORT MAP(
		clk => clock,
		en =>en_count,
		rst_n =>reset_count_n,
		hit =>hit,
		q =>open
	);
end Strucutal;

