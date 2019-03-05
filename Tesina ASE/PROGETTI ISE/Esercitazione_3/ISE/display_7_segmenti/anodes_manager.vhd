---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : anodes_manager
--
--! unit name: anodes_manager.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      anodes_manager è l'implementazione di un gestore di anodi
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothing
--!
--! modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Descrizione
--!Permette di gestire gli anodi associati ad ogni cifra(digit) di un display a 7 segmenti.\n Per accendere la cifra giusta(digit) è necessario che l'anodo sia 0, poichè gli anodi sono pilotati da segnali 0-attivi.

entity anodes_manager is 
    port (  select_digit    :   in  STD_LOGIC_VECTOR (1 downto 0) ;	--! anodes_manager input: seleziona digit
            enable_digit    :   in  STD_LOGIC_VECTOR (3 downto 0) ;	--! anodes_manager input: abilita digit
            anodes          :   out STD_LOGIC_VECTOR (3 downto 0)	--! anodes_manager output: digit da accendere
    );
end anodes_manager;

--================================================================================================
--! architecture declaration
--================================================================================================
architecture dataflow of anodes_manager is   

signal anodes_switching : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
--=============================================================================
--! architecture dataflow of anodes_manager begin
--=============================================================================
begin
	--! tutti i bit sono alti all'inizio, poichè essendo gli anodi pilotati da un segnale 0-attivo così sono spente
	--! and negata di anodes_switching e enable_digit, solo se entrambi sono alti attivo l'anodo (negato perché 0-attivo
    anodes <= not anodes_switching OR not enable_digit; 
    --! non è altro che una lookuptable!
    with select_digit select anodes_switching <= 	--! imposta anodes_switching in base alla digit selezionata
        x"1"    when "00",
        x"2"    when "01",
        x"4"    when "10",
        x"8"    when "11",
        (others => '0')    when others;

end dataflow;
--=============================================================================
--! architecture dataflow of anodes_manager end
--=============================================================================