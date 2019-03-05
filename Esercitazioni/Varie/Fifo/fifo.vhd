-------------------------------------------------------------------------------
-- 
-- Progetto derivato da: 
-- http://www.openip.org/oc/license.html
--	Copyright Jamil Khatib 1999
-- Date 10/10/99
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- File fifo.vhd
-- Realizza le funzioni dell'unità di controllo del componente FIFO che si vuole
-- descrivere in VHDL, simulare e sintetizzare.
-- 
-- Modificare tale progetto per renderlo sintetizzabile in ISE Xilinx su board 
-- Digilent NEXYS2 con FPGA Spartan 3E e NEXYS4 Artix 7 (NEXYS4). occorre valutare
-- se le parti descritte in behavioural debbano essere modificate.
-- 
-- Descrizione Interfaccia:
-- Data_in: vettore contenente il dato che si vuole inserire in coda (push)
-- Data_out: vettore contenente il dato che si vuole estrarre dalla coda (pop)
-- clk: System Clock
-- Reset: System global Reset
-- RE: Read Enable
-- WE : Write Enable
-- Full: Full Flag che indica lo stato di coda piena (non sono possibili 
--	operazioni di push)
-- Half_full: Half Full Flag che indica lo stato di coda mezza piena 
-- Empty: Empty Flag che indica lo stato di coda vuota (non sono possibili 
-- 	operazioni di pop)
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_signed.ALL;
USE ieee.std_logic_arith.ALL;

