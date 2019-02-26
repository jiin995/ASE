library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;

entity restoring_divider is
	 generic ( n : integer := 8);
    Port ( X : in  STD_LOGIC_VECTOR (n-1 downto 0);		-- dividendo della divisione
           Y : in  STD_LOGIC_VECTOR (n-1 downto 0); 	-- divisore della divisione
           Q : out  STD_LOGIC_VECTOR (n downto 0);	-- quoziente della divisione
           R : out  STD_LOGIC_VECTOR (n-1 downto 0);	-- resto della divisione
           Reset_n : in  STD_LOGIC;
			  clock	: in	std_logic;
           start : in  STD_LOGIC;	-- alto quando inizia la moltiplicazione
           stop : out  STD_LOGIC		-- alto quando il risultato è pronto
			  );
end restoring_divider;

architecture structural of restoring_divider is

	COMPONENT Control_Unit
	PORT(
		counter_hit : IN std_logic;
		sel_q0	: out std_logic;
		S : IN std_logic;
		reset_n : IN std_logic;
		start_division : IN std_logic;
		stop_division: OUT std_logic;
		clock : IN std_logic;          
		count_in : OUT std_logic;
		subtract : OUT std_logic;
		en_a : OUT std_logic;
		en_q : OUT std_logic;
		en_q0 : OUT std_logic;
		reset_a_n : OUT std_logic;
		shift : OUT std_logic;
		reset_counter_n : OUT std_logic
		);
	END COMPONENT;
	
	component counter_UpN_Re_Sr is
	generic( n : integer := n);
    Port ( clock : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           count_hit : out STD_LOGIC;		-- counter hit
           counts : out  STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0));
	end component;

	
	component scan_chain is
    generic(
			  width : integer := N;									-- dimensione del registro
			  shift_direction : std_logic := '1'					-- shift a sinistra
	 );
    Port ( 	clock 		: in  STD_LOGIC;							-- segnale clock di tempificazione
           	en 			: in  STD_LOGIC;							-- segnale di abilitazione 1-attivo
				reset_n 		: in  STD_LOGIC;							-- segnale di reset 0-attivo
				scan_en 		: in  STD_LOGIC;							-- segnale di selezione modalità (0 = normale, 1 = controllo)
				scan_in 		: in  STD_LOGIC;							-- primo valore scan-in 
				d_reg 		: in  STD_LOGIC_VECTOR (width-1 downto 0);	-- valore in ingresso nel registro
				scan_out 	: out  STD_LOGIC;							-- ultimo valore scan-out
				q_reg 		: out  STD_LOGIC_VECTOR (width-1 downto 0)	-- valore in uscita del registro
	);
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
	signal hit,en_count,rst_n_cnt,reset_count_n,subtract,scan_in_a   : std_logic:='0';
	signal sig_a_sig, sig_a_sig_n, en_a, en_q,en_q0,reset_a_n,rst_a_n,shift,sel_q0,q0_outmux,q0_out : std_logic :='0';
	signal M_out,true_op_b : std_logic_vector(n-1 downto 0);
		signal a_out, sum_out : std_logic_vector(n-1 downto 0);

begin

	Inst_Control_Unit: Control_Unit PORT MAP(
		counter_hit =>hit,
		sel_q0=>sel_q0,
		count_in =>en_count,
		S =>Sig_A_sig,
		subtract =>subtract,
		reset_n =>reset_n,
		en_a =>en_a,
		en_q =>en_q,
		en_q0 =>en_q0,
		reset_a_n =>rst_a_n,
		shift =>shift,
		start_division =>start,
		stop_division => stop,
		clock =>clock,
		reset_counter_n =>rst_n_cnt
	);
		
		sig_a_sig_n<= not sig_a_sig;
		selQ0_mux2_1: mux2_1 PORT MAP(
		SEL =>sel_q0,
		A =>X(0),
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
	
	Q(0)<=q0_out;
	
		Y_M: edge_trigger_dn generic map(n) PORT MAP(
		d =>Y,
		en =>'1',
		reset_n =>reset_n,
		clk =>clock,
		q =>M_out
	);

		reset_a_n<= reset_n and rst_a_n;
	
		register_a	:	scan_chain 
		generic 	map	(	width 				=> N,
								shift_direction 	=> '1'					
				)
		Port 		map	( 	clock 		=> clock,
								en 			=> en_a,
								reset_n 		=> reset_a_n,
								scan_en 		=> shift,
								scan_in 		=> scan_in_a,
								d_reg 		=> sum_out,
								scan_out 	=> sig_a_sig,
								q_reg 		=> a_out
			);

	register_q	:	scan_chain 
		generic 	map	(	width 				=> N,
								shift_direction 	=> '1'					
				)
		Port 		map	( 	clock 		=> clock,
								en 			=> en_q,
								reset_n 		=> reset_n,
								scan_en 		=> shift,
								scan_in 		=> q0_out,
								d_reg 		=> X,
								scan_out 	=> scan_in_a,
								q_reg 		=> Q(N downto 1)
			);
	
	R<=a_out;
	
	xor_gen: for i in 0 to n-1 generate
		true_op_b(i)<=subtract xor M_out(i);
	end generate;
	

	Inst_ripple_carry_adder: ripple_carry_adder generic map(n) PORT MAP(
		X =>a_out,
		Y =>true_op_b,
		cin =>subtract,
		cout =>open,
		sum =>sum_out
	);
	
	reset_count_n<=reset_n and rst_n_cnt;
	
	Inst_counter_UpN_Re_Sr: counter_UpN_Re_Sr
		generic 	map	(	n 				=> (integer(ceil(log2(real(2*n)))) - 1)			
				)
				PORT MAP(
		clock => clock,
		enable =>en_count,
		reset_n =>reset_count_n,
		count_hit =>hit,
		counts =>open
	);
	
end structural;

