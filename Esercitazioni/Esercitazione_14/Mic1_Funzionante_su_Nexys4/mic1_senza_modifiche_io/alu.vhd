----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    18:57:07 01/06/2008 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
port (
	A : in std_logic_vector(31 downto 0);
	B : in std_logic_vector(31 downto 0);
	INVA : in std_logic;
	ENA : in std_logic;
	ENB : in std_logic;
	F0 : in std_logic;
	F1 : in std_logic;
	INC : in std_logic;
	---
	Output : inout std_logic_vector(31 downto 0);
	N : out std_logic:='0';
	Z : out std_logic:='0'
);
end ALU;
 
--
--architecture ALU_Structural of ALU is
--
----signal carry_int : std_logic_vector(32 downto 0);
----signal output_int : std_logic_vector(31 downto 0);
--begin
--
--	alu:process (A,B,INVA,ENA,ENB,F0,F1,INC)
--   variable o:std_logic_vector(31 downto 0):=x"00000000";
--   variable zvar:std_logic:='0';
--   variable nvar:std_logic:='0';
--	begin
--		if (F0='0' and  F1='1' and ENA='1' and ENB='0' and INVA='0' and INC='0' )then
--			o:= A ;
--		elsif (F0='0' and  F1='1' and ENA='0' and ENB='1' and INVA='0' and INC='0' )then
--			o:= B ;
--		elsif (F0='0' and  F1='1' and ENA='1' and ENB='0' and INVA='1' and INC='0' )then
--			o:= not A ;
--		elsif (F0='1' and  F1='0' and ENA='1' and ENB='1' and INVA='0' and INC='0' )then
--			o:= not B ;
--		elsif (F0='1' and  F1='1' and ENA='1' and ENB='1' and INVA='0' and INC='0' )then
--			o:= A + B ;
--		elsif (F0='1' and  F1='1' and ENA='1' and ENB='1' and INVA='0' and INC='1' )then
--			o:=  A + B + 1;
--		elsif (F0='1' and  F1='1' and ENA='1' and ENB='0' and INVA='0' and INC='1' )then
--			o:=  A + 1;	
--		elsif (F0='1' and  F1='1' and ENA='0' and ENB='1' and INVA='0' and INC='1' )then
--			o:=  B + 1;		
--		elsif (F0='1' and  F1='1' and ENA='1' and ENB='1' and INVA='1' and INC='1' )then
--			o:=  B - A;			
--		elsif (F0='1' and  F1='1' and ENA='0' and ENB='1' and INVA='1' and INC='0' )then
--			o:=  B - 1;		
--		elsif (F0='1' and  F1='1' and ENA='1' and ENB='0' and INVA='1' and INC='1' )then
--			o:=  (not A) + 1;	-- -a = complemento ad 1 di a + 1	
--		elsif (F0='0' and  F1='0' and ENA='1' and ENB='1' and INVA='0' and INC='0' )then
--			o:=  A and B;
--		elsif (F0='0' and  F1='1' and ENA='1' and ENB='1' and INVA='0' and INC='0' )then
--			o:=  A or B;
--		elsif (F0='0' and  F1='1' and ENA='0' and ENB='0' and INVA='0' and INC='0' )then
--			o:=  "00000000000000000000000000000000";	
--		elsif (F0='1' and  F1='1' and ENA='0' and ENB='0' and INVA='0' and INC='1' )then
--			o:=  "00000000000000000000000000000001";		
--		elsif (F0='1' and  F1='1' and ENA='0' and ENB='0' and INVA='1' and INC='0' )then
--			o:=  "11111111111111111111111111111111";  --   -1
--		else
--			o:= "00000000000000000000000000000000" ; --se configurazione illegale esce 0	
--		end if;
--		if(o="00000000000000000000000000000000") then --re/setta flag di zero
--			zvar:='1';
--		else
--			zvar:='0';
--		end if;
--		if(o="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ") then --se B in hi-z
--			nvar:='0'; --flag N = 0
--		else --altrimenti
--			nvar:=o(31); --flag N = MSB
--		end if;		
--		Z<=zvar;  --assegna flag di Z
--		N<=nvar;  --assegna flag di N
--		Output<=o;  --emette risultato alu
--	end process;
--
--end ALU_Structural;





architecture ALU_Structural of ALU is

