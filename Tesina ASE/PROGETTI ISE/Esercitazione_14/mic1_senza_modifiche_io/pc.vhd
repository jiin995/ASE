----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    10:08:15 01/07/2008 
-- Design Name: 
-- Module Name:    parte_di_controllo - Behavioral 
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
use IEEE.STD_LOGIC_1164.all;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.costanti.all;




entity parte_di_controllo is
port(
   --ingressi
	ff_n:in std_logic:='0';  --ingresso FF flag N
	ff_z:in std_logic:='0';  --ingresso FF flag Z
	reg_mbr:in std_logic_vector(7 downto 0);  --ingresso registro MBR
	ck:in std_logic; --ingresso clock
	--uscite pilotaggio memoria
	wwrite:out std_logic:='0';  --linea write per la ram
	rread:out std_logic:='0';  --linea read per la ram
	ffetch:out std_logic:='0';  --linea read per la rom
	--uscite pilotaggio shifter
	sra1:out std_logic:='0';  --linea sra1 shifter
	sll8:out std_logic:='0';  --linea sll8 shifter
	--uscite pilotaggio alu
	f0:out std_logic:='0';  --linea f0 alu
	f1:out std_logic:='0';  --linea f1 alu
	ena:out std_logic:='0';  --linea ena alu
	enb:out std_logic:='0';  --linea enb alu
	inva:out std_logic:='0';  --linea inva alu
	inc:out std_logic:='0';  --linea inc alu
	--parte dei segnali di abilitazione per il C bus
	h:out std_logic:='0'; --segnale h
	opc:out std_logic:='0'; --segnale opc
	tos:out std_logic:='0'; --segnale tos
	cpp:out std_logic:='0'; --segnale cpp
	lv:out std_logic:='0'; --segnale lv
	sp:out std_logic:='0'; --segnale sp
	pc:out std_logic:='0'; --segnale pc
	mdr:out std_logic:='0'; --segnale mdr
	mar:out std_logic:='0'; --segnale mar
	--parte dei segnali di abilitazione per il B bus
	eob_mdr:out std_logic:='0'; --segnale mdr
	eob_pc:out std_logic:='0'; --segnale pc
	eob_mbr:out std_logic:='0'; --segnale mbr
	eob_mbru:out std_logic:='0'; --segnale mbru
	eob_sp:out std_logic:='0'; --segnale sp
	eob_lv:out std_logic:='0'; --segnale lv
	eob_cpp:out std_logic:='0'; --segnale cpp
	eob_tos:out std_logic:='0'; --segnale tos
	eob_opc:out std_logic:='0' --segnale opc	
);
end parte_di_controllo;



architecture Behavioral of parte_di_controllo is

	COMPONENT control_store
	port(
		addr:in std_logic_vector(8 downto 0);  --ingressi indirizzo 
		mir:out microinstruction:=microistruzione_tutti_zeri  --uscita control store
		);	
	END COMPONENT;

	COMPONENT oring
	PORT(
		jmpc : IN std_logic;
		addr : IN std_logic_vector(7 downto 0);
		reg_mbr : IN std_logic_vector(7 downto 0);          
		uscita_oring : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT mpc
	PORT(
		din : IN std_logic_vector(8 downto 0);
		ck : IN std_logic;          
		dout : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	COMPONENT high_bit
	PORT(
		ff_n : IN std_logic;
		ff_z : IN std_logic;
		jamn : IN std_logic;
		jamz : IN std_logic;          
		high_bit_out : OUT std_logic
		);
	END COMPONENT;

	COMPONENT decoder
	PORT(
		sel : IN std_logic_vector(3 downto 0);          
		output : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;




	signal addr_sig:std_logic_vector(8 downto 0):="000000000";  --segnale che collega addr di MIR con oring
	signal jmpc_sig:std_logic:='0'; 
	signal jamn_sig:std_logic:='0'; --segnale jamn
	signal jamz_sig:std_logic:='0'; --segnale jamz
	signal indcstore_sig:std_logic_vector(8 downto 0):="000000000";  --ingressi indirizzo 
	signal uscitaoring_sig:std_logic_vector(7 downto 0):="00000000";
	signal highbit_sig:std_logic:='0'; 
	signal highbit_sig_ored:std_logic:='0'; 
	signal lineedecoder_sig:std_logic_vector(3 downto 0):="0000";  --uscite pilotaggio decoder 4:16
	signal lineedec_appese : std_logic_vector(6 downto 0);  --serve ad attaccarci le linee appese del decoder

begin

	highbit_sig_ored<=highbit_sig or addr_sig(8); --or tra high bit e bit 9 del campo next_address

	Inst_control_store: control_store PORT MAP(
		addr => indcstore_sig,
		mir.next_address=>addr_sig,
		mir.jmpc=>jmpc_sig,
		mir.jamn=>jamn_sig,
		mir.jamz=>jamz_sig,
	
		mir.sll8=>sll8,
		mir.sra1=>sra1,
		mir.f0=>f0,
		mir.f1=>f1,
		mir.ena=>ena,
		mir.enb=>enb,
		mir.inva=>inva,
		mir.inc=>inc,
		
		mir.h =>h,
		mir.opc=> opc,
		mir.tos=> tos,
		mir.cpp=> cpp, 
		mir.lv=> lv,
		mir.sp=> sp,
		mir.pc=> pc,
		mir.mdr=> mdr,
		mir.mar=> mar,
		
		mir.wwrite=>wwrite,
		mir.rread=>rread,
		mir.fetch=>ffetch,
		mir.b_bus=>lineedecoder_sig
	);

	Inst_oring: oring PORT MAP(
		uscita_oring => uscitaoring_sig,
		jmpc => jmpc_sig,
		addr => addr_sig(7 downto 0),
		reg_mbr => reg_mbr
	);
	
	Inst_mpc: mpc PORT MAP(
		din(7 downto 0) => uscitaoring_sig,
		din(8)=>highbit_sig_ored,
		dout => indcstore_sig,
		ck => ck
	);



	Inst_high_bit: high_bit PORT MAP(
		high_bit_out => highbit_sig,
		ff_n => ff_n,
		ff_z => ff_z,
		jamn => jamn_sig,
		jamz => jamz_sig
	);	

	Inst_decoder: decoder PORT MAP(
		output(0) => eob_mdr,
		output(1) => eob_pc,
		output(2) => eob_mbr,
		output(3) => eob_mbru,
		output(4) => eob_sp,
		output(5) => eob_lv,
		output(6) => eob_cpp,
		output(7) => eob_tos,
		output(8) => eob_opc,
		output(15 downto 9) =>	lineedec_appese,
		sel => lineedecoder_sig
	);
	

end Behavioral;

