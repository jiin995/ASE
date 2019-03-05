----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    16:56:20 02/12/2019 
--! Design Name: 
--! Module Name:    DoubleDisplayOnBoard - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: TopLevelEntity per testare il funzionamento del componente
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

entity DoubleDisplayOnBoard is
    Port ( 	clock 			: in  STD_LOGIC;
				values 			: in  STD_LOGIC_VECTOR (15 downto 0);
				load_reg_0_3 	: in  STD_LOGIC;
				load_reg_4_7 	: in  STD_LOGIC;
				anodes 			: out  STD_LOGIC_VECTOR (7 downto 0);
				cathodes 		: out  STD_LOGIC_VECTOR (7 downto 0)
			);
end DoubleDisplayOnBoard;

architecture Behavioral of DoubleDisplayOnBoard is

signal enable_digit 	:STD_LOGIC_VECTOR (7 downto 0):=(others => '1');
signal enable_int 	: STD_LOGIC := '1';
signal reset 			: STD_LOGIC := '0';
signal dots 			: STD_LOGIC_VECTOR (7 downto 0) := ( others => '0' );
signal values_int		: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0' );


component display_7_segments is
	port ( 	clock 			: in STD_LOGIC;
				enable 			: in STD_LOGIC;
				reset				: in STD_LOGIC;
				values 			: in STD_LOGIC_VECTOR (31 downto 0);
				dots 				: in STD_LOGIC_VECTOR (7 downto 0) ;
				enable_digit	: in STD_LOGIC_VECTOR (7 downto 0);	
				anodes 			: out STD_LOGIC_VECTOR (7 downto 0);
				cathodes			: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;

component  register_d_Re_Ar is 
   generic(	dimension       :   NATURAL :=16;       --! definisce il parallelismo del registro
				reset_level     :   STD_LOGIC :='1';    --! definisce il livello reset
            load_level    :   STD_LOGIC := '1'    --! definisce il livello enable
    );

   port(   clock   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale di clock per sincronizzare
           load  	 :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale enable
           reset   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale reset
           d       :   in  STD_LOGIC_VECTOR    (dimension-1 downto 0);	--! register_d_Re_Ar input    : inpput data 
           q       :   out STD_LOGIC_VECTOR    (dimension-1 downto 0)	--! register_d_Re_Ar input    : output data
    );
end component;

alias values_0_3 is values_int (15 downto 0) ;
alias values_4_7 is values_int (31 downto 16) ;

begin

	register_0_3: register_d_Re_Ar PORT MAP ( clock 	=> clock,
															load 		=> load_reg_0_3,
															reset 	=> reset,
															d			=> values,
															q 			=> values_0_3
												);
															
	register_4_7: register_d_Re_Ar PORT MAP ( clock 	=> clock,
															load 		=> load_reg_4_7,
															reset 	=> reset,
															d			=> values,
															q 			=> values_4_7
												);
	
	
	display: display_7_segments port map (	clock => clock,
														enable => enable_int,
														reset => reset,
														values => values_int,
														dots => dots,
														enable_digit => enable_digit,
														anodes => anodes,
														cathodes => cathodes
												);
											

end Behavioral;

