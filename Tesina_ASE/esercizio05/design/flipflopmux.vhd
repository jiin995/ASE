----------------------------------------------------------------------------------
--! Company: 
--! Engineer: Mirko Pennone, Simone Penna, Gabriele Previtera
--! 
--! Create Date:    11:23:00 02/08/2019 
--! Design Name: 
--! Module Name:    flipflopmux - Behavioral 
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

--! flipflopmux è un flip flop D con multiplexer: scan_en è il segnale di controllo del multiplexer,
--! se scan_en = 0 l'ingresso è d, se scan_en = 1 l'ingresso è scan_in.

entity flipflopmux is
    Port (  clock 	: in  STD_LOGIC;		--! clock
			en 		: in  STD_LOGIC;			--! enable
			reset_n : in STD_LOGIC;		--! reset
            scan_en : in  STD_LOGIC;		--! segnale di selezione del multiplexer per modalità (0 = normale, 1 = controllo)
			d 		: in  STD_LOGIC;				--! ingresso del flipflop in modalità normale
            scan_in : in  STD_LOGIC;		--! ingresso del flipflop in modalità controllo
            q 		: out  STD_LOGIC
	);			--! uscita del flipflop
end flipflopmux;

architecture structural of flipflopmux is

signal ff_input : std_logic;

COMPONENT flipflopd	--! flipflop D 
	PORT(	d : IN std_logic;
			enable : IN std_logic;
			reset : in STD_LOGIC;
			clock : IN std_logic;          
			q : OUT std_logic
	);
END COMPONENT;

COMPONENT mux2			--! multiplexer
	PORT(	in0 : IN std_logic;
			in1 : IN std_logic;
			sel : IN std_logic;          
			o : OUT std_logic
	);
END COMPONENT;

begin

mux: mux2 port map(	in0 => d,				--! primo ingresso: d
					in1 => scan_in,			--! secondo ingresso: scan_in
					sel => scan_en,			--! segnale di selezione: scan_en
					o => ff_input			--! l'uscita del multiplexer sarà l'input del ff
		);

flipflop_d: 
	flipflopd port map( d => ff_input,			--! ingresso del ff, sarà d o scan_in a seconda di scan_en
						enable => en,			--! enable
						reset => reset_n,		--! reset	
						clock => clock,			--! clock
						q => q					--! uscita del flip flop
				);

end Structural;

