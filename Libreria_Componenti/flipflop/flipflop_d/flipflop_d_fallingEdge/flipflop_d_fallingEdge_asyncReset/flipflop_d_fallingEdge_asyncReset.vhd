---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : flipflop_d_fallingEdge_asyncReset
--
-- unit name: flipflop_d_fallingEdge_asyncReset.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera
--! @date       13/11/2018
--! @version    0.1
--! @brief      flipflop_d_fallingEdge_asyncReset implementa un flipflop di tipo che commuta sul fronte di discesa.
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

--! use IEEE standar library and standard logics
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity flipflop_d_fallingEdge_asyncReset is 

    generic (   
                init_value      :   STD_LOGIC :='0';    --! define initial level of flipflop
                reset_level     :   STD_LOGIC :='0';    --! define reset level
                enable_level    :   STD_LOGIC := '1'    --! define enable level

    );
    
    port (  clock   :   in  STD_LOGIC;  --! flipflop_d_fallingEdge_asyncReset input    : clock signal for sync
            enable  :   in  STD_LOGIC;  --! flipflop_d_fallingEdge_asyncReset input    : enable signal
            reset   :   in  STD_LOGIC;  --! flipflop_d_fallingEdge_asyncReset input    : reset signal
            d       :   in  STD_LOGIC;  --! flipflop_d_fallingEdge_asyncReset input    : data input
            q       :   out STD_LOGIC   --! flipflop_d_fallingEdge_asyncReset output   : data output
    );
end flipflop_d_fallingEdge_asyncReset;

architecture behavioural of flipflop_d_fallingEdge_asyncReset is 

--! signal used for set the q output before the component receive the first clock event
signal q_temp   :   STD_LOGIC   :=init_value;

begin
    --! attach q_temp signal at q output
    q   <=  q_temp;

    -- exec this proces only when have a clock event or reset event
    ff : process(clock,reset)
        begin   
        -- reset the component status 
            if ( reset = reset_level ) then 
                q_temp <= init_value;
            -- check the falling edge event of clock and if component is enable 
            elsif ( falling_edge (clock) and (enable = enable_level) ) then
                q_temp <= d;
            end if;
        end process ff;
end behavioural;
