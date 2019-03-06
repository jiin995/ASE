----------------------------------------------------------------------------------
--! Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
--! Engineer: AIELLO MARCO MATR. 045/004437
--! 
--! Create Date:    15:15:18 01/08/2008 
--! Design Name: 
--! Module Name:    control_store - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



package costanti is
--definizione formato della microistruzione della control store
type microinstruction is record  --come a pag. 240 Tanenbaum
	--campo NEXT_ADDRESS
	next_address:std_logic_vector(8 downto 0);
	--campo JAM
	jmpc:std_logic; --segnale jmpc
	jamn:std_logic; --segnale jamn
	jamz:std_logic; --segnale jamz
	--campo ALU
	sll8:std_logic; --segnale sll8
	sra1:std_logic; --segnale sra1
	f0:std_logic; --segnale f0
	f1:std_logic; --segnale f1
	ena:std_logic; --segnale ena
	enb:std_logic; --segnale enb
   	inva:std_logic; --segnale inva
	inc:std_logic; --segnale inc
	--campo C
	h:std_logic; --segnale h
	opc:std_logic; --segnale opc
	tos:std_logic; --segnale tos
	cpp:std_logic; --segnale cpp
	lv:std_logic; --segnale lv
	sp:std_logic; --segnale sp
	pc:std_logic; --segnale pc
	mdr:std_logic; --segnale mdr
	mar:std_logic; --segnale mar
	--campo Mem
	wwrite:std_logic; --segnale write
	rread:std_logic; --segnale read
	fetch:std_logic; --segnale fetch
	b_bus:std_logic_vector(3 downto 0);  --campo B
end record;




--dichiarazione costanti di pilotaggio decoder 4:16 come nella fig.4.5 pag. 240
constant none    :std_logic_vector(3 downto 0):=  x"F";  --seleziona nulla
constant sel_mdr :std_logic_vector(3 downto 0):=  x"0";  --seleziona MDR sul B bus
constant sel_pc  :std_logic_vector(3 downto 0):=  x"1";  --seleziona PC sul B bus
constant sel_mbr :std_logic_vector(3 downto 0):=  x"2";  --seleziona MBR sul B bus
constant sel_mbru:std_logic_vector(3 downto 0):=  x"3";  --seleziona MBRU sul B bus
constant sel_sp  :std_logic_vector(3 downto 0):=  x"4";  --seleziona SP sul B bus
constant sel_lv  :std_logic_vector(3 downto 0):=  x"5";  --seleziona LV sul B bus
constant sel_cpp :std_logic_vector(3 downto 0):=  x"6";  --seleziona CPP sul B bus
constant sel_tos :std_logic_vector(3 downto 0):=  x"7";  --seleziona TOS sul B bus
constant sel_opc :std_logic_vector(3 downto 0):=  x"8";  --seleziona OPC sul B bus





--dichiarazione label della control store
constant main1 :std_logic_vector(8 downto 0):= '0'& x"01"; --indirizzo control store della label main1
constant nop1 :std_logic_vector(8 downto 0):= '0'& x"00"; --indirizzo control store della label nop1
constant bipush1 :std_logic_vector(8 downto 0):= '0'& x"10"; --indirizzo control store della label bipush1
constant ldc_w1 :std_logic_vector(8 downto 0):= '0'& x"13"; --indirizzo control store della label ldc_w1
constant iload1 :std_logic_vector(8 downto 0):= '0'& x"15"; --indirizzo control store della label iload1
constant wide_iload1 :std_logic_vector(8 downto 0):= '1'& x"15"; --indirizzo control store della label wide_iload1
constant istore1 :std_logic_vector(8 downto 0):= '0'& x"36"; --indirizzo control store della label istore1
constant wide_istore1 :std_logic_vector(8 downto 0):= '1'& x"36"; --indirizzo control store della label wide_istore1
constant pop1 :std_logic_vector(8 downto 0):= '0'& x"57"; --indirizzo control store della label pop1
constant dup1 :std_logic_vector(8 downto 0):= '0'& x"59"; --indirizzo control store della label dup1
constant swap1 :std_logic_vector(8 downto 0):= '0'& x"5F"; --indirizzo control store della label swap1
constant iadd1 :std_logic_vector(8 downto 0):= '0'& x"60"; --indirizzo control store della label iadd1
constant isub1 :std_logic_vector(8 downto 0):= '0'& x"64"; --indirizzo control store della label isub1
constant iand1 :std_logic_vector(8 downto 0):= '0'& x"7E"; --indirizzo control store della label iand1
constant iinc1 :std_logic_vector(8 downto 0):= '0'& x"84"; --indirizzo control store della label iinc1
constant ifeq1 :std_logic_vector(8 downto 0):= '0'& x"99"; --indirizzo control store della label ifeq1
constant iflt1 :std_logic_vector(8 downto 0):= '0'& x"9B"; --indirizzo control store della label iflt1
constant if_icmpeq1 :std_logic_vector(8 downto 0):= '0'& x"9F"; --indirizzo control store della label if_icmpeq11
constant goto1 :std_logic_vector(8 downto 0):= '0'& x"A7"; --indirizzo control store della label goto1
constant ireturn1 :std_logic_vector(8 downto 0):= '0'& x"AC"; --indirizzo control store della label ireturn1
constant ior1 :std_logic_vector(8 downto 0):= '0'& x"B0"; --indirizzo control store della label ior1
constant invokevirtual1 :std_logic_vector(8 downto 0):= '0'& x"B6"; --indirizzo control store della label invokevirtual1
constant wide1 :std_logic_vector(8 downto 0):= '0'& x"C4"; --indirizzo control store della label wide1
constant halt1 :std_logic_vector(8 downto 0):= '0'& x"FF"; --indirizzo control store della label halt1
constant err1 :std_logic_vector(8 downto 0):= '0'& x"FE"; --indirizzo control store della label err1



--continuo dichiarazione label della control store (indirizzi successivi)
--istruzione goto
constant goto2 : std_logic_vector(8 downto 0):=  (goto1+1);
constant goto3 : std_logic_vector(8 downto 0):=  (goto1+2);
constant goto4 : std_logic_vector(8 downto 0):=  (goto1+3);
constant goto5 : std_logic_vector(8 downto 0):=  (goto1+4);
constant goto6 : std_logic_vector(8 downto 0):= '0'& x"EF";

--istruzione bipush
constant bipush2 : std_logic_vector(8 downto 0):=  (bipush1+1);
constant bipush3 : std_logic_vector(8 downto 0):=  (bipush1+2);

--istruzione iadd
constant iadd2 : std_logic_vector(8 downto 0):=  (iadd1+1);
constant iadd3 : std_logic_vector(8 downto 0):=  (iadd1+2);

