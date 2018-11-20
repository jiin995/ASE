---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : counter_UpMod2n_Re_Sr
--
-- unit name: counter_UpMod2n_Re_Sr.vhdl
--     
-- file description:
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
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
   
--Descrizione
--! Conta il numero di impulsi che sono stati applicati in ingresso (sul fronte di salita del clock).\n
--! Una volta raggiunto il valore massimo (2**n)-1, il conteggio riparte da 0.    
entity counter_UpMod2n_Re_Sr is 
    generic (   n               : NATURAL :=1;	--! usato per definire il valore massimo (2**n)-1 di fine conteggio.
                enable_level    : STD_LOGIC :='1'	--! definisce il livello enable
    );
    port(   enable      : in STD_LOGIC ;                                --! counter_UpMod2n_Re_Sr input: segnale enable
            reset_n     : in STD_LOGIC;                                 --! counter_UpMod2n_Re_Sr input: segnale reset
            clock       : in STD_LOGIC;                                 --! counter_UpMod2n_Re_Sr input: segnale di clock per sincronizzare
            count_hit   : out STD_LOGIC;                                --! counter_UpMod2n_Re_Sr output: segnale di fine conteggio
            COUNTS      : out STD_LOGIC_VECTOR ((n-1) downto 0)    --! counter_UpMod2n_Re_Sr output: conteggio in uscita
    );
end entity;
--================================================================================================
-- architecture declaration
--================================================================================================
architecture behavioral of counter_UpMod2n_Re_Sr is

signal COUNTS_temp      : STD_LOGIC_VECTOR ((n-1) downto 0) := (others => '0');
signal count_hit_temp   : STD_LOGIC := '0';

constant max_value : NATURAL :=((2**n)-1);
--=============================================================================
-- architecture behavioral of counter_UpMod2n_Re_Sr begin
--=============================================================================
begin 
    COUNTS <= COUNTS_temp;
    count_hit <= count_hit_temp;

    count : process (clock)
        variable counter : integer range 0 to max_value := 0;

        begin
            if (rising_edge(clock) ) then 
                if (reset_n = '0') then 
                    counter := 0;
                    count_hit_temp <= '0';
                    COUNTS_temp <= ( others => '0'); 
                elsif(enable = enable_level) then 
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
-- architecture behavioral of counter_UpMod2n_Re_Sr end
--=============================================================================
