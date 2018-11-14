---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : flipflop_D_sync_reset
--
-- unit name: flipflop_D_sync_reset.vhDl
--     
-- file Description:
--! @file
--! @author     Gabriele Previtera
--! @date       13/11/2018
--! @version    0.1
--! @brief      flipflop_d_sync_reset implementa un flipflop di tipo che commuta sul fronte di salita.
--!             con segnale di enable e reset sincrono con clock
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <13/11/2018> <13/11/2018> <log>
--              create
---------------------------------------------------------------------------------------------------

library IEEE;
    use IEEE.STD_LOGIC_1164.all;


entity flipflop_d_sync_reset is 

     generic (   
                init_value      :   STD_LOGIC :='0';    --! define initial level of flipflop
                reset_level     :   STD_LOGIC :='0';    --! define reset level
                enable_level    :   STD_LOGIC := '1'    --! define enable level

    );
    
    port (  clock   :   in  STD_LOGIC;  --! flipflop_d_async_reset input    : clock signal for sync
            enable  :   in  STD_LOGIC;  --! flipflop_d_async_reset input    : enable signal
            reset   :   in  STD_LOGIC;  --! flipflop_d_async_reset input    : reset signal
            d       :   in  STD_LOGIC;  --! flipflop_d_async_reset input    : data input
            q       :   out STD_LOGIC   --! flipflop_d_async_reset output   : data output
    );
end flipflop_d_sync_reset;

architecture behavioral of flipflop_d_sync_reset is

--! signal used for set the q output before the component receive the first clock event
signal q_temp   :   STD_LOGIC := init_value;

begin
    --! attach q_temp signal at q output
    q <= q_temp;

    -- exec this proces only when have a clock event
    ff : process (clock)
        begin  
            -- check the rising edge event of clock and if component is enable 
            if ( rising_edge (clock) and (enable = enable_level) ) then
                if ( reset = reset_level ) then
                    q_temp <= init_value;
                elsif ( enable = enable_level ) then
                    q_temp <= d;
                end if;
            end if;
    end process ff;

end behavioral;