--istruzione isub
constant isub2 : std_logic_vector(8 downto 0):=  (isub1+1);
constant isub3 : std_logic_vector(8 downto 0):=  (isub1+2);

--istruzione iand
constant iand2 : std_logic_vector(8 downto 0):=  (iand1+1);
constant iand3 : std_logic_vector(8 downto 0):=  (iand1+2);

--istruzione ior
constant ior2 : std_logic_vector(8 downto 0):=  (ior1+1);
constant ior3 : std_logic_vector(8 downto 0):=  (ior1+2);

--istruzione dup
constant dup2 : std_logic_vector(8 downto 0):=  (dup1+1);

--istruzione pop
constant pop2 :std_logic_vector(8 downto 0):= '0'& x"58"; 
constant pop3 :std_logic_vector(8 downto 0):= '0'& x"5B";

--istruzione swap
constant swap2 :std_logic_vector(8 downto 0):= '0'& x"20"; 
constant swap3 :std_logic_vector(8 downto 0):= '0'& x"21";
constant swap4 :std_logic_vector(8 downto 0):= '0'& x"22"; 
constant swap5 :std_logic_vector(8 downto 0):= '0'& x"23";
constant swap6 :std_logic_vector(8 downto 0):= '0'& x"24";


--istruzione istore
constant istore2 :std_logic_vector(8 downto 0):= '0'& x"37"; 
constant istore3 :std_logic_vector(8 downto 0):= '0'& x"38";
constant istore4 :std_logic_vector(8 downto 0):= '0'& x"39"; 
constant istore5 :std_logic_vector(8 downto 0):= '0'& x"3A";
constant istore6 :std_logic_vector(8 downto 0):= '0'& x"3B";


--istruzione iload
constant iload2 :std_logic_vector(8 downto 0):= '0'& x"3C"; 
constant iload3 :std_logic_vector(8 downto 0):= '0'& x"3D";
constant iload4 :std_logic_vector(8 downto 0):= '0'& x"3E"; 
constant iload5 :std_logic_vector(8 downto 0):= '0'& x"3F";

--istruzione iinc
constant iinc2 :std_logic_vector(8 downto 0):= '0'& x"85"; 
constant iinc3 :std_logic_vector(8 downto 0):= '0'& x"86";
constant iinc4 :std_logic_vector(8 downto 0):= '0'& x"87"; 
constant iinc5 :std_logic_vector(8 downto 0):= '0'& x"88";
constant iinc6 :std_logic_vector(8 downto 0):= '0'& x"89";

--istruzione ldc_w1
constant ldc_w2 :std_logic_vector(8 downto 0):= '0'& x"02"; 
constant ldc_w3 :std_logic_vector(8 downto 0):= '0'& x"03";
constant ldc_w4 :std_logic_vector(8 downto 0):= '0'& x"04"; 

--istruzione wide
constant wide2 : std_logic_vector(8 downto 0):= '0'& x"C5";
constant wide3 : std_logic_vector(8 downto 0):= '0'& x"C6";

--istruzione wide_iload
constant wide_iload2 :std_logic_vector(8 downto 0):= '1'& x"16"; 
constant wide_iload3 :std_logic_vector(8 downto 0):= '1'& x"17";
constant wide_iload4 :std_logic_vector(8 downto 0):= '1'& x"18"; 

--istruzione wide_istore
constant wide_istore2 :std_logic_vector(8 downto 0):= '1'& x"37"; 
constant wide_istore3 :std_logic_vector(8 downto 0):= '1'& x"38";
constant wide_istore4 :std_logic_vector(8 downto 0):= '1'& x"39"; 

--costante per or 0x100
constant cento :std_logic_vector(8 downto 0):= '1'& x"00"; 

--istruzione iflt
constant iflt2 :std_logic_vector(8 downto 0):= '0'& x"40"; 
constant iflt3 :std_logic_vector(8 downto 0):= '0'& x"41";
constant iflt4 :std_logic_vector(8 downto 0):= '0'& x"42"; 

--istruzione T
constant t :std_logic_vector(8 downto 0):= '1'& x"43"; 
constant f :std_logic_vector(8 downto 0):= '0'& x"43";
constant f2 :std_logic_vector(8 downto 0):= '0'& x"44"; 
constant f3 :std_logic_vector(8 downto 0):= '0'& x"45";

--istruzione ifeq
constant ifeq2 :std_logic_vector(8 downto 0):= '0'& x"46"; 
constant ifeq3 :std_logic_vector(8 downto 0):= '0'& x"47";
constant ifeq4 :std_logic_vector(8 downto 0):= '0'& x"48"; 

--istruzione if_icmpeq
constant if_icmpeq2 :std_logic_vector(8 downto 0):= '0'& x"49"; 
constant if_icmpeq3 :std_logic_vector(8 downto 0):= '0'& x"4A";
constant if_icmpeq4 :std_logic_vector(8 downto 0):= '0'& x"4B"; 
constant if_icmpeq5 :std_logic_vector(8 downto 0):= '0'& x"4C";
constant if_icmpeq6 :std_logic_vector(8 downto 0):= '0'& x"4D"; 

--istruzione invokevirtual
constant invokevirtual1bis :std_logic_vector(8 downto 0):= '0'& x"EE"; 
constant invokevirtual2 :std_logic_vector(8 downto 0):= '0'& x"D0"; 
constant invokevirtual3 :std_logic_vector(8 downto 0):= '0'& x"D1"; 
constant invokevirtual4 :std_logic_vector(8 downto 0):= '0'& x"D2"; 
constant invokevirtual5 :std_logic_vector(8 downto 0):= '0'& x"D3"; 
constant invokevirtual6 :std_logic_vector(8 downto 0):= '0'& x"D4"; 
constant invokevirtual6bis :std_logic_vector(8 downto 0):= '0'& x"EC"; 
constant invokevirtual7 :std_logic_vector(8 downto 0):= '0'& x"D5"; 
constant invokevirtual8 :std_logic_vector(8 downto 0):= '0'& x"D6"; 
constant invokevirtual9 :std_logic_vector(8 downto 0):= '0'& x"D7"; 
constant invokevirtual10 :std_logic_vector(8 downto 0):= '0'& x"D8"; 
constant invokevirtual11 :std_logic_vector(8 downto 0):= '0'& x"D9"; 
constant invokevirtual12 :std_logic_vector(8 downto 0):= '0'& x"DA"; 
constant invokevirtual13 :std_logic_vector(8 downto 0):= '0'& x"DB"; 
constant invokevirtual14 :std_logic_vector(8 downto 0):= '0'& x"DC"; 
constant invokevirtual15 :std_logic_vector(8 downto 0):= '0'& x"DD"; 
constant invokevirtual16 :std_logic_vector(8 downto 0):= '0'& x"DE"; 
constant invokevirtual17 :std_logic_vector(8 downto 0):= '0'& x"DF"; 
constant invokevirtual18 :std_logic_vector(8 downto 0):= '0'& x"E0"; 
constant invokevirtual19 :std_logic_vector(8 downto 0):= '0'& x"E1"; 
constant invokevirtual20 :std_logic_vector(8 downto 0):= '0'& x"E2"; 
constant invokevirtual21 :std_logic_vector(8 downto 0):= '0'& x"E3"; 
constant invokevirtual22 :std_logic_vector(8 downto 0):= '0'& x"E4"; 

