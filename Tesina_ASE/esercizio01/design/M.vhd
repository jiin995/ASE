---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : progetto
--
--! unit name: nome.vhd
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	descrizione
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
--! last changes: <04/03/2019> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Descrizione
--! Data una parola X di 6 bit in ingresso (X5X4X3X2X1X0), la macchina M restituisce una parola Y di 3 bit (Y2Y1Y0) che rappresenta la codifica binaria del numero di bit alti in X.\n
--! La macchina è stata implementata in modalità di descrizione di tipo “structural” tramite l'utilizzo di full-adder.

entity M is
    Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);	--!vettore in ingresso su 6 bit: X
           Y : out  STD_LOGIC_VECTOR (2 downto 0));	--!vettore in uscita su 3 bit: Y
end M;

--================================================================================================
--! architecture declaration
--================================================================================================

architecture structural of M is

--! componente full_adder utilizzato
	component full_adder is 
	  port (  X   :   in  STD_LOGIC;
				 Y   :   in  STD_LOGIC;
				 CIN :   in  STD_LOGIC;
				 S   :   out STD_LOGIC;
				 C   :   out STD_LOGIC

	  );
	end component;
	
--! segnali d'appoggio per i carry output dei full-adder
	signal C : STD_LOGIC_VECTOR ( 3 downto 0) :=( others => '0' );

--! segnali d'appoggio per le somme output dei full-adder
	signal S	: STD_LOGIC_VECTOR ( 3 downto 0) :=( others => '0' ); 

--================================================================================================
--! architecture structural begin
--================================================================================================

begin

--! definizione 4 full_adder utilizzati
	adder_0: full_adder port map (		X => X(0),
													Y => X(1),
													CIN => X(2),
													S => S(0),
													C => C(0) );

	adder_1: full_adder port map (		X => X(3),
													Y => X(4),
													CIN => X(5),
													S => S(1),
													C => C(1) );

	adder_2: full_adder port map (		X => S(0),
													Y => S(1),
													CIN => '0',
													S => S(2),
													C => C(2) );

	adder_3: full_adder port map (		X => C(0),
													Y => C(1),
													CIN => C(2),
													S => S(3),
													C => C(3) );
--! assegnazione delle uscite
	Y(0) <= S(2);
	Y(1) <= S(3);
	Y(2) <= C(3);

end structural;

--================================================================================================
--! architecture structural end
--================================================================================================
