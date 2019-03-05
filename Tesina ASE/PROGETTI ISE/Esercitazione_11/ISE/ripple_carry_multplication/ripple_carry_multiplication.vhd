---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : ripple_carry_multiplication
--
-- unit name: ripple_carry_multiplication.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Moltiplicatore che effettua il prodotto come somma di righe della matrice dei prodotti parziali
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

--! il ripple carry multiplier effettua il prodotto come somma di righe
--! utilizzando più RCA in cascata per sommare ogni riga della matrice dei prodotti parziali

entity ripple_carry_multiplier is
	Generic ( 	N : integer := 128;	--! parallelismo moltiplicando
					M : integer := 128	--! parallelismo moltiplicatore
					);	
    Port ( 	
				A : in  STD_LOGIC_VECTOR (N-1 downto 0);
				B : in  STD_LOGIC_VECTOR (M-1 downto 0);
				P : out  STD_LOGIC_VECTOR (N+M-1 downto 0));
end ripple_carry_multiplier;

architecture structural of ripple_carry_multiplier is

	type mat_MxN is array(M-1 downto 0) of std_logic_vector(N-1 downto 0);	
	signal partial_prod : mat_MxN := ( others => ( others => '0' ) );	--! matrice dei prodotti parziali (M*N)
	
	type mat_M1xN1 is array(M downto 0) of std_logic_vector(N downto 0);
	signal partial_sum : mat_M1xN1 := ( others => ( others => '0' ) );	--! matrice delle somme parziali	((M+1)*(N+1))
	
	component rippleCarry_adder is
		generic (
			width	: natural := N
			);
		port(
			X	: in std_logic_vector(width-1 downto 0);
			Y	: in std_logic_vector(width-1 downto 0);
			c_in : in std_logic;
			c_out: out std_logic;
			S : out std_logic_vector(width-1 downto 0)	
		);
	end component;

begin

	--generaziome matrice prodotti parziali
	gen_partial_prod_columns: for i in 0 to N-1 generate
		gen_partial_prod_rows: for j in 0 to M-1 generate
			partial_prod(j)(i)<=A(i) and B(j);
		end generate;
	end generate;
	
	--! collegamento dei ripple carry adder	
	gen_rcmultiplier: for i in 0 to M-1 generate
	
		gen_first_sum: if i=0 generate
			partial_sum(i+1)(N-1 downto 0) <= partial_prod(i)(N-1 downto 0);	--! per evitare di generare un RCA al primo passo
																									--! che sommi inutilmente la prima riga della matrice
																									--! dei prodotti parziali con 0, portiamo direttamente
																									--! tale riga della matrice delle somme parziali																						
		end generate;
		
		gen_rca: if i>0 generate
			rca: rippleCarry_adder PORT MAP(
				X => partial_prod(i)(N-1 downto 0),	--! riga dei prodotti parziali
				Y => partial_sum(i)(N downto 1),		--! + bit più significativi della somma parziale precedente
				c_in =>'0',								
				s => partial_sum(i+1)(N-1 downto 0),	--! il risultato è la somma parziale allo stato successivo	
				c_out => partial_sum(i+1)(N)				--! c_out è il bit più significativo della nuova somma parziale
			);
		end generate;
		
	end generate;
	
	gen_P_1: for i in 0 to M-1 generate
		p(i) <= partial_sum(i+1)(0);			--! i primi N bit del prodotto sono ricavati dalle somme parziali sulla prima colonna
	end generate;
	
	gen_P_2: for j in 0 to N-1 generate
		p(M+j) <= partial_sum(M)(j+1);		--! i restanti M bit del prodotto sono ricavati dalle somme parziali sull'ultima riga
	end generate;


end Structural;

