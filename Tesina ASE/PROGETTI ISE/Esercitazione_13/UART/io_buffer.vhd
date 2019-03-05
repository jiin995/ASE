---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : uart
--
-- unit name: io_buffer.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	buffer utilizzato nell'UART in fase di trasmissione e ricezione
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

--! buffer per l'UART che segnala il suo stato: che può essere vuoto o pieno
--! flag : 0 il registro è vuoto ci si può scrivere all'interno
--			 1 il registro è pieno si può consumare il dato all'interno

entity io_buffer is 
    generic ( width : NATURAL := 8 );
    port    ( clock     : in  STD_LOGIC;
              reset     : in  STD_LOGIC;
              clr_flag  : in  STD_LOGIC;			--! setto lo stato del buffer come vuoto
              set_flag  : in  STD_LOGIC;			--! setta lo stato del buffer come pieno
              din       : in  STD_LOGIC_VECTOR ( (width - 1) downto 0 );
              flag      : out  STD_LOGIC;			--! segnala lo stato del buffer
              dout      : out STD_LOGIC_VECTOR ( (width - 1) downto 0)
    );
end io_buffer; 

architecture behavioral of io_buffer is 

    signal buf_reg, buf_next    : STD_LOGIC_VECTOR ( (width -1) downto 0) :=(others => '0');
    signal flag_reg, flag_next  : STD_LOGIC := '0' ;

begin
--! evoluzione dello stato
    process (clock, reset) begin    --! reset asincrono
        if (reset = '1' ) then
            buf_reg     <= (others => '0');
            flag_reg    <= '0';
        elsif (rising_edge(clock)) then
            buf_reg     <= buf_next;
            flag_reg    <= flag_next;
        end if;
    end process;

    process (buf_reg,flag_reg,clr_flag, set_flag, din ) begin
        --! se non ci sono cambiamenti rimango nello stato precedente
        buf_next    <= buf_reg;
        flag_next   <= flag_reg;

        if (set_flag = '1') then
            buf_next    <= din;
            flag_next   <= '1';
        elsif ( clr_flag = '1' ) then
            flag_next   <= '0';
        end if;
    end process;

    dout    <= buf_reg;
    flag    <= flag_reg; 

end behavioral;