entity FIFO is   
    generic (WIDTH : integer := 8;  -- FIFO word width (è il valore M, parallelismo della memoria, quanti bit ha ogni registro)
	     ADD_WIDTH : integer := 4); -- Address Width (è l'indirizzabilità K della memoria, ho 2^ADD_WIDTH registri)

    port (	Data_in : in std_logic_vector(WIDTH - 1 downto 0);  -- Input data
	  		Data_out : out std_logic_vector(WIDTH - 1 downto 0);  -- Out put data
	  	  	clk : in std_logic;  		-- System Clock
	  	  	Reset : in std_logic;  	-- System global Reset asincrono sul valore '0'
	  	  	RE : in std_logic;  		-- Read Enable
	  	  	WE : in std_logic;  		-- Write Enable
	  	  	Full : buffer std_logic;  	-- Full Flag
	  	  	Half_full : buffer std_logic;  -- Half Full Flag
	  	  	Empty : buffer std_logic	-- Empty Flag
		 ); 	
end FIFO;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_signed.ALL;
USE ieee.std_logic_arith.ALL;
-------------------------------------------------------------------------------
-- FIFO Architecture
-------------------------------------------------------------------------------
architecture FIFO_v1 of FIFO is

-- constant values
	constant MAX_ADDR:std_logic_vector(ADD_WIDTH -1 downto 0) := (others => '1');	-- serve a controllare quando la memoria è piena (ho fatto ADD_WIDTH scritture senza prelevare)
	constant MIN_ADDR:std_logic_vector(ADD_WIDTH -1 downto 0) := (others => '0');	-- serve a controllare quando la memoria è vuota (ho fatto ADD_WIDTH letture senza scrivere)
	constant HALF_ADDR:std_logic_vector(ADD_WIDTH -1 downto 0) := "0111";		-- serve a controllare quando la memoria è a "metà"
	-- !!!! NOTA: nell'esercizio del prof c'era HALF_ADDR = 01111111, ma ADD_WIDTH è 4 bit: avrei dovuto avere ADD_WIDTH = 8 per poter mettere 01111111! Se sono 4 bit (16 locazioni), l'indirizzo di metà è 0111! 
	
-- signal declaration
	signal Data_in_del : std_logic_vector(WIDTH - 1 downto 0);  -- delayed Data_in

	signal R_ADD   : std_logic_vector(ADD_WIDTH - 1 downto 0);  -- Read Address
    signal W_ADD   : std_logic_vector(ADD_WIDTH - 1 downto 0);  -- Write Address
	signal D_ADD   : std_logic_vector(ADD_WIDTH - 1 downto 0);  -- Diff Address

    signal REN_INT : std_logic;  		-- Internal Read Enable
    signal WEN_INT : std_logic;  		-- Internal Write Enable

-------------------------------------------------------------------------------
	component dpmem	--dual port memory utilizzata per realizzare FiFo
	    generic (ADD_WIDTH : integer := 4; WIDTH : integer := 8 );	
		port(	clk : in std_logic;
	    		reset : in std_logic;
	  			w_add : in std_logic_vector(ADD_WIDTH -1  downto 0 );
	    		r_add : in std_logic_vector(ADD_WIDTH -1 downto 0 );
	    		data_in : in std_logic_vector(WIDTH - 1 downto 0);
	    		data_out : out std_logic_vector(WIDTH - 1 downto 0 );
	    		WE  : in std_logic;
				RE  : in std_logic
			);
	end component;
    
-------------------------------------------------------------------------------
	begin  											-- Implementazione di FIFO_v1
        
		memcore: dpmem 	--map del componente dual port memory
		generic map (WIDTH => 8, ADD_WIDTH =>4)
		port map(clk => clk,
			 	reset => reset,
			 	w_add => w_add,
			 	r_add => r_add,
			 	Data_in => data_in_del,	-- a data_in associo un valore "delay", ritardato, è un buffer per non avere problemi in scrittura
			 	data_out => data_out,	-- a data_out invece associo direttamente il data_out della fifo
			 	WE => WEN_INT,
				RE => REN_INT
			);

-------------------------------------------------------------------------------
-- Process Sync:data
-- Questo processo si attiva al reset per inizializzare il segnale ritardato 
-- data_in_del e sul fronte di salita del clock per caricare il valore immesso 
-- sul bus di data_in
-------------------------------------------------------------------------------
	Sync_data: process(clk,reset)		
	begin -- process Sync_data
		if reset ='0' then
			data_in_del <= (others =>'0');
		elsif clk'event and clk = '1'  then	--carica data_in su data_in_del sul fronte di salita
			data_in_del <= data_in;			--indirizzo usato da memcore che effettua la scrittura
		else 
			data_in_del <= data_in_del;		-- mantiene il valore precedente 
		end if;
	end process Sync_data;


-------------------------------------------------------------------------------
-- Porcess Add_gen genera gli address dei puntatori alla memoria:
-- determina il valore dei puntatori (R_ADD, W_ADD e D_ADD) per il prelievo del 
-- dato in lettura (R_ADD) e per la posizione della locazione per il dato in 
-- scrittura (W_ADD). D_ADD memorizza la differenza e determina, quindi, lo stato 
-- dell'occupazione della memoria.
-- Le variabili q1, q2 e q3 sono tre contatori (parallelismo ADD_WIDTH) che 
-- conteggiano rispettivamente le operazioni di scrittura, lettura e di differenza 
-- fra scritture e letture (wr-rd). Il processo determina l'indirizzo delle prossime 
-- operazioni di scrittura/lettura.
-------------------------------------------------------------------------------
	Add_gen: process(clk,reset)    
	 variable q1 : std_logic_vector(ADD_WIDTH - 1 downto 0); 	-- W_ADD temporaneo											
	 variable q2 : std_logic_vector(ADD_WIDTH - 1 downto 0);	-- R_ADD temporaneo
	 variable q3 : std_logic_vector(ADD_WIDTH - 1 downto 0); 	-- D_ADD temporaneo

   begin  -- process ADD_gen
       -- activities triggered by asynchronous reset (active low)
       if reset = '0' then			--azzera q1, q2, q3
	   		q1 := (others =>'0');
	   		q2 := (others =>'0');
	   		q3 := (others =>'0');
			wen_int <= '0';
			ren_int <= '0';  
       elsif clk'event and clk = '1'  then		-- activities triggered by rising edge of clock	
	   		if WE = '1' and ( FULL = '0') then	-- se è stata attivata la scrittura e la memoria non è piena
	   			q1 := q1 + '1';		-- incrementa W_ADD e D_ADD temporanei
				q3 := q3 + '1';			
				wen_int <= '1';		-- abilita la scrittura dopo il controllo di disponibilità di memoria
        	else
	   			q1 := q1;			-- altrimenti non incrementare gli indirizzi
				q3 := q3;
				wen_int <= '0';		-- non abilita la scrittura
	    	end if;

			if RE = '1' and ( EMPTY = '0') then	-- se è stata attivata la lettura e la memoria non è vuota
	   			q2 := q2 + '1';		-- incrementa R_ADD e decrementa D_ADD temporanei
				q3 := q3 - '1';		
				ren_int <= '1';		--abilita la lettura dopo il controllo di dati presenti in memoria
        	else
	   			q2 := q2;			-- altrimenti non incrementare gli indirizzi
				q3 := q3;			
				ren_int <= '0';		--disabilita la lettura
	    	end if;	
	   end if;
	   -- assegnazione degli indirizzi correnti di lettura R_ADD, scrittura W_ADD e della differenza D_ADD
	   if clk'event and clk = '1'  then	   
		R_ADD  <= q2;
		W_ADD  <= q1;
		D_ADD  <= q3;
	   end if;
   end process ADD_gen;

	FULL      <=  '1' when (D_ADD(ADD_WIDTH - 1 downto 0) = MAX_ADDR) else '0';		-- calcolo di FULL (quando il registro differenza è massimo)
	EMPTY     <=  '1'when (D_ADD(ADD_WIDTH - 1 downto 0) =  MIN_ADDR) else '0';		-- calcolo di EMPTY (quando il registro differenza è minimo)
	HALF_FULL <=  '1'when (D_ADD(ADD_WIDTH - 1 downto 0) >  HALF_ADDR) else '0';	-- calcolo di HALF_FULL (quando il registro differenza è superiore al valore di mezzo, ossia la memoria è mezza piena)

------------------------------------------------------------------------------- 
end FIFO_v1;


-------------------------------------------------------------------------------
configuration fifo_conf of fifo is		-- inclusione IPCORE della memoria
	for fifo_v1
		for memcore:dpmem
  			use entity work.dpmem(dpmem_v3);
		end for;
	end for;

end fifo_conf;


