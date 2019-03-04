----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    19:51:13 01/08/2008 
-- Design Name: 
-- Module Name:    parte_operativa - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parte_operativa is
port(
	--ingressi dal MIR per pilotaggio memoria
	wwrite:in std_logic:='0';  --linea write per la ram
	rread:in std_logic:='0';  --linea read per la ram
	ffetch:in std_logic:='0';  --linea read per la rom	
	ck:in std_logic;--clock
	--ingressi abilitazione B bus			
	eobb_mdr:in std_logic;--enable onto B bus MDR
	eobb_pc:in std_logic;--enable onto B bus PC
	eobb_mbr:in std_logic;--enable onto B bus MBR signed
	eobb_mbru:in std_logic;--enable onto B bus MBRU unsigned
	eobb_sp:in std_logic;--enable onto B bus SP
	eobb_lv:in std_logic;--enable onto B bus LV
	eobb_cpp:in std_logic;--enable onto B bus CPP
	eobb_tos:in std_logic;--enable onto B bus TOS
	eobb_opc:in std_logic;--enable onto B bus OPC
	--ingressi lettura dal C bus
	wcbtr_mar:in std_logic;--write C bus to register MAR			
	wcbtr_mdr:in std_logic;--write C bus to register MDR
	wcbtr_pc:in std_logic;--write C bus to register PC
	wcbtr_h:in std_logic;--write C bus to register H  
	wcbtr_sp:in std_logic;--write C bus to register SP
	wcbtr_lv:in std_logic;--write C bus to register LV
	wcbtr_cpp:in std_logic;--write C bus to register CPP
	wcbtr_tos:in std_logic;--write C bus to register TOS
	wcbtr_opc:in std_logic;--write C bus to register OPC
	--ingressi selezione dello shifter
	sll8:in std_logic;--shift logico di 8 a sx
	sra1:in std_logic;--shift aritmetico di 1 a dx
	--ingressi di selezione funzione dell' ALU
	INVA : in std_logic;
	ENA : in std_logic;
	ENB : in std_logic;
	F0 : in std_logic;
	F1 : in std_logic;
	INC : in std_logic;
	--uscite dei flag dell'ALU
	N : out std_logic:='0';
	Z : out std_logic:='0';
	--ingressi/uscite segnali di controllo e dati della memoria
	wr:out std_logic:='0';  --linea write per la ram
	rd:out std_logic:='0';  --linea read per la ram
	fe:out std_logic:='0';  --linea read per la rom	
	address_mar:out std_logic_vector(31 downto 0):=x"00000000";  --uscite reg. mar pilotaggio mem. dati	
	address_pc:out std_logic_vector(31 downto 0):=x"00000001";  --uscite reg. pc pilotaggio mem. bytecode	
	data_mbr:in std_logic_vector(7 downto 0);  --ingresso reg. mbr lettura mem. bytecode
	inguscita_mdr:inout std_logic_vector(31 downto 0):="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";  --ing./uscita reg mdr verso mem. dati
	--uscita MBR verso circuito di oring
	mbr_outoring : out std_logic_vector(7 downto 0)  --uscita MBR verso parte di controllo
);
end parte_operativa;



