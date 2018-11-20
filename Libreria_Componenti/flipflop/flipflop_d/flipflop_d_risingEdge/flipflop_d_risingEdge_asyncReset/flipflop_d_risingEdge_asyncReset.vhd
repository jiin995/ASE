---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : flipflop_d_risingEdge_asyncReset
--
-- unit name: flipflop_d_risingEdge_asyncReset.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera
--! @date       13/11/2018
--! @version    0.1
--! @brief      flipflop_d_risingEdge_asyncReset implementa un flipflop di tipo d che commuta sul fronte di salita.
--!             con segnale di enable e reset asincrono con clock
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

--! use IEEE standard library and standard logics
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

--! Detailed description of this 
--! flipflop d design element.
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

--! @brief Architecture definition of the flipflop d
--! @details More details about this flipflop d element.
architecture behavioural of flipflop_d_risingEdge_asyncReset is 

-- signal used for set the q output before the component receive the first clock event 
signal q_temp   :   STD_LOGIC   :=init_value;

begin
    -- assegno il segnale q_temp all'output q
    q   <=  q_temp;

    -- esegui questo processo solo quando c'è un evento di clock o di reset (sensitivity list)
    ff : process(clock,reset)
        begin   
        -- reset dello stato del componente 
            if ( reset = reset_level ) then 
                q_temp <= init_value;
            -- controlla il fronte di salita del clock e se il componente è abilitato 
            elsif ( rising_edge(clock) and (enable = enable_level) ) then
                q_temp <= d;
            end if;
        end process ff;
end behavioural;
