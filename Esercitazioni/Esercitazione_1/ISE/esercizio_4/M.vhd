---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : M
--
-- unit name: M.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       25/10/2018
--! @version    0.1
--! @brief     	Implementazione della macchina M in modalità di descrizione di tipo “data-flow”
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <21/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Descrizione
--! Data una parola X di 6 bit in ingresso (X5X4X3X2X1X0), la macchina M restituisce una parola Y di 3 bit (Y2Y1Y0) che rappresenta la codifica binaria del numero di bit alti in X.\n
--! La macchina è stata implementata in modalità di descrizione di tipo “data-flow”.

entity M is
    Port ( x0 : in  STD_LOGIC;	--! M input : x0
           x1 : in  STD_LOGIC;	--! M input : x1
           x2 : in  STD_LOGIC;	--! M input : x2
           x3 : in  STD_LOGIC;	--! M input : x3
           x4 : in  STD_LOGIC;	--! M input : x4
           x5 : in  STD_LOGIC;	--! M input : x5
           y0 : out  STD_LOGIC;	--! M output : y0
           y1 : out  STD_LOGIC;	--! M output : y1
           y2 : out  STD_LOGIC); --! M output : y2
end M;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture Dataflow of M is

--! definizione uscite d'appoggio temporanee
signal y0_temp : std_logic := '0'; --! segnale d'appoggio y0 temporaneo
signal y1_temp : std_logic := '0'; --! segnale d'appoggio y1 temporaneo
signal y2_temp : std_logic := '0'; --! segnale d'appoggio y2 temporaneo

--! definizione nodi della rete generati nell'esercizio 3 (con rugged.script)
signal n10 : std_logic := '0'; --! nodo n10 della rete
signal n3 : std_logic := '0'; 	--! nodo n3 della rete
signal n4 : std_logic := '0'; 	--! nodo n4 della rete
signal n5 : std_logic := '0'; 	--! nodo n5 della rete
signal n6 : std_logic := '0'; 	--! nodo n6 della rete
signal n7 : std_logic := '0'; 	--! nodo n7 della rete
signal n8 : std_logic := '0'; 	--! nodo n8 della rete
signal n9 : std_logic := '0'; 	--! nodo n9 della rete

--================================================================================================
-- architecture dataflow begin
--================================================================================================

begin

--! aggiornamento nodi
n10 <= x3 AND x2;
n3 <= ( x5 AND (NOT x4) ) OR ( (NOT x5) AND x4);
n4 <= ( (NOT x3) AND (NOT n3) ) OR ( x3 AND n3 );
n5 <= ( (NOT x2) AND (NOT n4) ) OR ( x2 AND n4 );
n6 <= x0 OR x1;
n8 <= x2 OR x3;
n9 <= x1 AND x0;

--! aggiornamento uscita d'appoggio y0
y0_temp <= ( (NOT n5) AND n6 AND (not n9) )
				OR ( n5 AND n9 )
				OR ( n5 AND (NOT n6) );
				
--! aggiornamento nodo n7 (richiede y0_temp)
n7 <= (x5 AND (NOT y0_temp)) OR n10;

--! aggiornamento uscite d'appoggio y2 e y3
y2_temp <= ( x5 AND (NOT y0_temp) AND n10 )
				OR ( x4 AND n8 AND n9 )
				OR ( x4 AND n6 AND n7 )
				OR ( n7 AND n9 );
y1_temp <= ( x4 AND (NOT n3) AND (NOT n6) AND (NOT n10) )
				OR ( x4 AND (NOT n3) AND n9 AND n10 )
				OR ( (NOT y2_temp) AND (NOT y0_temp) AND n8 )
				OR ( (NOT y2_temp) AND n3 AND n6 )
				OR ( (NOT y2_temp) AND n10 )
				OR ( (NOT y2_temp) AND n9 );

--! aggiornamento uscite
y0 <= y0_temp;
y1 <= y1_temp;
y2 <= y2_temp;

end Dataflow;

--================================================================================================
-- architecture dataflow end
--================================================================================================

