---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : S
--
--! unit name: S.vhd
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       25/10/2018
--! @version    0.1
--! @brief     	Implementazione della macchina S in modalità di descrizione di tipo “structural”
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
--! last changes: <21/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Descrizione
--!Si progetti una macchina S che, date 6 stringhe di 3 bit ciascuna in ingresso (A, B, C, D, E, F), rappresentanti la codifica
--!binaria di numeri interi positivi, ne calcoli la somma W espressa su 6 bit.
--!La macchina S deve essere progettata per composizione di macchine utilizzando la macchina M progettata al punto 5)
--!e componenti full-adder, opportunamente collegati.

entity S is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);	--! S input su 3 bit : A
           B : in  STD_LOGIC_VECTOR (2 downto 0);	--! S input su 3 bit : B
           C : in  STD_LOGIC_VECTOR (2 downto 0);	--! S input su 3 bit : C
           D : in  STD_LOGIC_VECTOR (2 downto 0);	--! S input su 3 bit : D
           E : in  STD_LOGIC_VECTOR (2 downto 0);	--! S input su 3 bit : E
           F : in  STD_LOGIC_VECTOR (2 downto 0);	--! S input su 3 bit : F
	   W : out STD_LOGIC_VECTOR (5 downto 0)	--! S output su 6 bit : W
			);
			  
end S;

--================================================================================================
--! architecture declaration
--================================================================================================


architecture structural of S is

	component full_adder is 
	  port (  X   :   in  STD_LOGIC;
				 Y   :   in  STD_LOGIC;
				 CIN :   in  STD_LOGIC;
				 S   :   out STD_LOGIC;
				 C   :   out STD_LOGIC
			);
	end component;
	
	component M is
    Port ( X : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : out  STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
--! segnali d'appoggio per le uscite su 3 bit delle tre macchine M
	signal Y0 : STD_LOGIC_VECTOR ( 2 downto 0) :=( others => '0' );
	signal Y1 : STD_LOGIC_VECTOR ( 2 downto 0) :=( others => '0' );
	signal Y2 : STD_LOGIC_VECTOR ( 2 downto 0) :=( others => '0' );

--! segnali d'appoggio per i carry in uscita dei tre full_adders
	signal CARRY : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' );

--!  segnali d'appoggio per le somme in uscita dei tre full_adders
	signal S	: STD_LOGIC_VECTOR (5 downto 0) :=( others => '0' ); 
	
--! segnali d'appoggio per conservare le cifre di stesso peso degli ingressi A, B, C, D, E, F (peso 0, 1 and 2)
	signal I0 : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' ); 
	signal I1 : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' ); 
	signal I2 : STD_LOGIC_VECTOR ( 5 downto 0) :=( others => '0' ); 

--================================================================================================
--! architecture structural begin
--================================================================================================

begin

	--! assegnazione segnali d'appoggio Ii
	I0 <= (0 => A(0), 1 => B(0), 2 => C(0), 3 => D(0), 4 => E(0), 5 => F(0));
	I1 <= (0 => A(1), 1 => B(1), 2 => C(1), 3 => D(1), 4 => E(1), 5 => F(1));
	I2 <= (0 => A(2), 1 => B(2), 2 => C(2), 3 => D(2), 4 => E(2), 5 => F(2));

	--! definizione 3 macchine M
	M_0: M port map (	X => I0,
							Y => Y0
						);

	M_1: M port map (	X => I1,
							Y => Y1
						);
						
	M_2: M port map (	X => I2,
							Y => Y2
						);
					
	--! definizione 6 full_adder	
	FA_0: full_adder port map (		X => Y0(1),
												Y => Y1(0),
												CIN => '0',
												S => S(0),
												C => CARRY(0)
										);
										
	FA_1: full_adder port map (		X => Y2(0),
												Y => Y1(1),
												CIN => Y0(2),
												S => S(1),
												C => CARRY(1)
										);
										
	FA_2: full_adder port map (		X => S(1),
												Y => CARRY(0),
												CIN => '0',
												S => S(2),
												C => CARRY(2)
										);
										
	FA_3: full_adder port map (		X => Y1(2),
												Y => Y2(1),
												CIN => CARRY(1),
												S => S(3),
												C => CARRY(3)
										);
										
	FA_4: full_adder port map (		X => S(3),
												Y => CARRY(2),
												CIN => '0',
												S => S(4),
												C => CARRY(4)
										);
										
	FA_5: full_adder port map (		X => Y2(2),
												Y => CARRY(3),
												CIN => CARRY(4),
												S => S(5),
												C => CARRY(5)
										);
									
	W <= (0 => Y0(0),1 => S(0),2 => S(2),3 => S(4),4 => S(5),5 => CARRY(5)); --! assegnazione uscita


end structural;

--================================================================================================
--! architecture structural end
--================================================================================================

