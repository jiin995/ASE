----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:15 03/30/2009 
-- Design Name: 
-- Module Name:    mbr - Behavioral 
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


entity mbr_register is
	port(
		ck : in std_logic;
		eobb_mbr : in std_logic;
		eobb_mbru : in std_logic;
		ffetch_ritardato : in std_logic;
		data_mbr : in std_logic_vector(7 downto 0);
		uscita_mbr : out std_logic_vector(31 downto 0)
	);
end mbr_register;

architecture Behavioral of mbr_register is
	signal memoria : std_logic_vector(7 downto 0):=x"00";
	signal esteso_zeri : std_logic_vector(31 downto 0);
	signal esteso_segno : std_logic_vector(31 downto 0);



begin

	process(ck)  --processo per registro con logica di enable
	begin
		if (rising_edge(ck)) then  --fronte di salita clock	
			if (ffetch_ritardato='1') then  
				memoria<=data_mbr;  
			end if;
		end if;	
	end process;
	
	esteso_zeri <= (x"000000" & memoria);  --calcola estensione con zeri
	esteso_segno(31 downto 8) <= (others => memoria(7)); --calcola estensione con segno
	esteso_segno(7 downto 0) <= memoria;


   --mux per selezione dell'uscita tra estensione con segno e con zero
	uscita_mbr <=  esteso_segno when (eobb_mbr='1' and eobb_mbru='0') else --esteso con segno
					   esteso_zeri when (eobb_mbru='1'and eobb_mbr='0' ) else --esteso con zeri
						esteso_zeri;  --per default
	

end Behavioral;

