----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:29 03/21/2009 
-- Design Name: 
-- Module Name:    ram_core - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram is
	generic (
	 ADDR_WIDTH : integer :=7 ;
	 DATA_WIDTH : integer :=32
	) ;
	
	port (
	 cs : in std_logic;
	 ck : in std_logic;
	 we: in std_logic;
	 rd: in std_logic; 
	 addr : in std_logic_vector (ADDR_WIDTH-1 downto 0) ;
	 data : inout std_logic_vector (DATA_WIDTH-1 downto 0)
	) ;
end ram;




architecture Behavioral of ram is

 type ram_type is array (2**ADDR_WIDTH -1 downto 0 ) of std_logic_vector (DATA_WIDTH-1 downto 0 ) ;
 signal ram: ram_type:=(others=>(others=>'1'));
 signal data_sig : std_logic_vector (DATA_WIDTH-1 downto 0);
 
 begin
  process(ck)
  begin
   if(rising_edge(ck))then
	 if(we='1' and cs='1') then
     ram(conv_integer(addr)) <= data;
    end if;
   end if;
  end process ;
 data_sig <= ram(conv_integer(addr));
 data <=  data_sig when (cs ='1' and rd='1') else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end Behavioral;

