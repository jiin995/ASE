---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : BoothMultiplier
--
--! unit name: counter_UpMod2n_Re_Sr.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      counter_UpMod2n_Re_Sr è l'implementazione di un contatore modulo 2^n
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothing
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
   

--Descrizione
--! Contatore modulo 2 alla N.
--! Il conteggio viene effettuato sul fronte di salita del clock e il reset è sincrono.

entity counter_UpMod2n_Re_Sr is 
    GENERIC (   n               : NATURAL :=1;
                enable_level    : STD_LOGIC :='1'
    );
    PORT(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR ((n-1) downto 0)    		--! COUNT output
    );
end entity;

architecture behavioral of counter_UpMod2n_Re_Sr is

--Segnali temporanei, per l'iniziallizazione del componente
signal COUNTS_temp      : STD_LOGIC_VECTOR ((n-1) downto 0) := (others => '0');
signal count_hit_temp   : STD_LOGIC := '0';

--Massimo valore di conteggio 
constant max_value : NATURAL :=((2**n)-1);

--=============================================================================
--! architecture behavioral of counter_UpMod2n_Re_Sr begin
--=============================================================================

begin 
    
    COUNTS <= COUNTS_temp;
    count_hit <= count_hit_temp;

    count : process (clock)
        variable counter : integer range 0 to max_value := 0;

        begin
            if (rising_edge(clock) ) then 
					--! Reset
					if (reset_n = '0') then 
                    counter := 0;
                    count_hit_temp <= '0';
                    COUNTS_temp <= ( others => '0'); 
					--! Abilitato
                elsif(enable = enable_level) then 
						--! Raggiunto massimo valore di conteggio
                    if counter = max_value then 
                        count_hit_temp <= '1';
                        counter := 0;
                        COUNTS_temp <= ( others => '0'); 
                    else 
                        count_hit_temp <= '0';
                        counter := counter + 1;
                        COUNTS_temp <= std_logic_vector(to_unsigned(counter, COUNTS_temp'length));
                    end if;
                end if;
            end if;
        end process;

end behavioral;

--=============================================================================
--! architecture behavioral of counter_UpMod2n_Re_Sr end
--=============================================================================
