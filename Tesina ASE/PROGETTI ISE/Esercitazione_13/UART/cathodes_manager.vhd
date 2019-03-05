---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : cathodes_manager
--
--! unit name: cathodes_manager.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      cathodes_manager è l'implementazione di un gestore di catodi
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
    use IEEE.NUMERIC_STD.all;

--Descrizione
--! Permette di gestire l'abilitazione dei catodi associati ad ogni segmento omologo di ogni cifra(digit) di un display a 7 segmenti.\n 
--! Per accendere il giusto segmento è necessario che il catodo sia 0, poichè i catodi sono pilotati da segnali 0-attivi.
entity cathodes_manager is 
    port (  select_digit    : in    STD_LOGIC_VECTOR (2 downto 0);	--! cathodes_manager input: seleziona digit su cui mostrare la cifra
            values          : in    STD_LOGIC_VECTOR (31 downto 0);	--! cathodes_manager input: valore da mostrare (codifica esadecimale)
            dots            : in    STD_LOGIC_VECTOR (7 downto 0);	--! cathodes_manager input: punto da accendere per la parte decimale
            cathodes        : out   STD_LOGIC_VECTOR (7 downto 0)	--! cathodes_manager output: catodo da accendere
    );
end cathodes_manager;

--================================================================================================
--! architecture declaration
--================================================================================================
architecture behavioral of cathodes_manager is

constant zero       : STD_LOGIC_VECTOR(6 downto 0) := "1000000"; 
constant one        : STD_LOGIC_VECTOR(6 downto 0) := "1111001"; 
constant two        : STD_LOGIC_VECTOR(6 downto 0) := "0100100"; 
constant three      : STD_LOGIC_VECTOR(6 downto 0) := "0110000"; 
constant four       : STD_LOGIC_VECTOR(6 downto 0) := "0011001"; 
constant five       : STD_LOGIC_VECTOR(6 downto 0) := "0010010"; 
constant six        : STD_LOGIC_VECTOR(6 downto 0) := "0000010"; 
constant seven      : STD_LOGIC_VECTOR(6 downto 0) := "1111000"; 
constant eight      : STD_LOGIC_VECTOR(6 downto 0) := "0000000"; 
constant nine       : STD_LOGIC_VECTOR(6 downto 0) := "0010000"; 
constant a   	     : STD_LOGIC_VECTOR(6 downto 0) := "0001000"; 
constant b          : STD_LOGIC_VECTOR(6 downto 0) := "0000011"; 
constant c          : STD_LOGIC_VECTOR(6 downto 0) := "1000110"; 
constant d          : STD_LOGIC_VECTOR(6 downto 0) := "0100001"; 
constant e          : STD_LOGIC_VECTOR(6 downto 0) := "0000110"; 
constant f          : STD_LOGIC_VECTOR(6 downto 0) := "0001110";

alias digit_0 is values (3 downto 0);	--! i bit da 3 a 0 di values
alias digit_1 is values (7 downto 4);	--! i bit da 7 a 4 di values
alias digit_2 is values (11 downto 8);	--! i bit da 11 a 8 di values
alias digit_3 is values (15 downto 12);	--! i bit da 15 a 12 di values
alias digit_4 is values (19 downto 16);	--! i bit da 15 a 12 di values
alias digit_5 is values (23 downto 20);	--! i bit da 15 a 12 di values
alias digit_6 is values (27 downto 24);	--! i bit da 15 a 12 di values
alias digit_7 is values (31 downto 28);	--! i bit da 15 a 12 di values


signal cathodes_for_digit : STD_LOGIC_VECTOR (6 downto 0) := (others => '0');	--! 
signal nibble   : STD_LOGIC_VECTOR (3 downto 0 ) := (others => '0');	--! nibble di 4 bit di values

--=============================================================================
--! architecture behavioral of cathodes_manager begin
--=============================================================================
begin

	--! in base al valore di select_digit (contatore), posiziona la giusta digit (4 bit di values) in nibble
    digit_switching: process (select_digit,values)
        begin  
            case select_digit is 
                when "000" => nibble <= digit_0;
                when "001" => nibble <= digit_1;
                when "010" => nibble <= digit_2;
                when "011" => nibble <= digit_3;
				when "100" => nibble <= digit_4;
                when "101" => nibble <= digit_5;
                when "110" => nibble <= digit_6;
                when "111" => nibble <= digit_7;
                when others => nibble <= (others => '0');
            end case;
        end process;

	--! in base alla digit selezionata nel nibble, imposta cathodes_for_digit al valore da impostare per accendere i corrispondenti segmenti
    decoder : process (nibble)	
        begin  
            case nibble is
                when "0000" => cathodes_for_digit <= zero; 
                when "0001" => cathodes_for_digit <= one; 
                when "0010" => cathodes_for_digit <= two; 
                when "0011" => cathodes_for_digit <= three; 
                when "0100" => cathodes_for_digit <= four; 
                when "0101" => cathodes_for_digit <= five; 
                when "0110" => cathodes_for_digit <= six; 
                when "0111" => cathodes_for_digit <= seven; 
                when "1000" => cathodes_for_digit <= eight; 
                when "1001" => cathodes_for_digit <= nine; 
                when "1010" => cathodes_for_digit <= a; 
                when "1011" => cathodes_for_digit <= b; 
                when "1100" => cathodes_for_digit <= c; 
                when "1101" => cathodes_for_digit <= d; 
                when "1110" => cathodes_for_digit <= e; 
                when "1111" => cathodes_for_digit <= f;
                when others => cathodes_for_digit <= (others => '0');
            end case;
        end process;

	--multiplexer generico
    cathodes <=  not dots(to_integer(unsigned(select_digit))) & cathodes_for_digit;	--! bit del dot (negato perché 0 attivo) + la stringa selezionata
end behavioral;
--=============================================================================
--! architecture behavioral of cathodes_manager end
--=============================================================================
