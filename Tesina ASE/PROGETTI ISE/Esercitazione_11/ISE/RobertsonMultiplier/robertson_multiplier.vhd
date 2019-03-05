---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : RobertsonMultiplier
--
-- unit name: robertson_multiplier.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Moltiplicatore di Robertson che implementa l'algoritmo di Robertson
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
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;
    
entity robertson_multiplier is
    GENERIC ( N :   INTEGER :=  8			 
        );
    PORT    (   X       :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                Y       :   in  STD_LOGIC_VECTOR (N-1 downto 0);
                start   :   in  STD_LOGIC;
                clock   :   in  STD_LOGIC;
                reset_n :   in  STD_LOGIC;
                stop    :   out STD_LOGIC;
                Z       :   out STD_LOGIC_VECTOR ((2*N)-1 downto 0)
        );

end robertson_multiplier;

architecture Structural of robertson_multiplier is

component robertson_control_unit is 
    generic (   N   :   NATURAL :=8    --!  parallelismo di X
    );
    port    (   clock                   :   in      STD_LOGIC;
                start                   :   in      STD_LOGIC;
                reset_n                 :   in      STD_LOGIC;
                current_multiplicand    :   in      STD_LOGIC;          --! moltiplicando corrente
                counter_hit             :   in      STD_LOGIC;          --! segnala la fine della moltiplicazione
                stop                    :   out     STD_LOGIC;
                en_a                    :   out     STD_LOGIC;          --! se scan_en =1 la scan chain funziona come shifter register
                en_q                    :   out     STD_LOGIC;
                en_m                    :   out     STD_LOGIC;
                shift                   :   out     STD_LOGIC;                    
                subtract                :   out     STD_LOGIC;
                count_up                :   out     STD_LOGIC;
                sel                     :   out     STD_LOGIC;          --! sel pilota il secondo input dell'adder 0 in input è Y 1 sono tutti 0
                reset_a                 :   out     STD_LOGIC;
                reset_count             :   out     STD_LOGIC          	--! reset il conteggio
    );
end component;

component scan_chain is
    generic(
			  width : integer := 8;									--! dimensione del registro
			  shift_direction : std_logic := '0'					--! shift a destra
	 );
    Port ( 	clock 		: in  STD_LOGIC;							--! segnale clock di tempificazione
           	en 			: in  STD_LOGIC;							--! segnale di abilitazione 1-attivo
				reset_n 		: in  STD_LOGIC;							--! segnale di reset 0-attivo
				scan_en 		: in  STD_LOGIC;							--! segnale di selezione modalità (0 = normale, 1 = controllo)
				scan_in 		: in  STD_LOGIC;							--! primo valore scan-in 
				d_reg 		: in  STD_LOGIC_VECTOR (width-1 downto 0);	--! valore in ingresso nel registro
				scan_out 	: out  STD_LOGIC;							--! ultimo valore scan-out
				q_reg 		: out  STD_LOGIC_VECTOR (width-1 downto 0)	--! valore in uscita del registro
	);
end component;

component  register_d_Re_Ar is 
    generic(    width       :   NATURAL :=8	      --! definisce il parallelismo del registro
		);

    port(   clock   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale di clock per sincronizzare
            enable  :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale enable
            reset   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale reset
            d       :   in  STD_LOGIC_VECTOR    (width-1 downto 0);	--! register_d_Re_Ar input    : inpput data 
            q       :   out STD_LOGIC_VECTOR    (width-1 downto 0)	--! register_d_Re_Ar input    : output data
    );

end component;

component flipflop_d_risingEdge_asyncReset is 

    generic (   
                init_value      :   STD_LOGIC :='0';    --! definisce il livello iniziale del flipflop
                reset_level     :   STD_LOGIC :='0';    --! definisce il livello reset
                enable_level    :   STD_LOGIC := '1'    --! definisce il livello enable

    );
    
    port (  clock   :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : segnale di clock per sincronizzare
            enable  :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : segnale enable
            reset   :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : segnale reset
            d       :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : input data
            q       :   out STD_LOGIC   --! flipflop_d_risingEdge_asyncReset output   : output data
    );
end component;

