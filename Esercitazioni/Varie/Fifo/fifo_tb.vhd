-------------------------------------------------------------------------------
-- Title      : FIFO Test Bench
-- Project    : Memory Cores/FIFO
-------------------------------------------------------------------------------
-- File        : FIFO_TB.VHD
-- Author      : Jamil Khatib  <khatib@ieee.org>--> modificato da me il 19-20/11/2018
-- Organization: OpenIPCore Project
-- Created     : 2000/02/29
-- Last update : 2000/02/29
-- Platform    : 
-- Simulators  : Modelsim 5.2EE / Windows98
-- Synthesizers: 
-- Target      :
-- Dependency  : It uses VHDL 93 file syntax
-------------------------------------------------------------------------------
-- Description: FIFO Test bench
-------------------------------------------------------------------------------
-- Copyright (c) 2000 Jamil Khatib
-- 
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it under the terms of the Openip General Public
-- License as it is going to be published by the OpenIPCore Organization and
-- any coming versions of this license.
-- You can check the draft license at
-- http://www.openip.org/oc/license.html

-------------------------------------------------------------------------------
-- Revisions  :
-- Revision Number : 1
-- Version		:   0.1
-- Date 	    :	24th Feb 2000
-- Modifier     :   Jamil Khatib (khatib@ieee.org)
-- Desccription :	Created
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use std.textio.all;

entity fifo_tb is
	-- Generic declarations of the tested unit
	generic(
		WIDTH : INTEGER := 8;		-- parallelismo di parola del buffer
		ADD_WIDTH : INTEGER := 4);	--spazio indirizzi del buffer di memoria
end fifo_tb;

---------------------------------------------------------------------------
--Il test banch usa una descrizione behavioral basata sui seguenti processi 

---------------------------------------------------------------------------

architecture TB_ARCHITECTURE of fifo_tb is

--------------Dichiarazioni----------(--------------------------------------
	constant MAX_STATES : integer := (2**ADD_WIDTH);		
	
	type TEST_VECTORS is record 
		WE : std_logic;    -- Write signal
		RE : std_logic;	   -- Read  signal
	end record;
		 
	type TABLE_typ is array (0 to MAX_STATES - 1 ) of TEST_VECTORS;
	
	signal TABLE : TABLE_typ;
	
	file l_file: TEXT open write_mode is "fifo.log"; -- apertura del file di sistema 
													 -- fifo.log denotato con l_file nel codice
---------------------------------------------------------------------------

	-- Inizializzazione della tabella con sequenza di operazioni di w/r da effettuare per test
	-- l'operazione è eseguita se il bit è posto a 1, se a 0 n
	procedure init_table(signal L_TABLE: INOUT TABLE_typ) is
	begin
		L_TABLE <= (
					('0','0'), --nn
					('1','0'), --wn
					('1','0'), --wn
					('1','1'), --wr
					('1','1'), --wr
					('0','1'), --nr
					('0','0'), --nr
					('0','1'), --nr
					('1','0'), --wn
					('1','1'), --wr
					('1','0'), --wn
					('0','1'), --nr
					('0','1'), --nr
					('0','1'), --nr
					('1','1'), --wr
					('0','0')  --nn
				   );	
	end;

-- Component declaration of the tested unit
component FIFO
	generic(
		WIDTH : INTEGER := 8;		-- parallelismo di parola del buffer
		ADD_WIDTH : INTEGER := 4);	--spazio indirizzi del buffer di memoria
	port(
		Data_In : in std_logic_vector((WIDTH-1) downto 0);
		Data_Out : out std_logic_vector((WIDTH-1) downto 0);
		clk : in std_logic;
		reset : in std_logic;
		RE : in std_logic;
		WE : in std_logic;
		Full : buffer std_logic;
		Half_full : buffer std_logic;
		Empty : buffer std_logic );
end component;
	

-- Dichiarazione dei segnali: Stimulus signals  mapped to the input and inout ports
-- of tested entity
	signal Data_In : std_logic_vector((WIDTH-1) downto 0);
	signal clk : std_logic :='0'; --clk va inizializzato per poter generare la sequenza di cicli successiva
	signal reset : std_logic;
	signal RE : std_logic;
	signal WE : std_logic;

-- Observed signals - signals mapped to the output ports of tested entity
	signal Data_Out : std_logic_vector((WIDTH-1) downto 0);
	signal Full : std_logic;
	signal Half_full : std_logic;
	signal Empty : std_logic;


begin									-----Inizio corpo architecture testbench----------
	-- Unit Under Test component "FIFO" port map
	UUT : FIFO	
		port map(										--Map del componente FIFO
					Data_In => Data_In,
					Data_Out => Data_Out,
					clk => clk,
					reset => reset,
					RE => RE,
					WE => WE,
					Full => Full,
					Half_full => Half_full,
					Empty => Empty
				);
					--Segue implementazione di 7 componenti che operano in parallelo C1, C2, P1..P5
-- Clock generation									-- Componente_C1
	clk <= not clk after 40 ns;

-- Reset generation									-- Componente_C2
	reset <= transport '0', '1' after 20 ns;	--clk è inizializzato a 0, e genera il reset,
												-- è si porta a 1 dopo 20 ns per operare normalmente		

-- Generazione delle operazioni di scrittura: WE signal stimuls generation
	write_proc: process(clk,reset)				--Process_1
	variable count  : integer;					--count è locale al processo
    variable l : line;
	begin
		if  reset = '0' then	
				count := 0;
				Data_in <= (others => '0');			
				init_table(TABLE);	--richiama la funzione di inizializzazione della tab. delle op. di R/W
				--Inizio Trace
				write(l,' ');		
				writeline(l_file,l);
				write(l,'=');--"=======RESET========",right,20);
				write(l,'=');
				write(l,'R');
				write(l,'S');
				write(l,'T');
				write(l,'=');
				write(l,'=');
				write(l,'@');
				write(l,now);
				writeline(l_file,l);	--scrive rigo su log che traccia operazione
				--Fine Trace
				we <= '0';			--azzera flag di scrittura
		elsif clk'event and clk = '1' then		
				count := count +1;
				if count > (MAX_STATES-1) or count < 0 then
					count := 0;					   		
				end if;
				we <= TABLE(count).WE;
				if we='1' then 
					data_in <= data_in + 1;	--genera per data_in una sequenza di valori interi
											--modulo 2**WIDTH da scrivere in mem
				end if;
				
				--Inizio Trace--
				write(l,'W');write(l,'E');
				write(l,'=');write(l,conv_integer(we));
				write(l,' ');
				write(l,conv_integer(data_in));
				write(l,'@');
				write(l,now);
				writeline(l_file,l);
				--Fine Trace
		end if;
	end process write_proc;