signal a_sig : std_logic_vector(31 downto 0);
signal b_sig :std_logic_vector(31 downto 0);	
signal not_a_sig : std_logic_vector(31 downto 0);
signal not_b_sig :std_logic_vector(31 downto 0);
signal a_piu_b_sig : std_logic_vector(31 downto 0);
signal a_piu_b_piu_uno_sig : std_logic_vector(31 downto 0);
signal a_piu_uno : std_logic_vector(31 downto 0);
signal b_piu_uno : std_logic_vector(31 downto 0);
signal b_meno_a :std_logic_vector(31 downto 0);
signal b_meno_uno : std_logic_vector(31 downto 0);
signal a_complemento_a_uno : std_logic_vector(31 downto 0);
signal a_and_b : std_logic_vector(31 downto 0);
signal a_or_b :std_logic_vector(31 downto 0);
signal zero :std_logic_vector(31 downto 0);
signal uno : std_logic_vector(31 downto 0);
signal meno_uno : std_logic_vector(31 downto 0);	

	
	
	
	
	
begin

   -- calcola in parallelo tutte le possibili operazioni
	a_sig <= A; --passa  A
	b_sig <= B; --passa  B
   not_a_sig <= not A ; --not A
   not_b_sig <= not B ; --not B
	a_piu_b_sig <= A + B ; -- a + b
	a_piu_b_piu_uno_sig <= A + B + 1; --a + b + 1
	a_piu_uno <= A + 1;	-- a + 1
	b_piu_uno <= B + 1;	-- b + 1
	b_meno_a <= B - A;  -- b - a
	b_meno_uno<= B - 1; -- b - 1
	a_complemento_a_uno <= (not A) + 1;	-- -a = complemento ad 1 di a + 1
	a_and_b <= A and B; -- a and b
	a_or_b <= A or B; -- a or b
	zero <= "00000000000000000000000000000000" ; --se configurazione illegale esce 0
   	uno <= "00000000000000000000000000000001"; -- 1
	meno_uno <= "11111111111111111111111111111111";  --   -1

   --sceglie quale risultato dare in uscita in accordo con i bit di controllo 
   Output <= 	a_sig when (F0='0' and  F1='1' and ENA='1' and ENB='0' and INVA='0' and INC='0' ) else
					b_sig when (F0='0' and  F1='1' and ENA='0' and ENB='1' and INVA='0' and INC='0' ) else
					not_a_sig when (F0='0' and  F1='1' and ENA='1' and ENB='0' and INVA='1' and INC='0' ) else
					not_b_sig when (F0='1' and  F1='0' and ENA='1' and ENB='1' and INVA='0' and INC='0' ) else
					a_piu_b_sig when (F0='1' and  F1='1' and ENA='1' and ENB='1' and INVA='0' and INC='0' ) else
					a_piu_b_piu_uno_sig when (F0='1' and  F1='1' and ENA='1' and ENB='1' and INVA='0' and INC='1' ) else
					a_piu_uno when (F0='1' and  F1='1' and ENA='1' and ENB='0' and INVA='0' and INC='1' ) else
					b_piu_uno when (F0='1' and  F1='1' and ENA='0' and ENB='1' and INVA='0' and INC='1' ) else
					b_meno_a when (F0='1' and  F1='1' and ENA='1' and ENB='1' and INVA='1' and INC='1' ) else
					b_meno_uno when (F0='1' and  F1='1' and ENA='0' and ENB='1' and INVA='1' and INC='0' ) else
					a_complemento_a_uno when (F0='1' and  F1='1' and ENA='1' and ENB='0' and INVA='1' and INC='1' ) else
					a_and_b when (F0='0' and  F1='0' and ENA='1' and ENB='1' and INVA='0' and INC='0' ) else
					a_or_b  when (F0='0' and  F1='1' and ENA='1' and ENB='1' and INVA='0' and INC='0' ) else
					zero  when (F0='0' and  F1='1' and ENA='0' and ENB='0' and INVA='0' and INC='0' ) else 
					uno  when (F0='1' and  F1='1' and ENA='0' and ENB='0' and INVA='0' and INC='1' ) else
					meno_uno  when (F0='1' and  F1='1' and ENA='0' and ENB='0' and INVA='1' and INC='0' ) else
					zero;

	-- calcola flag di segno
	N <= Output(31);

	-- calcola flag di zero
	Z <= '1' when (Output=x"00000000") else '0';  --Z va ad 1 solo se output vale zero



end ALU_Structural;