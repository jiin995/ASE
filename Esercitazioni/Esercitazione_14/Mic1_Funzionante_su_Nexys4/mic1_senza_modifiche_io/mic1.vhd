----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    19:48:07 01/10/2008 
-- Design Name: 
-- Module Name:    mic1 - Behavioral 
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

entity mic1 is
port(
	cki:in std_logic;  --clock
	uscita_mar:out std_logic_vector(31 downto 0):=x"00000000";  --uscita verso la memoria reg. MAR
	io_mdr:inout std_logic_vector(31 downto 0):=x"00000000";  --ingr./uscita verso la memoria reg. MDR
	uscita_pc:out std_logic_vector(31 downto 0):=x"00000000";  --uscita verso la memoria reg. PC
	ingresso_mbr:in std_logic_vector(7 downto 0):=x"00";  --ingresso dalla memoria reg. MBR
	wr:out std_logic;  --write
	rd:out std_logic;  --read
	fetch:out std_logic  --fetch
);
end mic1;

architecture Behavioral of mic1 is

	COMPONENT parte_di_controllo
	PORT(
		ff_n : IN std_logic;
		ff_z : IN std_logic;
		reg_mbr : IN std_logic_vector(7 downto 0);
		ck : IN std_logic;          
		wwrite : OUT std_logic;
		rread : OUT std_logic;
		ffetch : OUT std_logic;
		sra1 : OUT std_logic;
		sll8 : OUT std_logic;
		f0 : OUT std_logic;
		f1 : OUT std_logic;
		ena : OUT std_logic;
		enb : OUT std_logic;
		inva : OUT std_logic;
		inc : OUT std_logic;
		h : OUT std_logic;
		opc : OUT std_logic;
		tos : OUT std_logic;
		cpp : OUT std_logic;
		lv : OUT std_logic;
		sp : OUT std_logic;
		pc : OUT std_logic;
		mdr : OUT std_logic;
		mar : OUT std_logic;
		eob_mdr : OUT std_logic;
		eob_pc : OUT std_logic;
		eob_mbr : OUT std_logic;
		eob_mbru : OUT std_logic;
		eob_sp : OUT std_logic;
		eob_lv : OUT std_logic;
		eob_cpp : OUT std_logic;
		eob_tos : OUT std_logic;
		eob_opc : OUT std_logic
		);
	END COMPONENT;

	COMPONENT parte_operativa
	PORT(
		wwrite : IN std_logic;
		rread : IN std_logic;
		ffetch : IN std_logic;
		ck : IN std_logic;
		eobb_mdr : IN std_logic;
		eobb_pc : IN std_logic;
		eobb_mbr : IN std_logic;
		eobb_mbru : IN std_logic;
		eobb_sp : IN std_logic;
		eobb_lv : IN std_logic;
		eobb_cpp : IN std_logic;
		eobb_tos : IN std_logic;
		eobb_opc : IN std_logic;
		wcbtr_mdr : IN std_logic;
		wcbtr_pc : IN std_logic;
		wcbtr_h : IN std_logic;
		wcbtr_mar : IN std_logic;
		wcbtr_sp : IN std_logic;
		wcbtr_lv : IN std_logic;
		wcbtr_cpp : IN std_logic;
		wcbtr_tos : IN std_logic;
		wcbtr_opc : IN std_logic;
		sll8 : IN std_logic;
		sra1 : IN std_logic;
		INVA : IN std_logic;
		ENA : IN std_logic;
		ENB : IN std_logic;
		F0 : IN std_logic;
		F1 : IN std_logic;
		INC : IN std_logic;
		data_mbr : IN std_logic_vector(7 downto 0);    
		inguscita_mdr : INOUT std_logic_vector(31 downto 0);      
		N : OUT std_logic;
		Z : OUT std_logic;
		wr : OUT std_logic;
		rd : OUT std_logic;
		fe : OUT std_logic;
		address_mar : OUT std_logic_vector(31 downto 0);
		address_pc : OUT std_logic_vector(31 downto 0);
		mbr_outoring : OUT std_logic_vector(7 downto 0)

		);
	END COMPONENT;


signal	eob_mdr_sig:std_logic:='0';
signal	eob_pc_sig:std_logic:='0';
signal	eob_mbr_sig:std_logic:='0';
signal	eob_mbru_sig:std_logic:='0';
signal	eob_sp_sig:std_logic:='0'; 
signal	eob_lv_sig:std_logic:='0'; 
signal	eob_cpp_sig:std_logic:='0';
signal	eob_tos_sig:std_logic:='0';
signal	eob_opc_sig:std_logic:='0';