-- RE signal stimuls generation
 --process_2 di lettura di data_out (pop)
	read_proc: process(clk,reset)
		variable l : line;
		variable count  : integer;
	begin
		if 	reset = '0' then
			count := 0;				--count è varabile locale al processo
			re <= '0';	
		elsif clk'event and clk = '0' then
			count := count +1;
			if count > (MAX_STATES-1)  or count < 0 then
				count := 0;	
			end if;
			re <= TABLE(count).RE;
			--Inizio Trace
			write(l,'R');write(l,'E');
			write(l,'=');write(l,conv_integer(re));
			write(l,' ');
			write(l,conv_integer(data_out));
			write(l,'@');
			write(l,now);			
			writeline(l_file,l);
			--Fine Trace
		end if;	
	end process read_proc;

-- diff pointer che mantiene la differenza fra operazioni di scrittura e quelle di lettura
	ptr_proc: process(WE,RE,reset)								--process_3
		variable diff_ptr : integer;
		variable l : line;
	begin
		if reset = '0' then
			diff_ptr := 0;				
		end if;

		if WE = '1' then
			diff_ptr := diff_ptr + 1;
		end if;

		if RE = '1' then
			diff_ptr := diff_ptr - 1;
		end if;

		write(l,'d');write(l,'f');write(l,'f');
		write(l,'=');write(l,conv_integer(diff_ptr));
		write(l,'@');write(l,now);
		writeline(l_file,l);
	end process ptr_proc;

-- clock monitor process
	clk_proc: process(clk)										--process_4
		variable l : line;
	begin
		if clk = '1' then		
			write(l,' ');
			writeline(l_file,l);
			write(l,'*');write(l,'*');write(l,'*');
			write(l,'c');write(l,'l');write(l,'k');
			write(l,'@');
			write(l,now);			
			writeline(l_file,l);			
		end if;		

	end process	clk_proc;

-- flags monitor process
	flags_proc: process(full, half_full, empty)					--process_5
		variable l : line;
	begin		
		if full = '1'  then
			write(l,'!');
			write(l,'F');write(l,'U');write(l,'L');
			write(l,'@');
			write(l,now);			
			writeline(l_file,l);			
		end if;
			
		if half_full = '1'  then
			write(l,'H');write(l,'L');write(l,'F');
			write(l,'@');
			write(l,now);			
			writeline(l_file,l);			
		end if;	

		if empty = '1' then
			write(l,'!');
			write(l,'E');write(l,'M');write(l,'P');
			write(l,'@');
			write(l,now);			
			writeline(l_file,l);						
		end if;
	end process	flags_proc;
	
end TB_ARCHITECTURE;

----------------------------------------Configuration-------------------------------
configuration TESTBENCH_FOR_FIFO of fifo_tb is
	for TB_ARCHITECTURE
		for UUT : FIFO
			use entity work.FIFO(FIFO_v1);
		end for;
	end for;
end TESTBENCH_FOR_FIFO;