--istruzione ireturn
constant ireturn2 :std_logic_vector(8 downto 0):= '0'& x"E5"; 
constant ireturn3 :std_logic_vector(8 downto 0):= '0'& x"E6"; 
constant ireturn4 :std_logic_vector(8 downto 0):= '0'& x"E7"; 
constant ireturn5 :std_logic_vector(8 downto 0):= '0'& x"E8"; 
constant ireturn6 :std_logic_vector(8 downto 0):= '0'& x"E9"; 
constant ireturn7 :std_logic_vector(8 downto 0):= '0'& x"EA"; 
constant ireturn8 :std_logic_vector(8 downto 0):= '0'& x"EB"; 


--istruzione in
constant in1 :std_logic_vector(8 downto 0):= '0'& x"FC"; 
constant in2 :std_logic_vector(8 downto 0):= '1'& x"00"; 
constant in3 :std_logic_vector(8 downto 0):= '1'& x"01"; 
constant in4 :std_logic_vector(8 downto 0):= '1'& x"02"; 
constant in5 :std_logic_vector(8 downto 0):= '1'& x"03"; 

--istruzione out
constant out1 :std_logic_vector(8 downto 0):= '0'& x"FD"; 
constant out2 :std_logic_vector(8 downto 0):= '1'& x"07"; 
constant out3 :std_logic_vector(8 downto 0):= '1'& x"08"; 
constant out4 :std_logic_vector(8 downto 0):= '1'& x"09"; 
constant out5 :std_logic_vector(8 downto 0):= '1'& x"0A"; 
constant out6 :std_logic_vector(8 downto 0):= '1'& x"04"; 
constant out7 :std_logic_vector(8 downto 0):= '1'& x"05"; 
constant out8 :std_logic_vector(8 downto 0):= '1'& x"06"; 
constant out9 :std_logic_vector(8 downto 0):= '0'& x"A5"; 
constant out10 :std_logic_vector(8 downto 0):= '1'& x"A5"; 


--dichiarazione contenuto microistruzioni a pag.262 - 263 Tanenbaum

--contenuto altre locazioni :ALU=pass through e decoder del B bus non seleziona niente
--constant microistruzione_tutti_zeri : microinstruction := (
--	next_address =>main1,
--	jmpc =>'0',
--	jamn =>'0',
--	jamz =>'0',
--	sll8 =>'0',
--	sra1 =>'0',
--	f0 =>'0',
--	f1 =>'1',
--	ena =>'0',
--	enb =>'1',
--	inva =>'0',
--	inc =>'0',  --pass through di B
--	h =>'0',
--	opc =>'0',
--	tos =>'0',
--	cpp =>'0',
--	lv =>'0',
--	sp =>'0',
--	pc =>'0',
--	mdr =>'0',
--	mar =>'0',
--	wwrite =>'0',
--	rread =>'0',
--	fetch =>'0',
--	b_bus =>none
--);
constant microistruzione_tutti_zeri : microinstruction := (
	next_address =>"---------",			--//inizializza al valore don't care
	jmpc =>'-',
	jamn =>'-',
	jamz =>'-',
	sll8 =>'-',
	sra1 =>'-',
	f0 =>'-',
	f1 =>'-',
	ena =>'-',
	enb =>'-',
	inva =>'-',
	inc =>'-',  --pass through di B
	h =>'-',
	opc =>'-',
	tos =>'-',
	cpp =>'-',
	lv =>'-',
	sp =>'-',
	pc =>'-',
	mdr =>'-',
	mar =>'-',
	wwrite =>'-',
	rread =>'-',
	fetch =>'-',
	b_bus =>none
);


--nop1
constant microistruzione_nop1 : microinstruction := (
	next_address =>main1,  	--goto Main1	(NOP consente l'acquisizione del nuovo codice operativo in MBR
							--! lanciato con il fetch di main1 predentemente
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',

	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --> abilita bus B, ma non passa niente in quanto i reg sono tutti disabilitati
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',

	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',

	wwrite =>'0',
	rread =>'0',
	fetch =>'0',

	b_bus =>none  --B-bus non fa niente
);


--main1
constant microistruzione_main1 : microinstruction := (
	next_address =>nop1,  --goto Main1
	jmpc =>'1',--! goto (MBR)
	jamn =>'0',
	jamz =>'0',

	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 è abilitato PC, per cui B = PC e quindi esegue PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',

	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sul B-bus e fa perciò PC=PC+1
	mdr =>'0',
	mar =>'0',

	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch al nuovo indirizzo in PC

	b_bus =>sel_pc  --PC sul B-bus 
);


--goto1
constant microistruzione_goto1 : microinstruction := (
	next_address =>goto2,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',  --l'ALU fa B - 1
	h =>'0',
	opc =>'1', --seleziona OPC per avere OPC=OPC-1
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_pc  --PC sul B-bus
);

--goto2
constant microistruzione_goto2 : microinstruction := (
	next_address =>goto3,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);


--goto3
constant microistruzione_goto3 : microinstruction := (
	next_address =>goto4,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBR<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBR<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbr  --MBR sul B-bus 
);

--goto4
constant microistruzione_goto4 : microinstruction := (
	next_address =>goto5,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);


--goto5
constant microistruzione_goto5 : microinstruction := (
	next_address =>goto6,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = A + B ( fa OPC+H )
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=OPC+H
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_opc  --OPC sul B-bus 
);


--goto6
constant microistruzione_goto6 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none  --B-bus non fa niente
);


--bipush1
constant microistruzione_bipush1 : microinstruction := (
	next_address =>bipush2,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',

	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = SP e quindi fa SP+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',

	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP+1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP+1

	wwrite =>'0',
	rread =>'0',
	fetch =>'0',

	b_bus =>sel_sp  --SP sul B-bus 
);

--bipush2
constant microistruzione_bipush2 : microinstruction := (
	next_address =>bipush3,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--bipush3
constant microistruzione_bipush3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MBR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=TOS=MBR
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbr  --MBR sul B-bus 
);