signal	fetch_sig:std_logic:='0';
signal	read_sig:std_logic:='0';
signal	write_sig:std_logic:='0';

signal   wcbtr_mdr_sig:std_logic:='0'; 
signal	wcbtr_pc_sig:std_logic:='0'; 
signal	wcbtr_h_sig:std_logic:='0'; 
signal	wcbtr_mar_sig:std_logic:='0';
signal	wcbtr_sp_sig:std_logic:='0'; 
signal	wcbtr_lv_sig:std_logic:='0'; 
signal	wcbtr_cpp_sig:std_logic:='0';
signal	wcbtr_tos_sig:std_logic:='0';
signal	wcbtr_opc_sig:std_logic:='0';



signal	sra1_sig:std_logic:='0'; 
signal	sll8_sig:std_logic:='0'; 
signal	f0_sig:std_logic:='0'; 
signal	f1_sig:std_logic:='0'; 
signal	ena_sig:std_logic:='0'; 
signal	enb_sig:std_logic:='0'; 
signal	inva_sig:std_logic:='0'; 
signal	inc_sig:std_logic:='0'; 
signal	flag_n_sig:std_logic:='0'; 
signal	flag_z_sig:std_logic:='0'; 

signal	mbr_outoring_sig:std_logic_vector(7 downto 0):=x"00";
signal   uscita_mar_sig:std_logic_vector(31 downto 0):=x"00000000";	

signal	ck:std_logic:='0'; 
	
begin


   ck<=cki;

	Inst_parte_di_controllo: parte_di_controllo PORT MAP(
		ff_n => flag_n_sig,
		ff_z => flag_z_sig,
		reg_mbr => mbr_outoring_sig,
		ck => ck,
		wwrite => write_sig,
		rread => read_sig,
		ffetch => fetch_sig,
		sra1 => sra1_sig,
		sll8 => sll8_sig,
		f0 => f0_sig,
		f1 => f1_sig,
		ena => ena_sig,
		enb => enb_sig,
		inva => inva_sig,
		inc => inc_sig,
		h => wcbtr_h_sig,
		opc => wcbtr_opc_sig,
		tos => wcbtr_tos_sig,
		cpp => wcbtr_cpp_sig,
		lv => wcbtr_lv_sig,
		sp => wcbtr_sp_sig,
		pc => wcbtr_pc_sig,
		mdr => wcbtr_mdr_sig,
		mar => wcbtr_mar_sig,
		eob_mdr => eob_mdr_sig,
		eob_pc => eob_pc_sig,
		eob_mbr => eob_mbr_sig,
		eob_mbru => eob_mbru_sig,
		eob_sp => eob_sp_sig,
		eob_lv => eob_lv_sig,
		eob_cpp => eob_cpp_sig,
		eob_tos => eob_tos_sig,
		eob_opc => eob_opc_sig
	);





	Inst_parte_operativa: parte_operativa PORT MAP(
		wwrite => write_sig,
		rread => read_sig,
		ffetch => fetch_sig,
		ck => ck,
		eobb_mdr => eob_mdr_sig,
		eobb_pc => eob_pc_sig,
		eobb_mbr => eob_mbr_sig,
		eobb_mbru => eob_mbru_sig,
		eobb_sp => eob_sp_sig,
		eobb_lv => eob_lv_sig,
		eobb_cpp => eob_cpp_sig,
		eobb_tos => eob_tos_sig,
		eobb_opc => eob_opc_sig,
		wcbtr_mdr => wcbtr_mdr_sig,
		wcbtr_pc => wcbtr_pc_sig,
		wcbtr_h => wcbtr_h_sig,
		wcbtr_mar => wcbtr_mar_sig,
		wcbtr_sp => wcbtr_sp_sig,
		wcbtr_lv => wcbtr_lv_sig,
		wcbtr_cpp => wcbtr_cpp_sig,
		wcbtr_tos => wcbtr_tos_sig,
		wcbtr_opc => wcbtr_opc_sig,
		sll8 => sll8_sig,
		sra1 => sra1_sig,
		INVA => inva_sig,
		ENA => ena_sig,
		ENB => enb_sig,
		F0 => f0_sig,
		F1 => f1_sig,
		INC => inc_sig,
		N => flag_n_sig,
		Z => flag_z_sig,
		wr => wr,
		rd => rd,
		fe => fetch,
		address_mar => uscita_mar_sig,--**
		address_pc => uscita_pc,
		data_mbr => ingresso_mbr,
		inguscita_mdr => io_mdr,
		mbr_outoring => mbr_outoring_sig
	);


	uscita_mar<=uscita_mar_sig(29 downto 0)&'0'&'0';--vedi pag.238 fig.4.4 Tanenbaum

end Behavioral;

