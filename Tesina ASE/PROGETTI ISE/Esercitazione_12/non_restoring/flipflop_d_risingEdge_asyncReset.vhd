---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : non_restoring
--
--! unit name: flipflop_d_risingEdge_asyncReset.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      Implementazione di un flipflop D rising edge con reset asincrono.
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <14/11/2018> <13/11/2018> <log>
--!              create
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Descrizione
--! flipflop_d_risingEdge_asyncReset implementa un flipflop di tipo d che commuta sul fronte di salita, con segnale di enable e reset asincrono.

entity flipflop_d_risingEdge_asyncReset is 

    generic (   
                init_value      :   STD_LOGIC :='0';    --! definisce il livello iniziale del flipflop
                reset_level     :   STD_LOGIC :='0';    --! definisce il livello reset
                enable_level    :   STD_LOGIC := '1'    --! definisce il livello enable

    );
    
    port (  clock   :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : segnale di clock per sincronizzare
            enable  :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : segnale enable
            reset   :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : segnale reset
            d       :   in  STD_LOGIC;  --! flipflop_d_risingEdge_asyncReset input    : input data
            q       :   out STD_LOGIC   --! flipflop_d_risingEdge_asyncReset output   : output data
    );
end flipflop_d_risingEdge_asyncReset;

--================================================================================================
--! architecture declaration
--================================================================================================

architecture behavioural of flipflop_d_risingEdge_asyncReset is 

signal q_temp   :   STD_LOGIC   :=init_value; --! segnale temporaneo d'appoggio per definire il valore dell'uscita

--================================================================================================
--! architecture behavioural begin
--================================================================================================

begin

    --! assegno il segnale q_temp all'output q
    q   <=  q_temp;

    --! esegui questo processo solo quando c'è un evento di clock o di reset (sensitivity list, reset asincrono)
    ff : process(clock, reset,enable)

        begin   

        --! reset dello stato del componente 
            if ( reset = reset_level ) then 
                q_temp <= init_value;

            --! controlla il fronte di salita del clock e se il componente è abilitato: in tal caso assegna d a q_temp
            elsif ( rising_edge(clock) and (enable = enable_level) ) then
                q_temp <= d;

            end if;

        end process ff;

end behavioural;

--================================================================================================
--! architecture behavioural end
--================================================================================================