component mux2_1
	generic (   width : natural := 1                     --! parallelismo dell' I/O del multiplexer
    );
   port(   SEL : in  STD_LOGIC;                                    --! mux2_1 input: selezione 
           A   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: A
           B   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: B
           X   : out STD_LOGIC_VECTOR ((width-1) downto 0)         --! mux2_1 output: X
       );
end component;

component carrySelect_addSub is 
    generic (	 M       : NATURAL :=  4;
                P       : NATURAL :=  4
    );
    port (
            A           : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
            B           : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
            subtract    : in    STD_LOGIC ;
            S           : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! output somma
            overflow    : out   STD_LOGIC ;
            c_out       : out   STD_LOGIC                               --! output carry in uscita
    );
end component;

component  counter_UpN_Re_Sr is 
    generic (   n       : NATURAL :=2
		);
    port(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0)    --! COUNT output
    );
end component ;

signal internal_a,internal_m,internal_a_m,internal_q,internal_m_mux	:	STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
signal en_a,en_q,en_m,subtract,sel,shift,scan_in_q,F_in,F_out,
			current_multiplicand,count_up,counter_hit,reset_a,reset_count	: STD_LOGIC :='0';

begin

	register_m	: 	register_d_Re_Ar 
		generic 	map	( 	width   => N	  )
		port	  	map	( 	clock   => clock,
								enable  => en_m,
								reset   => reset_n,
								d       => Y,
								q       => internal_m
				 );
	
	mux2_1_inst	:	mux2_1
		generic 	map	(  width =>N  )
		port		map	(  SEL 	=>	sel, 
								A   	=> internal_m,
								B   	=>	(others => '0'),
								X   	=> internal_m_mux
       );
	
	register_a	:	scan_chain 
		generic 	map	(	width 				=> N,
								shift_direction 	=> '0'					
				)
		Port 		map	( 	clock 		=> clock,
								en 			=> en_a,
								reset_n 		=> reset_a,
								scan_en 		=> shift,
								scan_in 		=> F_out,
								d_reg 		=> internal_a_m,
								scan_out 	=> scan_in_q,
								q_reg 		=> internal_a
			);

	register_q	:	scan_chain 
		generic 	map	(	width 				=> N,
								shift_direction 	=> '0'					
				)
		Port 		map	( 	clock 		=> clock,
								en 			=> en_q,
								reset_n 		=> reset_n,
								scan_en 		=> shift,
								scan_in 		=> scan_in_q,
								d_reg 		=> X,
								scan_out 	=> open,
								q_reg 		=> internal_q
			);


	F: F_in <= ((internal_m(N-1) and internal_q(0)) or F_out);
	register_F	:	flipflop_d_risingEdge_asyncReset      
		port		map	(  clock   		=> clock,
								enable  		=> '1',
								reset   		=> reset_n,
								d       		=> F_in,
								q       		=> F_out
			);
			
	carrySelect_addSub_inst : carrySelect_addSub  
		generic 	map 	( 	M   	=> N/2,
								P		=> 2
							)
		port 	  	map 	(	A			=>	internal_a,
								B       	=>	internal_m_mux, 				
								subtract	=>	subtract,                                  
								S       	=> internal_a_m,
								c_out 	=> open,
								overflow => open
		 );
		
	counter_inst :  counter_UpN_Re_Sr 
		generic	map 	(  n			=> N
			)
		port		map	( 	enable 		=> '1',
								reset_n  	=> reset_count,
								clock   		=> count_up,
								count_hit   => counter_hit,
								COUNTS     	=> open
			);

	control_unit : robertson_control_unit
		generic 	map	(  N   						=> N )
		port  	map  	(  clock    			  	=> clock,
								start    			  	=> start,
								reset_n     			=> reset_n,
								current_multiplicand => internal_q(0),
								counter_hit          => counter_hit,
								stop                 => stop,
								en_a                 => en_a,
								en_q                 => en_q,
								en_m                 => en_m,
								shift                => shift,             
								subtract             => subtract,
								count_up             => count_up,
								sel                 	=> sel,
								reset_a              => reset_a,
								reset_count          => reset_count
			);
	
	Z	<= internal_a & internal_q;
end Structural;