architecture Behavioral of parte_operativa is
	COMPONENT negedge_dff
	PORT(
		d : IN std_logic;
		ck : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;

	COMPONENT neg_edge_reg
	PORT(
		input : IN std_logic_vector(8 downto 0);
		ck : IN std_logic;          
		output : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	COMPONENT shifter
	PORT(
		sll8 : IN std_logic;
		sra1 : IN std_logic;
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


	COMPONENT registro
	PORT(
		eobb : IN std_logic;
		wcbtr : IN std_logic;
		clock : IN std_logic;
		inpc : IN std_logic_vector(31 downto 0);          
		outb : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT dff
	PORT(
		d : IN std_logic;
		ck : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		INVA : IN std_logic;
		ENA : IN std_logic;
		ENB : IN std_logic;
		F0 : IN std_logic;
		F1 : IN std_logic;
		INC : IN std_logic;    
		Output : INOUT std_logic_vector(31 downto 0);      
		N : OUT std_logic;
		Z : OUT std_logic
		);
	END COMPONENT;

	COMPONENT mdr_register
	PORT(
		ck : IN std_logic;
		wcbtr_mdr : IN std_logic;
		rread_ritardato : IN std_logic;
		inguscita_mdr : IN std_logic_vector(31 downto 0);
		c_bus : IN std_logic_vector(31 downto 0);          
		uscita_mdr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT mbr_register
	PORT(
		ck : IN std_logic;
		eobb_mbr : IN std_logic;
		eobb_mbru : IN std_logic;
		ffetch_ritardato : IN std_logic;
		data_mbr : IN std_logic_vector(7 downto 0);          
		uscita_mbr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT posedge_reg_enable
	GENERIC(
		valore_iniziale : std_logic_vector(31 downto 0)
	);
	PORT(
		ck : IN std_logic;
		en : IN std_logic;
		input_reg : IN std_logic_vector(31 downto 0);          
		output_reg : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


	signal input:std_logic_vector (7 downto 0):="00000000";--segnale per estensione segno MBR
	signal b_bus:std_logic_vector(31 downto 0):="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";--segnale per B bus
	signal c_bus:std_logic_vector(31 downto 0):="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";--segnale per C bus
	signal alushi_sig:std_logic_vector(31 downto 0):=x"00000000";  --segnale per collegare alu e shifter
	signal h_sig:std_logic_vector(31 downto 0):=x"00000000";  --segnale per collegare alu e reg. H
	signal inpff1_sig:std_logic:='0'; --segnale per collegare il flag N al ff
	signal inpff2_sig:std_logic:='0'; --segnale per collegare il flag Z al ff
	signal rd_sig:std_logic:='0'; --segnale per collegare read
	signal wr_sig:std_logic:='0'; --segnale per collegare write
	signal fe_sig:std_logic:='0'; --segnale per collegare fetch
--	signal appeso:std_logic_vector(31 downto 0):="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";--segnale per cose ..appese
	signal uscita_mdr:std_logic_vector(31 downto 0):=x"00000000";
	signal uscita_pc_sig :std_logic_vector(31 downto 0):=x"FFFFFFFF";       

	signal address_pc_sig :std_logic_vector(31 downto 0):=x"FFFFFFFF";       
	signal sp_sig : std_logic_vector(31 downto 0):=x"00008010";  --memoria a 32 bit
	signal lv_sig : std_logic_vector(31 downto 0):=x"00008000";  --memoria a 32 bit
	signal cpp_sig : std_logic_vector(31 downto 0):=x"00004000";  --memoria a 32 bit
	signal tos_sig : std_logic_vector(31 downto 0):=x"00000000";  --memoria a 32 bit
	signal opc_sig : std_logic_vector(31 downto 0):=x"00000000";  --memoria a 32 bit
	signal mbr_sig : std_logic_vector(31 downto 0):=x"00000000";  --memoria a 32 bit
	


	signal wcbtr_mdr_sig:std_logic:='0';
	signal wcbtr_pc_sig:std_logic:='0';
	signal wcbtr_h_sig:std_logic:='0';
	signal wcbtr_mar_sig:std_logic:='0';
	signal wcbtr_sp_sig:std_logic:='0';
	signal wcbtr_lv_sig:std_logic:='0';
	signal wcbtr_cpp_sig:std_logic:='0';
	signal wcbtr_tos_sig:std_logic:='0';
	signal wcbtr_opc_sig:std_logic:='0';
	
	
	
	signal ffetch_ritardato_intermedio:std_logic:='0';
	signal ffetch_ritardato:std_logic:='0';
	signal wwrite_ritardato:std_logic:='0';
	signal wwrite_ritardato_intermedio:std_logic:='0';
	
	signal rread_ritardato:std_logic:='0';
	signal rread_ritardato_intermedio:std_logic:='0';
	
	signal fi1_sig:std_logic:='0'; --segnale per clock bifase1
	signal fi2_sig:std_logic:='0'; --segnale per clock bifase2
	
--	signal appoggio : std_logic_vector(31 downto 0):=x"FFFFFFFF";       
	

begin

	
	wr<=wwrite_ritardato;
	rd<=rread_ritardato;

	Inst_negedge_dff3: negedge_dff PORT MAP(
		d => ffetch,
		ck => ck,
		q => ffetch_ritardato_intermedio
	);

	Inst_negedge_dff4: negedge_dff PORT MAP(
		d => ffetch_ritardato_intermedio,
		ck => ck,
		q => ffetch_ritardato
	);


	rit_write: dff PORT MAP(
		d => wwrite,
		ck => ck,
		q => wwrite_ritardato
		);

	rit_read: dff PORT MAP(
		d => rread,
		ck => ck,
		q => rread_ritardato
	);


	Inst_shifter: shifter PORT MAP(
		sll8 => sll8,
		sra1 => sra1,
		input => alushi_sig,
		output => c_bus 
	);


	mar: posedge_reg_enable 
	generic map(valore_iniziale => x"00000000")
	PORT MAP( 
		ck => ck,
		en => wcbtr_mar_sig,
		input_reg => c_bus,
		output_reg => address_mar
	);

--	mar:process (ck)
--		variable mem : std_logic_vector(31 downto 0):="00000000000000000000000000000000";  --  memoria a 32 bit
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_mar_sig='1')	then
--				address_mar<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;



	Inst_mdr_register: mdr_register PORT MAP(
		ck => ck,
		wcbtr_mdr => wcbtr_mdr,
		rread_ritardato => rread_ritardato,
		inguscita_mdr => inguscita_mdr,
		c_bus => c_bus,
		uscita_mdr => uscita_mdr
	);
	
--	mdr:process(ck)
--	begin
--		if (rising_edge(ck)) then  --fronte di salita clock	
--			if (wcbtr_mdr = '1') then  --se wcbtr_mdr_sig ad 1
--				uscita_mdr<=c_bus;  --legge dal C bus e memorizza
--			elsif(rread_ritardato = '1') then  --se read ad 1  --*************************
--					uscita_mdr<=inguscita_mdr;  --legge dal data bus e memorizza  --*************************
--			end if;
--		end if;	
--	end process;
	
	--emissione sul data bus del dato memorizzato	(se non v� metti wwrite)
	inguscita_mdr <= uscita_mdr when wwrite_ritardato ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= uscita_mdr when eobb_mdr ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	

	pc : posedge_reg_enable 
	generic map(valore_iniziale => x"FFFFFFFF")
	PORT MAP( 
		ck => ck,
		en => wcbtr_pc_sig,
		input_reg => c_bus,
		output_reg => uscita_pc_sig
	);

	address_pc <= uscita_pc_sig;
	address_pc_sig <= uscita_pc_sig;
	

--	pc:process (ck)
--		variable mem : std_logic_vector(31 downto 0):=x"FFFFFFFF";       
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_pc_sig='1')	then
--				mem:=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--		address_pc<=mem;
--		address_pc_sig<=mem; --modifica address bus	
--	end process;
	
	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= address_pc_sig when eobb_pc ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";








--	sp:process (ck)
--		variable mem : std_logic_vector(31 downto 0):=x"00008010";  --memoria a 32 bit
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_sp_sig='1')	then
--				sp_sig<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;


	sp : posedge_reg_enable 
	generic map(valore_iniziale => x"00008010")
	PORT MAP( 
		ck => ck,
		en => wcbtr_sp_sig,
		input_reg => c_bus,
		output_reg => sp_sig
	);
	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= sp_sig when eobb_sp ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";




--	lv:process (ck)
--		variable mem : std_logic_vector(31 downto 0):=x"00008000";  --memoria a 32 bit
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_lv_sig='1')	then
--				lv_sig<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;


	lv : posedge_reg_enable 
	generic map(valore_iniziale => x"00008000")
	PORT MAP( 
		ck => ck,
		en => wcbtr_lv_sig,
		input_reg => c_bus,
		output_reg => lv_sig
	);

	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= lv_sig when eobb_lv ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	







--	cpp:process (ck)
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_cpp_sig='1')	then
--				cpp_sig<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;
	
	cpp : posedge_reg_enable 
	generic map(valore_iniziale => x"00004000")
	PORT MAP( 
		ck => ck,
		en => wcbtr_cpp_sig,
		input_reg => c_bus,
		output_reg => cpp_sig
	);

	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= cpp_sig when eobb_cpp ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	




--	tos:process (ck)
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_tos_sig='1')	then
--				tos_sig<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;

	tos : posedge_reg_enable 
	generic map(valore_iniziale => x"00000000")
	PORT MAP( 
		ck => ck,
		en => wcbtr_tos_sig,
		input_reg => c_bus,
		output_reg => tos_sig
	);	
	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= tos_sig when eobb_tos ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";





--	opc:process (ck)
--		variable mem : std_logic_vector(31 downto 0):="00000000000000000000000000000000";  --memoria a 32 bit
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_opc_sig='1')	then
--				opc_sig<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;

	opc : posedge_reg_enable 
	generic map(valore_iniziale => x"00000000")
	PORT MAP( 
		ck => ck,
		en => wcbtr_opc_sig,
		input_reg => c_bus,
		output_reg => opc_sig
	);	
	
	--emissione sul B bus del dato memorizzato	
