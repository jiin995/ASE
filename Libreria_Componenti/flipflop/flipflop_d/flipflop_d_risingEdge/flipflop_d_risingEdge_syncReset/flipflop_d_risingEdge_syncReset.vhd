---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : flipflop_d_risingEdge_syncReset
--
-- unit name: flipflop_d_risingEdge_syncReset.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      Implementazione di un flipflop D rising edge con reset sincrono.
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <14/11/2018> <13/11/2018> <log>
--              create
---------------------------------------------------------------------------------------------------

library IEEE;
    use IEEE.STD_LOGIC_1164.all;

--Descrizione
--! flipflop_d_risingEdge_syncReset implementa un flipflop di tipo d che commuta sul fronte di salita, con segnale di enable e reset sincrono.


entity flipflop_d_risingEdge_syncReset is 

    generic (   
                init_value      :   STD_LOGIC :='0';    --! definisce il livello iniziale del flipflop
                reset_level     :   STD_LOGIC :='0';    --! definisce il livello reset
                enable_level    :   STD_LOGIC := '1'    --! definisce il livello enable

    );
    
    port (  clock   :   in  STD_LOGIC;  --! flipflop_d_risingEdge_syncReset input    : segnale di clock per sincronizzare
            enable  :   in  STD_LOGIC;  --! flipflop_d_risingEdge_syncReset input    : segnale enable
            reset   :   in  STD_LOGIC;  --! flipflop_d_risingEdge_syncReset input    : segnale reset
            d       :   in  STD_LOGIC;  --! flipflop_d_risingEdge_syncReset input    : input data
            q       :   out STD_LOGIC   --! flipflop_d_risingEdge_syncReset output   : output data
    );
end flipflop_d_risingEdge_syncReset;
--================================================================================================
-- architecture declaration
--================================================================================================

architecture behavioral of flipflop_d_risingEdge_syncReset is

signal q_temp   :   STD_LOGIC   :=init_value; -- segnale temporaneo d'appoggio per definire il valore dell'uscita

--================================================================================================
-- architecture behavioural begin
--================================================================================================

begin

    -- assegno il segnale q_temp all'output q
    q   <=  q_temp;


    -- esegui questo processo solo quando c'è un evento di clock (sensitivity list, reset sincrono)
    ff : process (clock)

        begin  

            -- controlla il fronte di salita del clock e se il componente è abilitato: in tal caso assegna d a q_temp
            if ( rising_edge (clock) and (enable = enable_level) ) then
                if ( reset = reset_level ) then
                    q_temp <= init_value;	-- effettua il reset
                elsif ( enable = enable_level ) then
                    q_temp <= d;		-- assegna d a q
                end if;
            end if;
    end process ff;

end behavioral;

--================================================================================================
-- architecture behavioural end
--================================================================================================
