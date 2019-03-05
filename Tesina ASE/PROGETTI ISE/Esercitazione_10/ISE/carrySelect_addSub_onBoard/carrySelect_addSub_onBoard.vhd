----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    12:36:14 02/21/2019 
--! Design Name: 
--! Module Name:    carrySelect_addSub_onBoard - Behavioral 
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

--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

--! Uncomment the following library declaration if instantiating
--! any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity carrySelect_addSub_onBoard is
    generic (	 M       : NATURAL :=  4;
    --! P parallelismo delle celle dell carry select
                P       : NATURAL :=  4
    );
    port (	clock 		: in 	  STD_LOGIC ;
				enable_a    : in	  STD_LOGIC ;
				enable_b		: in 	  STD_LOGIC ;
            subtract    : in    STD_LOGIC ;
				input       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
				overflow    : out   STD_LOGIC ;
            c_out       : out   STD_LOGIC ;
				anodes 		: out   STD_LOGIC_VECTOR (7 downto 0);
				cathodes		: out   STD_LOGIC_VECTOR (7 downto 0)
                             --! output carry in uscita
    );
end carrySelect_addSub_onBoard;

architecture Behavioral of carrySelect_addSub_onBoard is

component display_7_segmenti is
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

component carrySelect_addSub is 
    generic (	 M       : NATURAL :=  4;
    --! P parallelismo delle celle dell carry select
                P       : NATURAL :=  4
    );
    port (
            A           : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
            B           : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! input addendo
            subtract    : in    STD_LOGIC ;
            S           : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);  --! output somma
            overflow    : out   STD_LOGIC ;
            c_out       : out   STD_LOGIC                               --! output carry in uscita
    );
end component;

component  register_d_Re_Ar is 
    generic(    dimension       :   NATURAL :=32;        --! definisce il parallelismo del registro
                reset_level     :   STD_LOGIC :='1';    --! definisce il livello reset
                load_level      :   STD_LOGIC := '1'    --! definisce il livello enable
    );

    port(   clock   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale di clock per sincronizzare
            load 	  :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale enable
            reset   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale reset
            d       :   in  STD_LOGIC_VECTOR    (dimension-1 downto 0);	--! register_d_Re_Ar input    : inpput data 
            q       :   out STD_LOGIC_VECTOR    (dimension-1 downto 0)	--! register_d_Re_Ar input    : output data
    );

end component;

signal internal_S 		: STD_LOGIC_VECTOR ((M*P)-1 downto 0) := ( others => '0');
signal internal_a 		: STD_LOGIC_VECTOR ((M*P)-1 downto 0) := ( others => '0');
signal internal_b 		: STD_LOGIC_VECTOR ((M*P)-1 downto 0) := ( others => '0');

signal enable_int  		: STD_LOGIC := '1';
signal reset  				: STD_LOGIC := '0';

signal internal_s_long	: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0');
signal value_int			: STD_LOGIC_VECTOR (31 downto 0) := ( others => '0');
signal dots					: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal enable_digit		: STD_LOGIC_VECTOR (7 downto 0) := x"0F";

begin

	display: display_7_segmenti port map (	clock 			=> clock,
														enable 			=> enable_int,
														reset 			=> reset,
														values 			=> value_int,
														dots 				=> dots,
														enable_digit 	=> enable_digit,
														anodes 			=> anodes,
														cathodes 		=> cathodes
												);
	
	reg_s : register_d_Re_Ar port map (   clock  => clock,
													  load 	=> enable_int,
													  reset  => reset,
													  d      => internal_s_long,
													  q 		=> value_int
											);
	reg_a : register_d_Re_Ar 	generic map (16)
										port map (    clock  => clock,
														  load 	=> enable_a,
														  reset  => reset,
														  d      => input,
														  q 		=> internal_a
												);										
	reg_b : register_d_Re_Ar 	generic map (16)
										port map (    clock  => clock,
														  load 	=> enable_b,
														  reset  => reset,
														  d      => input,
														  q 		=> internal_b
												);
	

	internal_s_long <= x"0000" & internal_S;
	
	carrySelect_addSub_onBoard: carrySelect_addSub generic map (M,P)
																	port map  ( A 			=> internal_a,
																				   B 			=> internal_b,
																					subtract => subtract,
																					S 			=> internal_s ,
																					overflow => overflow,
																					c_out 	=> c_out
									);
									
end Behavioral;

