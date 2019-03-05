---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : uart_PO_PC
--
--! unit name: register_d_Re_Ar.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      register_d_Re_Ar implementa un registro di flipflop di tipo d che commuta sul fronte di salita.
--!             con segnale di enable e reset asincrono con clock
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <16/11/2018> <16/11/2018> <log>
--!              create
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Descrizione
--! Registro di dimensione "dimension" che prende in ingresso un dato D e lo memorizza.
entity register_d_Re_Ar is 
    generic(    dimension       :   NATURAL :=8;        --! definisce il parallelismo del registro
                reset_level     :   STD_LOGIC :='0';    --! definisce il livello reset
                enable_level    :   STD_LOGIC := '1'    --! definisce il livello enable
    );

    port(   clock   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale di clock per sincronizzare
            enable  :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale enable
            reset   :   in  STD_LOGIC;	--! register_d_Re_Ar input    : segnale reset
            d       :   in  STD_LOGIC_VECTOR    (dimension-1 downto 0);	--! register_d_Re_Ar input    : inpput data 
            q       :   out STD_LOGIC_VECTOR    (dimension-1 downto 0)	--! register_d_Re_Ar input    : output data
    );
end register_d_Re_Ar;
--================================================================================================
--! architecture declaration
--================================================================================================
architecture behavioral of register_d_Re_Ar is 

--! segnale per poter inizializzare l'uscita del mio registro
signal Q_temp   :   STD_LOGIC_VECTOR    (dimension-1 downto 0) := (others => '0');

--================================================================================================
--! architecture behavioral of register_d_Re_Ar begin
--================================================================================================
begin

    Q <= Q_temp;    --! aggiorno il valore del registro

    ff : process (clock,reset)
        begin
            --! se il reset è pari al livello di reset, allora il contenuto del registro viene posto a 0
            if( reset = reset_level) then
                Q_temp <= ( others => '0');
            elsif rising_edge(clock) and (enable = enable_level) then   --! altrimenti assegnamo a Q_temp il valore di D al rising edge del clock
                Q_temp <= D;
            end if;
        end process ff;

end behavioral;
--================================================================================================
--! architecture behavioral of register_d_Re_Ar end
