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

library work;
--! use work.memory.all;

entity cpool_rom is
  port (
    ADDRESS : in  std_logic_vector(4 downto 0);  --7 bit indirizzi = 128  locazioni
    DATA : inout std_logic_vector(31 downto 0);
	 CE : in std_logic
  );
end entity cpool_rom;

architecture basic of cpool_rom is
  constant width   : integer := 32;  --larghezza word
  constant memsize : integer := 32;  --64 locazioni




  type rom_array is array(0 to memsize-1) of std_logic_vector(width-1 downto 0);

--!  constant rom_data : rom_array :=
--!  ( 
--		x"00000040",	--0	 OBJREF
--		x"0000004F",	--1   
--		x"00000050",	--2    
--		x"00000031",	--3	
--		x"00000032",	--4   
--		x"0000003D",	--5
--		x"00000051",	--6   
--		x"00000055",	--7
--		x"0000005A",	--8    
--		x"00000052",	--9   
--		x"00000045",	--10   
--		X"00000053",   --11  
--		x"0000002E",	--12	
--		x"0000000A",	--13  
--		x"00000052",	--14  
--		x"0000008E",	--15  
--		x"000000E7",	--16  
--		x"00000000",	--17  
--		x"00000000",	--18  
--		x"00000000", 	--19  
--		x"00000000",	--20	    
--		x"00000000",	--21  
--		x"00000000",	--22  
--		x"00000000",	--23  
--		x"00000000",	--24  
--		x"00000000",	--25  
--		x"00000000",	--26  
--		x"00000000",	--27  
--		x"00000000",	--28	
--		x"00000000",	--29   
--		x"00000000",	--30  
--		x"00000000" 	--31    
--!  );

  constant rom_data : rom_array :=  --*********************************
  ( 
		x"00000040",	--0	 OBJREF
		x"0000004F",	--1   
		x"00000050",	--2    
		x"00000031",	--3	
		x"00000032",	--4   
		x"0000003D",	--5
		x"00000051",	--6   
		x"00000055",	--7
		x"0000005A",	--8    
		x"00000052",	--9   
		x"00000045",	--10   
		X"00000053",   --11  
		x"0000002E",	--12	
		x"0000000A",	--13  
		x"00000083",	--14  
		x"000000C1",	--15  
		x"000000DE",	--16  
		x"00000137",	--17  
		x"00000000",	--18  
		x"00000000", 	--19  
		x"00000000",	--20	    
		x"00000000",	--21  
		x"00000000",	--22  
		x"00000000",	--23  
		x"00000000",	--24  
		x"00000000",	--25  
		x"00000000",	--26  
		x"00000000",	--27  
		x"00000000",	--28	
		x"00000000",	--29   
		x"00000000",	--30  
		x"00000000" 	--31    
  );


begin
	
DATA <= rom_data(conv_integer(ADDRESS)) when CE='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

end architecture basic;