--	b_bus <= opc_sig when eobb_opc ='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	
	b_bus <= opc_sig when eobb_opc ='1' else
				tos_sig when eobb_tos ='1' else
				cpp_sig when eobb_cpp ='1' else
				lv_sig when eobb_lv ='1' else
				sp_sig when eobb_sp ='1' else
				address_pc_sig when eobb_pc ='1' else
				uscita_mdr when eobb_mdr ='1' else
				mbr_sig when (eobb_mbr='1' or eobb_mbru='1') else
				x"0F0F0F0F"; --valore di default


--	h:process (ck)
--		variable mem : std_logic_vector(31 downto 0):="00000000000000000000000000000000";  --memoria a 32 bit
--		begin  
--		if (rising_edge(ck)) then  --fronte di salita clock
--			if(wcbtr_h_sig='1')	then
--				h_sig<=c_bus; --memoria	di quanto � sul C bus
--			end if;
--		end if;
--	end process;

	h : posedge_reg_enable 
	generic map(valore_iniziale => x"00000000")
	PORT MAP( 
		ck => ck,
		en => wcbtr_h_sig,
		input_reg => c_bus,
		output_reg => h_sig
	);	
	

	Inst_mbr_register: mbr_register PORT MAP(
		ck => ck,
		eobb_mbr => eobb_mbr,
		eobb_mbru => eobb_mbru,
		ffetch_ritardato => ffetch_ritardato,
		data_mbr => data_mbr,
		uscita_mbr => mbr_sig  -- *****************  dopo mandalo in input ad un mux sul bbus
	);

	fe <= ffetch_ritardato;
	mbr_outoring <= mbr_sig(7 downto 0);  --emette dato letto verso P.C.

