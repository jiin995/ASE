---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : counter_mod2n
--
-- unit name: counter_mod2n.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       25/11/2018
--! @version    0.1
--! @brief      counter_mod2n è l'implementazione di un contatore modulo 2^n
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothing
--!
-- modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

--Descrizione
--! Conta il numero di impulsi che sono stati applicati in ingresso (sul fronte di salita del clock).\n
--! Una volta raggiunto il valore massimo (2**n)-1, il conteggio riparte da 0.

entity counter_mod2n is

    generic (   n               :   NATURAL := 1;	--! usato per definire il valore massimo (2**n)-1 di fine conteggio.
                enable_level    :   std_logic := '1'	--! definisce il livello enable
    );
    Port ( clock : in  STD_LOGIC;	--! segnale di clock
           reset_n : in  STD_LOGIC;	--! se portato a 0, il contatore è resettato
		   enable : in STD_LOGIC;	--! abilita il contatore se è pari a enable_level
           counter : out  STD_LOGIC_VECTOR (n-1 downto 0)	--! n bit del contatore
		   );

end counter_mod2n;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture Behavioral of counter_mod2n is

	signal c : STD_LOGIC_VECTOR ((n-1) downto 0) := (others => '0');	-- segnale d'appoggio per contare

	constant max_value : NATURAL := ((2**n)-1);	-- valore massimo del contatore, superato questo valore si resetta

--=============================================================================
-- architecture behavioral of counter_mod2n begin
--=============================================================================

begin

	counter_process: process(clock, reset_n, c)	-- contatore ASINCRONO, il reset non dipende dal clock

	begin
		
		counter <= c;	-- assegnazione a counter del segnale d'appoggio
		
		if reset_n = '0' then
			c <= (others => '0');	-- resetta il contatore
		elsif rising_edge(clock) AND enable = enable_level then	-- al rising edge del clock, se attivo
			if unsigned(c) = max_value then
				c <= (others => '0');	-- se si è raggiunto il valore massimo, si resetta
			else
				c <= std_logic_vector(unsigned(c) + 1);	-- altrimenti si incrementa c
			end if;
		end if;

	end process;

end Behavioral;

--=============================================================================
-- architecture behavioral of counter_mod2n end
--=============================================================================