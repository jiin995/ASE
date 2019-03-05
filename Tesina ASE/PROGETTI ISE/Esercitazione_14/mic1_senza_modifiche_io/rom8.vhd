----------------------------------------------------------------------------------
--! Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
--! Engineer: AIELLO MARCO MATR. 045/004437
--! 
--! Create Date:    17:14:53 08/4/2007 
--! Design Name: 
--! Module Name:     - Behavioral 
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


library work;
--! use work.memory.all;

entity boot_rom is
  port (
    ADDRESS : in  std_logic_vector(8 downto 0);  --9 bit indirizzi = 512  locazioni
	 CE : in std_logic;
    DATA : out std_logic_vector(7 downto 0)
  );
end entity boot_rom;

architecture basic of boot_rom is
  constant width   : integer := 8;  --larghezza word
  constant memsize : integer := 512;  --256 locazioni


--dichiarazione label della control store
constant BIPUSH :std_logic_vector(7 downto 0):=  x"10"; 
constant DUP :std_logic_vector(7 downto 0):=  x"59"; 
constant GOTO :std_logic_vector(7 downto 0):=  x"A7"; 
constant IADD :std_logic_vector(7 downto 0):=  x"60";   
constant IAND :std_logic_vector(7 downto 0):=  x"7E"; 
constant IFEQ :std_logic_vector(7 downto 0):=  x"99"; 
constant IFLT :std_logic_vector(7 downto 0):=  x"9B"; 
constant IF_ICMPEQ :std_logic_vector(7 downto 0):=  x"9F"; 
constant IINC :std_logic_vector(7 downto 0):=  x"84"; 
constant ILOAD :std_logic_vector(7 downto 0):=  x"15"; 
constant INVOKEVIRTUAL :std_logic_vector(7 downto 0):=  x"B6"; 
constant IOR :std_logic_vector(7 downto 0):=  x"B0"; 
constant IRETURN :std_logic_vector(7 downto 0):=  x"AC"; 
constant ISTORE :std_logic_vector(7 downto 0):=  x"36"; 
constant ISUB :std_logic_vector(7 downto 0):=  x"64"; 
constant LDC_W :std_logic_vector(7 downto 0):=  x"13"; 
constant NOP :std_logic_vector(7 downto 0):=  x"00"; 
constant POP :std_logic_vector(7 downto 0):=  x"57"; 
constant SWAP :std_logic_vector(7 downto 0):=  x"5F"; 
constant WIDE :std_logic_vector(7 downto 0):=  x"C4"; 
constant HALT :std_logic_vector(7 downto 0):=  x"FF"; 
constant ERR :std_logic_vector(7 downto 0):=  x"FE"; 
constant OUTT :std_logic_vector(7 downto 0):=  x"FD"; 
constant INN :std_logic_vector(7 downto 0):=  x"FC"; 
constant IMUL :std_logic_vector(7 downto 0):=  x"78"; 
constant IDIV :std_logic_vector(7 downto 0):=  x"E0"; 



  type rom_array is array(0 to memsize-1) of std_logic_vector(width-1 downto 0);


  constant rom_data : rom_array :=  --!  ******************************************
  ( 
		LDC_W,	--00	
		x"00",	--01   
		x"01",	--02   
		OUTT,	--03	
		LDC_W,		--04   
		x"00",		--05   
		x"02",	--06   
		OUTT,	--07   
		LDC_W,		--08   
		x"00",	--09   
		x"05",	--0A  
		OUTT,   	--0B  

		LDC_W,	--0C	
		x"00",	--0D  
		x"00",		--0E  
		INVOKEVIRTUAL,		--0F  
		x"00",		--10  
		x"0E",		--11  
		ISTORE,		--12  
		x"00", 	--13  
		LDC_W,	--14	    
		x"00",	--15  
		x"0D",	--16  
		OUTT,		--17 
		
		LDC_W,	--18  
		x"00",	--19  
		x"01",	--1A  
		OUTT,	--1B  
		LDC_W,	--1C	
		x"00",	--1D   
		x"02",	--1E  
		OUTT,	--1F    
		LDC_W,	--20  
		x"00",	--21  
		x"05",	--22  
		OUTT,	--23  
		
		LDC_W,	--24	 	
		x"00",	--25	
		x"00",	--26  
		INVOKEVIRTUAL,	--27  
		x"00",	--28     
		x"0E",	--29  
		ISTORE,		--2A  
		x"01",	--2B  
		LDC_W,	--2C	
		x"00",	--2D  
		x"0D",	--2E  
		OUTT,	--2F  
		
		LDC_W,		--30  
		x"00",	--31  
		x"00",	--32      
		ILOAD,	--33
		x"00",	--34			
		ILOAD,	--35  
		x"01",    --36     
		INVOKEVIRTUAL, --37  
		x"00",   --38  
		x"0F",   --39  
		ISTORE,   --3A  
		x"02",   --3B  
		
		ILOAD,		--3C	    
		x"00",   --3D  
		ISTORE,   --3E  
		x"05",   --3F  
		ILOAD,	--40	    
		x"01",   	--41  
		ISTORE,   --42    
		x"06",   --43  
		BIPUSH,		--44	
		x"00",  --45  
		ISTORE,   --46  
		x"03",   	--47  
		
		ILOAD,   --48   
		x"05",   --49  
		ISTORE,--4A  
		x"04",   --4B  
		ILOAD,	--4C	
		x"05",  --4D  
		IFEQ,   --4E
		x"00",	--4F
		x"1E",   --50
		ILOAD,   --51
		x"06",  --52
		IFEQ,   --53
		
		x"00",	--54
		x"18",   --55
		ILOAD,--56
		x"04",   --57
		ILOAD,   --58
		x"06",    --59
		ISUB,   --5A
		IFLT,	--5B
		x"00",    --5C
		x"11",   --5D
		ILOAD,   --5E
		x"04",    --5F
		
		ILOAD,   --60
		x"06",   --61
		ISUB,    --62
		ISTORE,	--63
		x"04",   --64
		IINC,    --65
		x"03",   --66
		x"01",   --67
		GOTO,   --68
		x"FF",   --69
		x"EE",   --6A
		x"FF",	--6B
		
		ILOAD,   --6C
		x"03",   --6D
		ILOAD,   --6E
		x"04",   --6F
		ISTORE,    --70
		x"04", --71
		ISTORE,   --72
		x"03",	--73	
		LDC_W,--74
		x"00",--75
		x"00",--76
		ILOAD,--77
		
		x"02",--78
		ILOAD,--79
		x"03",--7A
		ILOAD,--7B		
		x"04",--7C
		INVOKEVIRTUAL,--7D
		x"00",--7E
  		x"10",--7F
		GOTO,--80
		x"FF",--81
		x"80",--82
  		NOP,--83	

		x"01",--84
		NOP,--85
		x"03",--86
		INN,--87		
		DUP,--88
		IFEQ,--89
		x"00",--8A
  		x"34",--8B
		DUP,--8C
		OUTT,--8D
		ISTORE,--8E
  		x"01",--8F	
		
		INN,--90
		DUP,--91
		IFEQ,--92
		x"00",--93		
		x"27",--94
		DUP,--95
		OUTT,--96
  		ISTORE,--97
		x"02",--98
		ILOAD,--99
		x"01",--9A
  		BIPUSH,--9B	

		x"30",--9C
		ISUB,--9D
		ISTORE,--9E
		x"01",--9F		
		ILOAD,--A0
		x"02",--A1
		BIPUSH,--A2
  		x"30",--A3
		ISUB,--A4
		ISTORE,--A5
		x"02",--A6
  		ILOAD,--A7	
		
		x"02",--A8
		ISTORE,--A9
		x"03",--AA
		LDC_W,--AB		
		x"00",--AC
		x"00",--AD
		ILOAD,--AE
  		x"01",--AF
		BIPUSH,--B0
		x"0A",--B1
		INVOKEVIRTUAL,--B2
  		x"00",--B3	
		
		x"0F",--B4
		ILOAD,--B5
		x"03",--B6
		IADD,--B7		
		IRETURN,--B8
		POP,--B9
		GOTO,--BA
  		x"FF",--BB
		x"D6",--BC
		POP,--BD
		GOTO,--BE
  		x"FF",--BF	
		
		x"C9",--C0
		NOP,--C1
		x"03",--C2
		NOP,--C3		
		x"02",--C4
		BIPUSH,--C5
		x"00",--C6
  		ISTORE,--C7
		x"03",--C8
		ILOAD,--C9
		x"01",--CA
  		IFEQ,--CB	
		
		x"00",--CC
		x"10",--CD
		ILOAD,--CE
		x"02",--CF
		ILOAD,--D0
		x"03",--D1
		IADD,--D2
  		ISTORE,--D3
		x"03",--D4
		IINC,--D5
		x"01",--D6
  		x"FF",--D7	
				
		
		GOTO,--D8
		x"FF",--D9
		x"F1",--DA
		ILOAD,--DB
		x"03",--DC
		IRETURN,--DD
		NOP,--DE
  		x"04",--DF
		NOP,--E0
		NOP,--E1
		LDC_W,--E2
  		x"00",--E3
		
		x"02",--E4
		OUTT,--E5
		LDC_W,--E6
		x"00",--E7
		x"09",--E8
		OUTT,--E9
		LDC_W,--EA
  		x"00",--EB
		x"01",--EC
		OUTT,--ED
		LDC_W,--EE
  		x"00",--EF		
		
		x"05",--F0
		OUTT,--F1
		LDC_W,--F2
		x"00",--F3
		x"00",--F4
		ILOAD,--F5
		x"01",--F6
  		INVOKEVIRTUAL,--F7
		x"00",--F8
		x"11",--F9
		LDC_W,--FA
  		x"00",--FB		
		
		x"0D",--FC
		OUTT,--FD
		LDC_W,--FE
		x"00",--FF
		x"06",--100
		OUTT,--101
		LDC_W,--102
  		x"00",--103
		x"07",--104
		OUTT,--105
		LDC_W,--106
  		x"00",--107	
		
		x"01",--108
		OUTT,--109
		LDC_W,--10A
		x"00",--10B
		x"05",--10C
		OUTT,--10D
		LDC_W,--10E
  		x"00",--10F
		x"00",--110
		ILOAD,--111
		x"02",--112
  		INVOKEVIRTUAL,--113	
		
		x"00",--114
		x"11",--115
		LDC_W,--116
		x"00",--117
		x"0D",--118
		OUTT,--119
		LDC_W,--11A
  		x"00",--11B
		x"09",--11C
		OUTT,--11D
		LDC_W,--11E
  		x"00",--11F		
		
		x"0A",--120
		OUTT,--121
		LDC_W,--122
		x"00",--123
		x"0B",--124
		OUTT,--125
		LDC_W,--126
  		x"00",--127
		x"05",--128
		OUTT,--129
		LDC_W,--12A
  		x"00",--12B		

		x"00",--12C
		ILOAD,--12D
		x"03",--12E
		INVOKEVIRTUAL,--12F
		x"00",--130
		x"11",--131
		LDC_W,--132		
		x"00",--133
		x"0D",--134
		OUTT,--135
		IRETURN,--136
		x"00",--137
	
		x"02",--138
		NOP,--139
		x"09",--13A
		BIPUSH,--13B
		x"00",--13C
		ISTORE,--13D
		x"03",--13E		
		BIPUSH,--13F
		x"00",--140
		ISTORE,--141
		x"02",--142
		BIPUSH,--143
		
		x"00",--144
		ISTORE,--145
		x"04",--146
		BIPUSH,--147
		x"00",--148
		ISTORE,--149
		x"05",--14A	
		ILOAD,--14B
		x"01",--14C
		BIPUSH,--14D
		x"0A",--14E
		ISTORE,--14F

		x"08",--150
		ISTORE,--151
		x"07",--152
		BIPUSH,--153
		x"01",--154
		ISTORE,--155
		x"06",--156
		GOTO,--157
		x"00",--158
		x"4D",--159
		NOP,--15A
		ISTORE,--15B

		x"03",--15C
		ISTORE,--15D
		x"01",--15E
		ILOAD,--15F
		x"01",--160
		BIPUSH,--161
		x"0A",--162
		ISTORE,--163
		x"08",--164
		ISTORE,--165
		x"07",--166
		BIPUSH,--167

		x"02",--168
		ISTORE,--169
		x"06",--16A
		GOTO,--16B
		x"00",--16C
		x"39",--16D
		NOP,--16E
		ISTORE,--16F
		x"02",--170
		ISTORE,--171
		x"01",--172
		ILOAD,--173

		x"01",--174
		BIPUSH,--175
		x"0A",--176
		ISTORE,--177
		x"08",--178
		ISTORE,--179
		x"07",--17A
		BIPUSH,--17B
		x"03",--17C
		ISTORE,--17D
		x"06",--17E
		GOTO,--17F

		x"00",--180
		x"25",--181
		NOP,--182
		ISTORE,--183
		x"04",--184
		ISTORE,--185
		x"05",--186
  		ILOAD,--187
		x"05",--188
		BIPUSH,--189
		x"30",--18A
  		IADD,--18B		

		OUTT,--18C
		ILOAD,--18D
		x"04",--18E
		BIPUSH,--18F
		x"30",--190
		IADD,--191
		OUTT,--192
  		ILOAD,--193
		x"02",--194
		BIPUSH,--195
		x"30",--196
  		IADD,--197

		OUTT,--198
		ILOAD,--199
		x"03",--19A
		BIPUSH,--19B
		x"30",--19C
		IADD,--19D
		OUTT,--19E
  		LDC_W,--19F
		x"00",--1A0
		x"0D",--1A1
		OUTT,--1A2
  		IRETURN,--1A3
		
		BIPUSH,--1A4
		x"00",--1A5
		ISTORE,--1A6
		x"09",--1A7
		ILOAD,--1A8
		x"07",--1A9
		ISTORE,--1AA
  		x"0A",--1AB
		ILOAD,--1AC
		x"07",--1AD
		IFEQ,--1AE
  		x"00",--1AF
				
		x"1E",--1B0
		ILOAD,--1B1
		x"08",--1B2
		IFEQ,--1B3
		x"00",--1B4
		x"18",--1B5
		ILOAD,--1B6
  		x"0A",--1B7
		ILOAD,--1B8
		x"08",--1B9
		ISUB,--1BA
  		IFLT,--1BB
		
		x"00",--1BC
		x"11",--1BD
		ILOAD,--1BE
		x"0A",--1BF
		ILOAD,--1C0
		x"08",--1C1
		ISUB,--1C2
  		ISTORE,--1C3
		x"0A",--1C4
		IINC,--1C5
		x"09",--1C6
  		x"01",--1C7		

		GOTO,--1C8
		x"FF",--1C9
		x"EE",--1CA
		x"FF",--1CB
		ILOAD,--1CC
		x"09",--1CD
		ILOAD,--1CE
  		x"0A",--1CF
		ILOAD,--1D0
		x"06",--1D1
		BIPUSH,--1D2
  		x"01",--1D3
		
		IF_ICMPEQ,--1D4
		x"FF",--1D5
		x"86",--1D6
		ILOAD,--1D7
		x"06",--1D8
		BIPUSH,--1D9
		x"02",--1DA
  		IF_ICMPEQ,--1DB
		x"FF",--1DC
		x"93",--1DD
		ILOAD,--1DE
  		x"06",--1DF	
		
		BIPUSH,--1E0
		x"03",--1E1
  		IF_ICMPEQ,--1E2
		x"FF",--1E3
		x"A0",--1E4		
		
		
      others=>(others=>'0')		
  );




--!  constant rom_data : rom_array :=  --testa uart in rx con eco di quanto ricevuto
--!  ( 
--		INN,
--		DUP,
--		BIPUSH,
--		x"00",
--		IF_ICMPEQ,
--		x"00",
--		x"07",
--		OUTT,
--		GOTO,
--		x"FF",
--		x"F8",			
--		POP,
--		GOTO,
--		x"FF",
--		x"F4",			
--!      others=>(others=>'0')		
--!  );

begin

 DATA <= rom_data(conv_integer(ADDRESS)) when CE = '1' else (others => 'Z'); 

end architecture basic;





 
 
 
 