--	mbr:process(eobb_mbr,eobb_mbru,ffetch_ritardato,ck,data_mbr)  --processo registro MBR
--	variable mem : std_logic_vector(7 downto 0):="00000000";  --memoria registro
--	begin
--		if(rising_edge(ck))then
--			if(ffetch_ritardato='1')then
--				mem:=data_mbr;  --fetch istruzione
--			end if;
--		end if;
--		fe<=ffetch_ritardato;
--		mbr_outoring<=mem;  --emette dato letto verso P.C.
--		input<=mem;  --emette dato letto verso blocco di estensione segno
--	end process;
--
--
--
--	sign_ext:process (eobb_mbru,eobb_mbr,input)  --processo estensione MBR
--		variable app : std_logic_vector(31 downto 0):=x"00000000";  --appoggio per conversione
--		begin  
--			if (eobb_mbr='1') then  --se eobb ad 1 lo voglio signed
--				if(input(7)='1')then  --se bit di segno ad 1
--					app:=x"FFFFFF00"; --estende con tutti 1 nei byte 3-2-1 			
--				else  --se bit di segno ad 0
--					app:=x"00000000"; --estende con tutti 0 nei byte 3-2-1 			
--				end if;
--				app(7 downto 0):=input; --copia mem nel byte basso
--				b_bus<=app; --emette sul bus B la memoria	estesa a 32 bit signed
--			elsif (eobb_mbru='1') then  --se eobb ad 1 lo voglio unsigned
--				app:=x"00000000";
--				app(7 downto 0):=input;  --copia nel byte basso mem
--				b_bus<=app; --emette sul bus B la memoria	estesa a 32 bit unsigned
--			else
--				b_bus<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"; --altrimenti alta impedenza
--			end if;
--	end process;


	Z<=inpff2_sig;
	N<=inpff1_sig;


	Inst_ALU: ALU PORT MAP(
		A => h_sig,
		B => b_bus,
		INVA => INVA,
		ENA => ENA,
		ENB => ENB,
		F0 => F0,
		F1 => F1,
		INC => INC,
		Output => alushi_sig,
		N => inpff1_sig,
		Z => inpff2_sig
	);	
	
	Inst_neg_edge_reg: neg_edge_reg PORT MAP(  --collego i segnali di 
		input(0) => wcbtr_mdr,	--write C bus to register ad un banco di 
		input(1) => wcbtr_pc, --FF negative edge triggered per sfasarli
		input(2) => wcbtr_h,  --in ritardo di 1/2 periodo in modo
		input(3) => wcbtr_mar,  --che i registri leggano
		input(4) => wcbtr_sp,  --il dato sul fronte di salita successivo
		input(5) => wcbtr_lv, --a quello di discesa corrente
		input(6) => wcbtr_cpp, --cos� come scritto a pag. 234 fig.4-3 Tanenbaum
		input(7) => wcbtr_tos,
		input(8) => wcbtr_opc,
		ck =>ck,
 		output(0) => wcbtr_mdr_sig,
		output(1) => wcbtr_pc_sig,
		output(2) => wcbtr_h_sig,
		output(3) => wcbtr_mar_sig,
		output(4) => wcbtr_sp_sig,
		output(5) => wcbtr_lv_sig,
		output(6) => wcbtr_cpp_sig,
		output(7) => wcbtr_tos_sig,
		output(8) => wcbtr_opc_sig
	);



	
end Behavioral;



