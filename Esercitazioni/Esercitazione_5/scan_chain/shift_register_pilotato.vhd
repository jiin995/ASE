----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:07 10/11/2012 
-- Design Name: 
-- Module Name:    shift_register_pilotato - Behavioral 
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

-- Scan chain è un registro di width flipflop D multiplexati.
-- Quando scan_en = 0, il componente si comporta come un normale registro.
-- Quando scan_en = 1, diventa uno shift register che shifta ad ogni colpo di clock.
-- La direzione dello shift è regolata dal generic shift_direction (0 = right, 1 = left)

entity scan_chain is
    generic(
			  width : integer := 8;						-- dimensione del registro
			  shift_direction : std_logic := '1'	-- shift a destra
	 );
    Port ( 
           clock : in  STD_LOGIC;	-- segnale clock di tempificazione
           en : in  STD_LOGIC;		-- segnale di abilitazione 1-attivo
			  reset_n : in STD_LOGIC;	-- segnale di reset 0-attivo
			  scan_en : in  STD_LOGIC;										-- segnale di selezione modalità (0 = normale, 1 = controllo)
			  d_reg : in  STD_LOGIC_VECTOR (width-1 downto 0);		-- valore in ingresso nel registro
			  scan_in : in  STD_LOGIC;										-- primo valore scan-in 
           q_reg : out  STD_LOGIC_VECTOR (width-1 downto 0);	-- valore in uscita del registro
           scan_out : out  STD_LOGIC							-- ultimo valore scan-out
			  );
end scan_chain;

architecture behavioural of scan_chain is

signal connections : std_logic_vector(width downto 0);	-- vettore di appoggio per connessioni tra i diversi flip-flop

COMPONENT flipflopmux		-- flip flop multiplexato
	PORT(
		clock : IN std_logic;    
		en : IN std_logic;
		reset_n : in STD_LOGIC;
		scan_en : IN std_logic;   
		d : IN std_logic;
		scan_in : IN std_logic;   
		q: OUT std_logic
		);
END COMPONENT;

begin

shift_reg: for i in 0 to width-1 generate		-- genero due registri: uno per shift a destra, uno a sinistra

	shift_reg_left: if shift_direction = '1' generate	-- shift a sinistra
		ffd_with_mux: flipflopmux port map(		-- genero i flip flop multiplexati
			d => d_reg(i),		-- d del flipflop i è il bit i del registro
			clock => clock,
			en => en,
			reset_n => reset_n,
			scan_en => scan_en,
			scan_in => connections(i),	-- scan_in di i è il valore in uscita a i-1
			q => connections(i+1)		-- q sarà lo scan_in di i+1
			);
	   connections(0) <= scan_in;	-- il primo valore è scan_in
		scan_out <= connections(width); -- in uscita ho l'ultimo valore di connections
		q_reg <= connections(width downto 1); 
	end generate;
	
	shift_reg_right: if shift_direction = '0' generate	-- shift a destra
		ffd_with_mux: flipflopmux port map(
			d => d_reg(i),
			clock => clock,
			en => en,
			reset_n => reset_n,
			scan_en => scan_en,
			scan_in => connections(i+1),	-- scan_in di i è il valore in uscita a i+1
			q => connections(i)				-- q sarà lo scan_in di i-1	
			);
		connections(width) <= scan_in;
		scan_out <= connections(0);
		q_reg <= connections(width-1 downto 0);
	end generate;
	
end generate;


end behavioural;

