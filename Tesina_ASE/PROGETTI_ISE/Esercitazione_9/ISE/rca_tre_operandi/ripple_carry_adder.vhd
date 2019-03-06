---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : rca_tre_operandi
--
--! unit name: ripple_carry_adder.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      ripple_carry_adder è l'implementazione di un ripple_carry_adder
--! @details
--!
--! <b>Dependencies:</b>\n
--!   full_adder
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

--! Descrizione
--! Somma le 2 stringe di bit in ingresso (2 addendi ) e 1 bit (carry in ingresso). Caratterizzato da una
--! serie di full_adder in cascata che propagano il riporto.\n In uscita abbiamo il risultato della 
--! somma sul bit S e il riporto sul bit C.

entity ripple_carry_adder is 
    generic (   width   : NATURAL := 8      --! usato per definire il parallelismo del 
                                            --! ripple_carry_adder 
    );
    port (
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	    --! ripple_carry_adder 
                                                                        --! input: addendo   
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	--! ripple_carry_adder 
                                                                        --! input: addendo
            c_in    :   in  STD_LOGIC;                              	--! ripple_carry_adder input
                                                                        --! : carry in ingresso
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   	--! ripple_carry_adder 
                                                                        --! output: somma
            c_out   :   out STD_LOGIC                             	    --! ripple_carry_adder 
                                                                        --! output: carry
    );
end ripple_carry_adder;

--================================================================================================
--! architecture declaration
--================================================================================================

architecture structural of ripple_carry_adder is

    component full_adder is 
        port (
                x       :   in  STD_LOGIC;
                y       :   in  STD_LOGIC;
                c_in    :   in  STD_LOGIC;
                s       :   out STD_LOGIC;  
                c_out   :   out STD_LOGIC
        );
    end component;
     
    signal S_temp   : STD_LOGIC_VECTOR (width-1 downto 0) := ( others => '0' );
    signal carries   : STD_LOGIC_VECTOR (width downto 0) := ( others => '0' );
--================================================================================================
--! architecture structural of ripple_carry_adder begin
--================================================================================================
    begin
        S <= S_temp;    --! aggiorno S con il risultato effettivo
        
        carries (0) <= c_in;    --! il primo carry è quello in ingresso
        c_out <= carries(width); --! carrys(width) è l'ultimo carry delle somme, va in c_out

        ripple_carry_adder : for i in 0 to width-1 generate 
            f_adder: full_adder port map (
                                                x     => X(i),
                                                y     => Y(i),
                                                c_in  => carries(i),
                                                s     => S_temp(i),
                                                c_out => carries(i+1)
            );
        end generate ripple_carry_adder;
    end structural;
--================================================================================================
--! architecture structural of ripple_carry_adder end
--================================================================================================
