---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : RCAddSub
--
-- unit name: RCAddSub.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      RCAddSub è l'implementazione di un Ripple_Carry Adder in grado di eseguire anche un'operazione di sottrazione
--! @details
--!
--! <b>Dependencies:</b>\n
--!   controlled_not
--!
-- modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Descrizione
--! Esegue la somma o la differenza di due stringhe di bit in ingresso. Il carry in ingresso (add_sub_n)
--! viene utilizzato per determinare l'operazione da eseguire (0=Somma, 1=Sottrazione).
entity RCAddSub is
	Generic(width : integer := 8);
    Port (  a : in  STD_LOGIC_VECTOR(width-1 downto 0);	--! RCAddSub input: addendo                                                           
			b : in  STD_LOGIC_VECTOR(width-1 downto 0);	--! RCAddSub input: addendo 
			add_sub_n : in STD_LOGIC;					--! RCAddSub input: carry in ingresso. Determina l'operazione da svolgere
            s : out  STD_LOGIC_VECTOR (width-1 downto 0);	--!RCAddSub output: somma
            ov : out  STD_LOGIC);						--! RCAddSub output: verifica condizione di overflow
end RCAddSub;

--================================================================================================
-- architecture declaration
--================================================================================================
architecture Structural of RCAddSub is

COMPONENT rippleCarryAdder
	Generic(width : integer := 8);
	PORT(
		a : IN std_logic_vector(width-1 downto 0);
		b : IN std_logic_vector(width-1 downto 0);
		cin : IN std_logic;          
		s : OUT std_logic_vector(width-1 downto 0);
		cout : OUT std_logic
		);
END COMPONENT;
--Componente che inverte l'input(complementa) quando invert=1
COMPONENT controlled_not
	Generic(width : integer := 8);
	PORT(
		input : IN std_logic_vector(width-1 downto 0);
		invert : IN std_logic;          
		output : OUT std_logic_vector(width-1 downto 0)
		);
END COMPONENT;

signal true_b : std_logic_vector(width -1 downto 0);
signal sign : std_logic;

--================================================================================================
-- architecture structural of RCAddSub begin
--================================================================================================
begin

-- Se add_sub_n=1 => invert=1, quindi true_b=!b (si fa il complemento), altrimenti true_b=b
xor_inversion : controlled_not generic map(
		width => width
	)port map(
		input => b,
		invert => add_sub_n,
		output => true_b
	);

rca: rippleCarryAdder generic map(
		width => width
	)port map(
		a => a,
		b => true_b,
		cin => add_sub_n,
		s => s,
		cout => sign	--carry in uscita utilizzato per il segno
	);

--se sommi due positivi e hai un risultato negativo oppure
--se sommi due negativi e hai un risultato positivo c'e' overflow

ov <= sign xor (a(width-1) and b(width-1));

end Structural;
--================================================================================================
-- architecture structural of RCAddSub end
--================================================================================================
