---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : anodes_manager
--
-- unit name: anodes_manager.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	anodees_manager per il display a 7 segmenti
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Descrizione
--!Permette di gestire gli anodi associati ad ogni cifra(digit) di un display a 7 segmenti.\n Per accendere la cifra giusta(digit) è necessario che l'anodo sia 0, poichè gli anodi sono pilotati da segnali 0-attivi.

entity anodes_manager is 
    port (  select_digit    :   in  STD_LOGIC_VECTOR (2 downto 0) ;	--! anodes_manager input: seleziona digit
            enable_digit    :   in  STD_LOGIC_VECTOR (7 downto 0) ;	--! anodes_manager input: abilita digit
            anodes          :   out STD_LOGIC_VECTOR (7 downto 0)	--! anodes_manager output: digit da accendere
    );
end anodes_manager;

--================================================================================================
--! architecture declaration
--================================================================================================
architecture dataflow of anodes_manager is   

signal anodes_switching : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
--=============================================================================
--! architecture dataflow of anodes_manager begin
--=============================================================================
begin
	--! tutti i bit sono alti all'inizio, poichè essendo gli anodi pilotati da un segnale 0-attivo così sono spente
	--! and negata di anodes_switching e enable_digit, solo se entrambi sono alti attivo l'anodo (negato perché 0-attivo
    anodes <= not anodes_switching OR not enable_digit; 
    --! non è altro che una lookuptable!
    with select_digit select anodes_switching <= 	--! imposta anodes_switching in base alla digit selezionata
        x"01"    when "000",
        x"02"    when "001",
        x"04"    when "010",
        x"08"    when "011",
		  x"10"	  when "100",
		  x"20"	  when "101",
		  x"40"	  when "110",
		  x"80"	  when "111",
    (others => '0')    when others;

end dataflow;
--=============================================================================
--! architecture dataflow of anodes_manager end
--=============================================================================