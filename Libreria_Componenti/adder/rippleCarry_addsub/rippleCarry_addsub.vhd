---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : rippleCarry_addsub
--
-- unit name: rippleCarry_addsub.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       28/11/2018
--! @version    0.1
--! @brief      rippleCarry_adder è l'implementazione di un rippleCarry_addsub
--! @details
--!
--! <b>Dependencies:</b>\n
--!   full_adder
--!
-- modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Descrizione
--! Effettua la somma o la sottrazione di due stringhe di bit (A e B) di lunghezza width in ingresso.
--! Il bit SUBTRACT in ingresso sarà 0 in caso di una somma, 1 in caso di una differenza.
--! Il secondo operando del RCA (Y) è determinato dalla XOR tra SUBTRACT e B: se subtract = 1, ne farà il complemento.
--! Il subtract è portato anche come c_in del RCA, in modo tale che, se 1, B diventerà !B + 1 = -B, e dunque il RCA farà (A - B).
--! Se subtract è 0, Y sarà B e c_in sarà 0 (eseguirà A + B).

entity rippleCarry_addsub is 
    generic (   width   : NATURAL := 8      --! usato per definire il parallelismo del sommatore
    );
    port (
            A       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	    --! rippleCarry_addsub 
                                                                        --! input: addendo   
            B       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	--! rippleCarry_addsub 
                                                                        --! input: addendo
            subtract:   in  STD_LOGIC;                                  --! rippleCarry_addsub
                                                                        --! input: subtract sarà 0 per somma, 1 per differenza
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   	--! rippleCarry_addsub 
                                                                        --! output: somma
            overflow   :   out STD_LOGIC                             	    --! rippleCarry_addsub 
                                                                        --! output: carry
    );
end rippleCarry_addsub;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture structural of rippleCarry_addsub is

    component rippleCarry_adder 
    generic (   width   : NATURAL := 8
    );
    port (
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	   
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	
            c_in    :   in  STD_LOGIC;                              	
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);  
            c_out   :   out STD_LOGIC                                                    
    );
    end component;

    component overflow_checker 
    port (
            s_a:   in  STD_LOGIC;
            s_b:   in  STD_LOGIC;
            s_s:   in  STD_LOGIC;
            overflow: out STD_LOGIC
    );
    end component;

    signal subtract_vector: STD_LOGIC_VECTOR (width-1 downto 0) := (others => subtract); 
    signal Y_rca: STD_LOGIC_VECTOR (width-1 downto 0) := (B XOR subtract_vector); 

    signal c_out: STD_LOGIC := '0';
    signal S_ff: STD_LOGIC_VECTOR (width-1 downto 0) := (others => subtract); 

--================================================================================================
-- architecture structural of rippleCarry_addsub begin
--================================================================================================
    begin

        subtract_vector <= (others => subtract);
        Y_rca <=  (B XOR subtract_vector);

        S <= S_ff;
        
        rippleCarry: rippleCarry_adder generic map (
            width => width
        ) port map (
            X => A,
            Y => Y_rca,
            c_in => subtract,
            S => S_ff,
            c_out => c_out
        );

        overflow_checker_istance: overflow_checker port map (
            s_a => A(width-1),
            s_b => B(width-1), -- devo negarlo se subtract = 1 
            s_s => S_ff(width-1),
            overflow => overflow
        );

    end structural;
--================================================================================================
-- architecture structural of rippleCarry_addsub end
--================================================================================================