--iadd1
constant microistruzione_iadd1 : microinstruction := (
	next_address =>iadd2,  --goto iadd2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--iadd2
constant microistruzione_iadd2 : microinstruction := (
	next_address =>iadd3,  --goto iadd3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=TOS
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--iadd3
constant microistruzione_iadd3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = A + B e quindi fa H + B = H + MDR
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=TOS=MDR+H
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);


--isub1
constant microistruzione_isub1 : microinstruction := (
	next_address =>isub2,  --goto isub2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--isub2
constant microistruzione_isub2 : microinstruction := (
	next_address =>isub3,  --goto isub3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=TOS
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--isub3
constant microistruzione_isub3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = A - B e quindi fa H - B = H - MDR
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'1',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=TOS=MDR-H
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--iand1
constant microistruzione_iand1 : microinstruction := (
	next_address =>iand2,  --goto isub2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--iand2
constant microistruzione_iand2 : microinstruction := (
	next_address =>iand3,  --goto iand3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=TOS
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--iand3
constant microistruzione_iand3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = A AND B e quindi fa H AND B = H AND MDR
	f1 =>'0',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=TOS=MDR AND H
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--ior1
constant microistruzione_ior1 : microinstruction := (
	next_address =>ior2,  --goto ior2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--ior2
constant microistruzione_ior2 : microinstruction := (
	next_address =>ior3,  --goto ior3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=TOS
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--ior3
constant microistruzione_ior3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = A OR B e quindi fa H AND B = H OR MDR
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=TOS=MDR AND H
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--dup1
constant microistruzione_dup1 : microinstruction := (
	next_address =>dup2,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = SP e quindi fa SP+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP+1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP+1
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--dup2
constant microistruzione_dup2 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=TOS
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus 
);

--pop1
constant microistruzione_pop1 : microinstruction := (
	next_address =>pop2,  --goto pop2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--pop2
constant microistruzione_pop2 : microinstruction := (
	next_address =>pop3,   --goto pop3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);

--pop3
constant microistruzione_pop3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--swap1
constant microistruzione_swap1 : microinstruction := (
	next_address =>swap2,  --goto swap2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);


--swap2
constant microistruzione_swap2 : microinstruction := (
	next_address =>swap3,  --goto swap3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus
);


--swap3
constant microistruzione_swap3 : microinstruction := (
	next_address =>swap4,  --goto swap4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=MDR
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'1',  --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--swap4
constant microistruzione_swap4 : microinstruction := (
	next_address =>swap5,  --goto swap6
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP-1
--	wwrite =>'1', --write
	wwrite =>'0',
	rread =>'0',  
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);


--swap5
constant microistruzione_swap5 : microinstruction := (
	next_address =>swap6,  --goto swap3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',--! abilita MDR sull'A-bus e fa perci� MDR=TOS
	mar =>'0',
--	wwrite =>'0',
	wwrite =>'1',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --SP sul B-bus
);


--swap6
constant microistruzione_swap6 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = A = H
	f1 =>'1',
	ena =>'1',
	enb =>'0',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=H
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none  --niente sul B-bus 
);

--istore1
constant microistruzione_istore1 : microinstruction := (
	next_address =>istore2,  --goto istore2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=LV
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus
);


--istore2
constant microistruzione_istore2 : microinstruction := (
	next_address =>istore3,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = MBRU e quindi fa MBRU+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=MBRU+H
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--istore3
constant microistruzione_istore3 : microinstruction := (
	next_address =>istore4,  --goto istore4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',--! abilita MDR sull'A-bus e fa perci� MDR=TOS
	mar =>'0',
	wwrite =>'1',  --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--istore4
constant microistruzione_istore4 : microinstruction := (
	next_address =>istore5,  --goto istore5
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--istore5
constant microistruzione_istore5 : microinstruction := (
	next_address =>istore6,    --goto istore6
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--istore6
constant microistruzione_istore6 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--iload1
constant microistruzione_iload1 : microinstruction := (
	next_address =>iload2,  --goto iload2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=LV
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
--	rread =>'1',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus
);

--iload2
constant microistruzione_iload2 : microinstruction := (
	next_address =>iload3,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = MBRU e quindi fa MBRU+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=MBRU+H
	wwrite =>'0',
	rread =>'1',--read
--	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--iload3
constant microistruzione_iload3 : microinstruction := (
	next_address =>iload4,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = SP e quindi fa SP+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP+1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP+1
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--iload4
constant microistruzione_iload4 : microinstruction := (
	next_address =>iload5,    --goto iload5
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'1',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--iload5
constant microistruzione_iload5 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--iinc1
constant microistruzione_iinc1 : microinstruction := (
	next_address =>iinc2,  --goto iinc2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=LV
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
--	rread =>'1',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus
);

--iinc2
constant microistruzione_iinc2 : microinstruction := (
	next_address =>iinc3,  --goto iinc3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = MBRU e quindi fa MBRU+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=MBRU+H
	wwrite =>'0',
	rread =>'1',--read
--	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--iinc3
constant microistruzione_iinc3 : microinstruction := (
	next_address =>iinc4,    --goto iinc4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--iinc4
constant microistruzione_iinc4 : microinstruction := (
	next_address =>iinc5,  --goto iinc2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=MDR
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
--	rread =>'1',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--iinc5
constant microistruzione_iinc5 : microinstruction := (
	next_address =>iinc6,    --goto iinc4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--iinc6
constant microistruzione_iinc6 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = A + B e quindi fa H + B = H + MBR
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=MBR+H
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbr  --MBR sul B-bus 
);

--ldc_w1
constant microistruzione_ldc_w1 : microinstruction := (
	next_address =>ldc_w2,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);


--ldc_w2
constant microistruzione_ldc_w2 : microinstruction := (
	next_address =>ldc_w3,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBRU<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBRU<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

----ldc_w3
--constant microistruzione_ldc_w3 : microinstruction := (
--	next_address =>ldc_w4,
--	jmpc =>'0',
--	jamn =>'0',
--	jamz =>'0',
--	sll8 =>'0',
--	sra1 =>'0',
--	f0 =>'0',
--	f1 =>'1',
--	ena =>'1',
--	enb =>'1',
--	inva =>'0',
--	inc =>'0',  --ALU fa A OR B
--	h =>'1',  --abilita H su A bus H=MBRU or H
--	opc =>'0',
--	tos =>'0',
--	cpp =>'0',
--	lv =>'0',
--	sp =>'0',
--	pc =>'0',
--	mdr =>'0',
--	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=CPP+H,
--	wwrite =>'0',
--	rread =>'0',
--	fetch =>'0',
--	b_bus =>sel_mbru  --MBRU sul B-bus 
--);
--
----ldc_w4
--constant microistruzione_ldc_w4 : microinstruction := (
--	next_address =>iload3,  --goto iload3
--	jmpc =>'0',
--	jamn =>'0',
--	jamz =>'0',
--	sll8 =>'0',
--	sra1 =>'0',
--	f0 =>'1', --ALU = B + A (B = MBRU e quindi fa MBRU+H)
--	f1 =>'1',
--	ena =>'1',
--	enb =>'1',
--	inva =>'0',
--	inc =>'0',
--	h =>'0',
--	opc =>'0',
--	tos =>'0',
--	cpp =>'0',
--	lv =>'0',
--	sp =>'0',
--	pc =>'0',
--	mdr =>'0',
--	mar =>'0',
--	wwrite =>'0',
--	rread =>'1',--read
--	fetch =>'0',
--	b_bus =>sel_cpp  --CPP sul B-bus 
--);


--ldc_w3
constant microistruzione_ldc_w3 : microinstruction := (
	next_address =>ldc_w4,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--ldc_w4
constant microistruzione_ldc_w4 : microinstruction := (
	next_address =>iload3,  --goto iload3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = MBRU e quindi fa MBRU+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=CPP+H
	wwrite =>'0',
	rread =>'1',--read
	fetch =>'0',
	b_bus =>sel_cpp  --CPP sul B-bus 
);

--wide1
constant microistruzione_wide1 : microinstruction := (
	next_address =>wide2,   --goto wide1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);


--wide2
constant microistruzione_wide2 : microinstruction := (
	next_address =>wide3,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--wide3
constant microistruzione_wide3 : microinstruction := (
	next_address =>cento,  --aggiunta per
	jmpc =>'1',--! goto (MBR OR 0x100)
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B 
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none  --niente sul B-bus 
);

--wide_iload1
constant microistruzione_wideiload1 : microinstruction := (
	next_address =>wide_iload2,  --goto wide_iload2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--wide_iload2
constant microistruzione_wideiload2 : microinstruction := (
	next_address =>wide_iload3,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBRU<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBRU<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);


constant microistruzione_wideiload3 : microinstruction := (
	next_address =>wide_iload4,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--wide_iload4
constant microistruzione_wideiload4 : microinstruction := (
	next_address =>iload3,  --goto iload3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = LV e quindi fa LV+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=CPP+H
	wwrite =>'0',
	rread =>'1',--read
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus 
);








--wide_istore1
constant microistruzione_wideistore1 : microinstruction := (
	next_address =>wide_istore2,  --goto wide_istore2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--wide_istore2
constant microistruzione_wideistore2 : microinstruction := (
	next_address =>wide_istore3,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBRU<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBRU<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);


constant microistruzione_wideistore3 : microinstruction := (
	next_address =>wide_istore4,
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--wide_istore4
constant microistruzione_wideistore4 : microinstruction := (
	next_address =>istore3,  --goto istore3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = LV e quindi fa LV+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=CPP+H
	wwrite =>'0',
	rread =>'1',--read
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus 
);

--iflt1
constant microistruzione_iflt1 : microinstruction := (
	next_address =>iflt2,  --goto iflt2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--iflt2
constant microistruzione_iflt2 : microinstruction := (
	next_address =>iflt3,  --goto iflt3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=TOS
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--iflt3
constant microistruzione_iflt3 : microinstruction := (
	next_address =>iflt4,  --goto iflt4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',--! abilita OPC sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--iflt4
constant microistruzione_iflt4 : microinstruction := (
	next_address =>f,  --if N=0 goto f (0x43)
	jmpc =>'0',
	jamn =>'1',--if N=1 goto f or 0x100 ossia a T (0x143)
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus
);


--t
constant microistruzione_t : microinstruction := (
	next_address =>goto2,  --goto goto2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',  --l'ALU fa B - 1
	h =>'0',
	opc =>'1', --seleziona OPC per avere OPC=OPC-1
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_pc  --PC sul B-bus
);

--f
constant microistruzione_f : microinstruction := (
	next_address =>f2,  --goto f2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',  
	b_bus =>sel_pc  --PC sul B-bus 
);

--f2
constant microistruzione_f2 : microinstruction := (
	next_address =>f3,  --goto f3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--f3
constant microistruzione_f3 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none  --B-bus non fa niente
);

--ifeq1
constant microistruzione_ifeq1 : microinstruction := (
	next_address =>ifeq2,  --goto ifeq2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--ifeq2
constant microistruzione_ifeq2 : microinstruction := (
	next_address =>ifeq3,  --goto ifeq3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=TOS
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--ifeq3
constant microistruzione_ifeq3 : microinstruction := (
	next_address =>ifeq4,  --goto ifeq4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',--! abilita OPC sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--ifeq4
constant microistruzione_ifeq4 : microinstruction := (
	next_address =>f,  --if Z=0 goto f (0x43)
	jmpc =>'0',
	jamn =>'0',
	jamz =>'1',--if Z=1 goto f or 0x100 ossia a T (0x143)
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus
);

--if_icmpeq1
constant microistruzione_if_icmpeq1 : microinstruction := (
	next_address =>if_icmpeq2,  --goto if_icmpeq2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--if_icmpeq2
constant microistruzione_if_icmpeq2 : microinstruction := (
	next_address =>if_icmpeq3,  --goto if_icmpeq3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',
	rread =>'0', 
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--if_icmpeq3
constant microistruzione_if_icmpeq3 : microinstruction := (
	next_address =>if_icmpeq4,  --goto if_icmpeq4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'1',--! abilita H sull'A-bus e fa perci� H=MDR
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',  
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);



--if_icmpeq4
constant microistruzione_if_icmpeq4 : microinstruction := (
	next_address =>if_icmpeq5,  --goto if_icmpeq5
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=TOS
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus
);

--if_icmpeq5
constant microistruzione_if_icmpeq5 : microinstruction := (
	next_address =>if_icmpeq6,  --goto if_icmpeq6
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',--! abilita OPC sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--if_icmpeq6
constant microistruzione_if_icmpeq6 : microinstruction := (
	next_address =>f,  --if Z=0 goto f (0x43)
	jmpc =>'0',
	jamn =>'0',
	jamz =>'1',--if Z=1 goto f or 0x100 ossia a T (0x143)
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - A = OPC - H
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'1',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus
);




--invokevirtual1
constant microistruzione_invokevirtual1 : microinstruction := (
	next_address =>invokevirtual1bis,   --goto invokevirtual1bis
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);


--invokevirtual1bis
constant microistruzione_invokevirtual1bis : microinstruction := (
	next_address =>invokevirtual2,  --goto invokevirtual2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);


--invokevirtual2
constant microistruzione_invokevirtual2 : microinstruction := (
	next_address =>invokevirtual3, --goto invokevirtual3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBRU<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBRU<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--invokevirtual3
constant microistruzione_invokevirtual3 : microinstruction := (
	next_address =>invokevirtual4,  --goto invokevirtual4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--invokevirtual4
constant microistruzione_invokevirtual4 : microinstruction := (
	next_address =>invokevirtual5,  --goto invokevirtual5
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = CPP e quindi fa CPP+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=CPP+H
	wwrite =>'0',
	rread =>'1',--read
	fetch =>'0',
	b_bus =>sel_cpp  --CPP sul B-bus 
);

--invokevirtual5
constant microistruzione_invokevirtual5 : microinstruction := (
	next_address =>invokevirtual6,  --goto invokevirtual6
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=PC+1
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',  
	b_bus =>sel_pc  --PC sul B-bus 
);

--invokevirtual6
constant microistruzione_invokevirtual6 : microinstruction := (
	next_address =>invokevirtual6bis,  --goto invokevirtual6bis
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=MDR
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',  
	rread =>'0',
	fetch =>'1', --fetch
	b_bus =>sel_mdr  --MDR sul B-bus
);

--invokevirtual6bis
constant microistruzione_invokevirtual6bis : microinstruction := (
	next_address =>invokevirtual7,   --goto invokevirtual7
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);


--invokevirtual7
constant microistruzione_invokevirtual7 : microinstruction := (
	next_address =>invokevirtual8,  --goto invokevirtual8
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--invokevirtual8
constant microistruzione_invokevirtual8 : microinstruction := (
	next_address =>invokevirtual9, --goto invokevirtual9
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBRU<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBRU<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--invokevirtual9
constant microistruzione_invokevirtual9 : microinstruction := (
	next_address =>invokevirtual10,  --goto invokevirtual4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--invokevirtual10
constant microistruzione_invokevirtual10 : microinstruction := (
	next_address =>invokevirtual11,  --goto invokevirtual11
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--invokevirtual11
constant microistruzione_invokevirtual11 : microinstruction := (
	next_address =>invokevirtual12,  --goto invokevirtual12
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - A = SP - H
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'1',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'1',--! abilita TOS sull'A-bus e fa perci� TOS=SP-H
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus
);

--invokevirtual12
constant microistruzione_invokevirtual12 : microinstruction := (
	next_address =>invokevirtual13,  --goto invokevirtual13
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'1',--! abilita TOS sull'A-bus e fa perci� TOS=MAR=TOS+1
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� TOS=MAR=TOS+1
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',  
	b_bus =>sel_tos  --TOS sul B-bus 
);

--invokevirtual13
constant microistruzione_invokevirtual13 : microinstruction := (
	next_address =>invokevirtual14,  --goto invokevirtual14
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--invokevirtual14
constant microistruzione_invokevirtual14 : microinstruction := (
	next_address =>invokevirtual15, --goto invokevirtual15
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'1',  --shift di 8 e quindi fa H=MBRU<<8
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'1',  --abilita H su A bus H=MBRU<<8
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--invokevirtual15
constant microistruzione_invokevirtual15 : microinstruction := (
	next_address =>invokevirtual16,  --goto invokevirtual16
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --ALU fa A OR B
	h =>'1',  --abilita H su A bus H=MBRU or H
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mbru  --MBRU sul B-bus 
);

--invokevirtual16
constant microistruzione_invokevirtual16 : microinstruction := (
	next_address =>invokevirtual17,  --goto invokevirtual17
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = A + B + 1 (B = SP e quindi fa SP+H+1)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',--! abilita SP sull'A-bus e fa perci� MDR=SP+H+1
	mar =>'0',
	wwrite =>'1', --write
	rread =>'0',
	fetch =>'0',  
	b_bus =>sel_sp  --SP sul B-bus 
);

--invokevirtual17
constant microistruzione_invokevirtual17 : microinstruction := (
	next_address =>invokevirtual18,  --goto invokevirtual18
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita MDR sull'A-bus e fa perci� MAR=SP=MDR
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MDR sull'A-bus e fa perci� MAR=SP=MDR
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--invokevirtual18
constant microistruzione_invokevirtual18 : microinstruction := (
	next_address =>invokevirtual19,  --goto invokevirtual19
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',  --abilita MDR sull'A-bus e fa perci� MDR=OPC
	mar =>'0',
	wwrite =>'1',   --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus 
);

--invokevirtual19
constant microistruzione_invokevirtual19 : microinstruction := (
	next_address =>invokevirtual20,  --goto invokevirtual20  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = SP e quindi fa SP+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP+1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP+1
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--invokevirtual20
constant microistruzione_invokevirtual20 : microinstruction := (
	next_address =>invokevirtual21,  --goto invokevirtual21
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1',--! abilita MDR sull'A-bus e fa perci� MDR=LV
	mar =>'0',
	wwrite =>'1',  --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus
);

--invokevirtual21
constant microistruzione_invokevirtual21 : microinstruction := (
	next_address =>invokevirtual22,  --goto invokevirtual22
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = PC e quindi fa PC+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=PC+1
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'1',  --fetch
	b_bus =>sel_pc  --PC sul B-bus 
);

--invokevirtual22
constant microistruzione_invokevirtual22 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'1',  --abilita TOS sull'A-bus e fa perci� LV=TOS
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus 
);

--ireturn1
constant microistruzione_ireturn1 : microinstruction := (
	next_address =>ireturn2,  --goto ireturn2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� MAR=SP=LV
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=LV
	wwrite =>'0', 
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus
);

--ireturn2
constant microistruzione_ireturn2 : microinstruction := (
	next_address =>ireturn3,   --goto ireturn3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);

--ireturn3
constant microistruzione_ireturn3 : microinstruction := (
	next_address =>ireturn4,  --goto ireturn4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'1',--! abilita SP sull'A-bus e fa perci� MAR=LV=MDR
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=LV=MDR
	wwrite =>'0', 
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus
);

--ireturn4
constant microistruzione_ireturn4 : microinstruction := (
	next_address =>ireturn5,  --goto ireturn5  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = SP e quindi fa LV+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=LV+1
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_lv  --LV sul B-bus 
);

--ireturn5
constant microistruzione_ireturn5 : microinstruction := (
	next_address =>ireturn6,  --goto ireturn6
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'1',--! abilita PC sull'A-bus e fa perci� PC=MDR
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',  
	rread =>'1',  --read
	fetch =>'1',  --fetch
	b_bus =>sel_mdr  --MDR sul B-bus
);

--ireturn6
constant microistruzione_ireturn6 : microinstruction := (
	next_address =>ireturn7,  --goto ireturn7
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP
	wwrite =>'0',  
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus
);

--ireturn7
constant microistruzione_ireturn7 : microinstruction := (
	next_address =>ireturn8,  --goto ireturn8
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'1',  --abilita TOS sull'A-bus e fa perci� LV=MDR
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--ireturn8
constant microistruzione_ireturn8 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0', 
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1', --abilita TOS sull'A-bus e fa perci� MDR=TOS
	mar =>'0',
	wwrite =>'1',  --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus 
);

--out1  
constant microistruzione_out1 : microinstruction := (
	next_address =>out2,  --goto out2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',

	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = -1
	f1 =>'1',
	ena =>'0',
	enb =>'0',
	inva =>'1',
	inc =>'0',

	h =>'1', --abilita -1 sul B-bus e fa perciò H=-1
	opc =>'1', --abilita -1 sul B-bus e fa perciò OPC=H=-1
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',

	wwrite =>'0',
	rread =>'0',
	fetch =>'0',

	b_bus =>none  --B-bus non fa niente
);

--out2  
constant microistruzione_out2: microinstruction := (
	next_address =>out3,  --goto out3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = OPC e quindi fa OPC+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perciò OPC=OPC+H
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus 
);

--out3  
constant microistruzione_out3 : microinstruction := (
	next_address =>out4,  --goto out4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = OPC e quindi fa OPC+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita OPC sull'A-bus e fa perciò MAR=OPC+H
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus 
);

--out4  
constant microistruzione_out4 : microinstruction := (
	next_address =>out5,  --goto out5
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0', 
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'1', --abilita TOS sull'A-bus e fa perci� MDR=TOS
	mar =>'0',
	wwrite =>'1',  --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_tos  --TOS sul B-bus 
);

--out5  
constant microistruzione_out5 : microinstruction := (
	next_address =>out6,   --goto out6
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);


--out6  
constant microistruzione_out6 : microinstruction := (
	next_address =>out7,  --goto out7
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 (B = SP e quindi fa SP-1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perci� SP=SP-1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perci� MAR=SP=SP-1
	wwrite =>'0',  --write
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--out7  
constant microistruzione_out7 : microinstruction := (
	next_address =>out8,   --goto out8
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0',
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',  --pass through di B
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none
);

--out8
constant microistruzione_out8 : microinstruction := (
	next_address =>out9,  --goto out9
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=CPP
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_CPP  --CPP sul B-bus
);

--out9
constant microistruzione_out9 : microinstruction := (
	next_address =>out9,  --if Z=0 goto out9 (0xA5)
	jmpc =>'0',
	jamn =>'0',
	jamz =>'1',--if Z=1 goto out9 or 0x100 ossia a out10 (0x1A5)
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B - 1 
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'1',
	inc =>'0',
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=OPC-1
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus
);


--out10
constant microistruzione_out10 : microinstruction := (
	next_address =>Main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perci� TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);

--in1
constant microistruzione_in1 : microinstruction := (
	next_address =>in2,  --goto in2
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',

	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = -1
	f1 =>'1',
	ena =>'0',
	enb =>'0',
	inva =>'1',
	inc =>'0',

	h =>'1', --abilita -1 sul B-bus e fa perci� H=-1
	opc =>'1', --abilita -1 sul B-bus e fa perci� OPC=H=-1
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',

	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>none  --B-bus non fa niente
);

--in2
constant microistruzione_in2 : microinstruction := (
	next_address =>in3,  --goto in3
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',

	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = OPC e quindi fa OPC+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	
	h =>'0',
	opc =>'1',--! abilita OPC sull'A-bus e fa perci� OPC=OPC+H
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus 
);

--in3
constant microistruzione_in3 : microinstruction := (
	next_address =>in4,  --goto in4
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + A (B = OPC e quindi fa OPC+H)
	f1 =>'1',
	ena =>'1',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita OPC sull'A-bus e fa perciò MAR=OPC+H
	wwrite =>'0',
	rread =>'1',  --read
	fetch =>'0',
	b_bus =>sel_opc  --OPC sul B-bus 
);

--in4
constant microistruzione_in4 : microinstruction := (
	next_address =>in5,  
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'1', --ALU = B + 1 (B = SP e quindi fa SP+1)
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'1',
	h =>'0',
	opc =>'0',
	tos =>'0',
	cpp =>'0',
	lv =>'0',
	sp =>'1',--! abilita SP sull'A-bus e fa perciò SP=SP+1
	pc =>'0',
	mdr =>'0',
	mar =>'1',--! abilita MAR sull'A-bus e fa perciò MAR=SP=SP+1
	wwrite =>'0',
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_sp  --SP sul B-bus 
);

--in5
constant microistruzione_in5 : microinstruction := (
	next_address =>main1,  --goto Main1
	jmpc =>'0',
	jamn =>'0',
	jamz =>'0',
	sll8 =>'0',
	sra1 =>'0',
	f0 =>'0', --ALU = B
	f1 =>'1',
	ena =>'0',
	enb =>'1',
	inva =>'0',
	inc =>'0',
	h =>'0',
	opc =>'0',
	tos =>'1',  --abilita TOS sull'A-bus e fa perciò TOS=MDR
	cpp =>'0',
	lv =>'0',
	sp =>'0',
	pc =>'0',
	mdr =>'0',
	mar =>'0',
	wwrite =>'1',  --write
	rread =>'0',
	fetch =>'0',
	b_bus =>sel_mdr  --MDR sul B-bus 
);


end costanti;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.costanti.all;



----! Uncomment the following library declaration if instantiating
----! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_store is
port(
	addr:in std_logic_vector(8 downto 0);  --ingressi indirizzo 
	mir:out microinstruction:=microistruzione_tutti_zeri  --uscita control store
);
end control_store;

architecture Behavioral of control_store is


begin
controlstore:process(addr) --processo per la control store
begin
	case addr is
		when main1 => mir<= microistruzione_main1;
		when nop1 => mir<= microistruzione_nop1;
		when goto1 => mir<= microistruzione_goto1;		
		when goto2 => mir<= microistruzione_goto2;		
		when goto3 => mir<= microistruzione_goto3;		
		when goto4 => mir<= microistruzione_goto4;		
		when goto5 => mir<= microistruzione_goto5;		
		when goto6 => mir<= microistruzione_goto6;		
		when bipush1 => mir<= microistruzione_bipush1;		
		when bipush2 => mir<= microistruzione_bipush2;		
		when bipush3 => mir<= microistruzione_bipush3;
		when iadd1 => mir<= microistruzione_iadd1;		
		when iadd2 => mir<= microistruzione_iadd2;		
		when iadd3 => mir<= microistruzione_iadd3;
		when isub1 => mir<= microistruzione_isub1;		
		when isub2 => mir<= microistruzione_isub2;		
		when isub3 => mir<= microistruzione_isub3;
		when iand1 => mir<= microistruzione_iand1;		
		when iand2 => mir<= microistruzione_iand2;		
		when iand3 => mir<= microistruzione_iand3;
		when ior1 => mir<= microistruzione_ior1;		
		when ior2 => mir<= microistruzione_ior2;		
		when ior3 => mir<= microistruzione_ior3;
		when dup1 => mir<= microistruzione_dup1;		
		when dup2 => mir<= microistruzione_dup2;
		when pop1 => mir<= microistruzione_pop1;		
		when pop2 => mir<= microistruzione_pop2;		
		when pop3 => mir<= microistruzione_pop3;
		when swap1 => mir<= microistruzione_swap1;		
		when swap2 => mir<= microistruzione_swap2;		
		when swap3 => mir<= microistruzione_swap3;
		when swap4 => mir<= microistruzione_swap4;		
		when swap5 => mir<= microistruzione_swap5;		
		when swap6 => mir<= microistruzione_swap6;
		when istore1 => mir<= microistruzione_istore1;		
		when istore2 => mir<= microistruzione_istore2;		
		when istore3 => mir<= microistruzione_istore3;
		when istore4 => mir<= microistruzione_istore4;		
		when istore5 => mir<= microistruzione_istore5;		
		when istore6 => mir<= microistruzione_istore6;
		when iload1 => mir<= microistruzione_iload1;		
		when iload2 => mir<= microistruzione_iload2;		
		when iload3 => mir<= microistruzione_iload3;
		when iload4 => mir<= microistruzione_iload4;		
		when iload5 => mir<= microistruzione_iload5;		
		when iinc1 => mir<= microistruzione_iinc1;		
		when iinc2 => mir<= microistruzione_iinc2;		
		when iinc3 => mir<= microistruzione_iinc3;
		when iinc4 => mir<= microistruzione_iinc4;		
		when iinc5 => mir<= microistruzione_iinc5;		
		when iinc6 => mir<= microistruzione_iinc6;		
		when ldc_w1 => mir<= microistruzione_ldc_w1;		
		when ldc_w2 => mir<= microistruzione_ldc_w2;		
		when ldc_w3 => mir<= microistruzione_ldc_w3;
		when ldc_w4 => mir<= microistruzione_ldc_w4;		
		when wide1 => mir<= microistruzione_wide1;		
		when wide2 => mir<= microistruzione_wide2;		
		when wide3 => mir<= microistruzione_wide3;		
		when wide_iload1 => mir<= microistruzione_wideiload1;		
		when wide_iload2 => mir<= microistruzione_wideiload2;		
		when wide_iload3 => mir<= microistruzione_wideiload3;
		when wide_iload4 => mir<= microistruzione_wideiload4;		
		when wide_istore1 => mir<= microistruzione_wideistore1;		
		when wide_istore2 => mir<= microistruzione_wideistore2;		
		when wide_istore3 => mir<= microistruzione_wideistore3;
		when wide_istore4 => mir<= microistruzione_wideistore4;		
		when iflt1 => mir<= microistruzione_iflt1;		
		when iflt2 => mir<= microistruzione_iflt2;		
		when iflt3 => mir<= microistruzione_iflt3;
		when iflt4 => mir<= microistruzione_iflt4;		
		when t => mir<= microistruzione_t;		
		when f => mir<= microistruzione_f;		
		when f2 => mir<= microistruzione_f2;
		when f3 => mir<= microistruzione_f3;		
		when ifeq1 => mir<= microistruzione_ifeq1;		
		when ifeq2 => mir<= microistruzione_ifeq2;		
		when ifeq3 => mir<= microistruzione_ifeq3;
		when ifeq4 => mir<= microistruzione_ifeq4;		
		when if_icmpeq1 => mir<= microistruzione_if_icmpeq1;		
		when if_icmpeq2 => mir<= microistruzione_if_icmpeq2;		
		when if_icmpeq3 => mir<= microistruzione_if_icmpeq3;
		when if_icmpeq4 => mir<= microistruzione_if_icmpeq4;		
		when if_icmpeq5 => mir<= microistruzione_if_icmpeq5;
		when if_icmpeq6 => mir<= microistruzione_if_icmpeq6;		
		when invokevirtual1bis => mir<= microistruzione_invokevirtual1bis;		
		when invokevirtual1 => mir<= microistruzione_invokevirtual1;		
		when invokevirtual2 => mir<= microistruzione_invokevirtual2;		
		when invokevirtual3 => mir<= microistruzione_invokevirtual3;
		when invokevirtual4 => mir<= microistruzione_invokevirtual4;		
		when invokevirtual5 => mir<= microistruzione_invokevirtual5;
		when invokevirtual6 => mir<= microistruzione_invokevirtual6;		
		when invokevirtual6bis => mir<= microistruzione_invokevirtual6bis;		
		when invokevirtual7 => mir<= microistruzione_invokevirtual7;		
		when invokevirtual8 => mir<= microistruzione_invokevirtual8;		
		when invokevirtual9 => mir<= microistruzione_invokevirtual9;
		when invokevirtual10 => mir<= microistruzione_invokevirtual10;		
		when invokevirtual11 => mir<= microistruzione_invokevirtual11;
		when invokevirtual12 => mir<= microistruzione_invokevirtual12;		
		when invokevirtual13 => mir<= microistruzione_invokevirtual13;		
		when invokevirtual14 => mir<= microistruzione_invokevirtual14;		
		when invokevirtual15 => mir<= microistruzione_invokevirtual15;
		when invokevirtual16 => mir<= microistruzione_invokevirtual16;		
		when invokevirtual17 => mir<= microistruzione_invokevirtual17;
		when invokevirtual18 => mir<= microistruzione_invokevirtual18;		
		when invokevirtual19 => mir<= microistruzione_invokevirtual19;		
		when invokevirtual20 => mir<= microistruzione_invokevirtual20;
		when invokevirtual21 => mir<= microistruzione_invokevirtual21;		
		when invokevirtual22 => mir<= microistruzione_invokevirtual22;		
		when ireturn1 => mir<= microistruzione_ireturn1;		
		when ireturn2 => mir<= microistruzione_ireturn2;		
		when ireturn3 => mir<= microistruzione_ireturn3;
		when ireturn4 => mir<= microistruzione_ireturn4;		
		when ireturn5 => mir<= microistruzione_ireturn5;
		when ireturn6 => mir<= microistruzione_ireturn6;		
		when ireturn7 => mir<= microistruzione_ireturn7;		
		when ireturn8 => mir<= microistruzione_ireturn8;		


		when out1 => mir<= microistruzione_out1;		
		when out2 => mir<= microistruzione_out2;		
		when out3 => mir<= microistruzione_out3;
		when out4 => mir<= microistruzione_out4;		
		when out5 => mir<= microistruzione_out5;
		when out6 => mir<= microistruzione_out6;		
		when out7 => mir<= microistruzione_out7;		
		when out8 => mir<= microistruzione_out8;		
		when out9 => mir<= microistruzione_out9;		
		when out10 => mir<= microistruzione_out10;	

		when in1 => mir<= microistruzione_in1;		
		when in2 => mir<= microistruzione_in2;		
		when in3 => mir<= microistruzione_in3;
		when in4 => mir<= microistruzione_in4;		
		when in5 => mir<= microistruzione_in5;


		when others => mir<= microistruzione_tutti_zeri;
	end case;
end process;





end Behavioral;

