---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : rippleCarry_addsub
--
-- unit name: rippleCarry_addsub.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	sommatore che effettua sia addizione che sottrazione di due operandi (settando subtract)
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
use IEEE.STD_LOGIC_1164.all;

--! Descrizione
--! Effettua la somma o la sottrazione di due stringhe di bit (A e B) di lunghezza width in ingresso.
--! Il bit SUBTRACT in ingresso sarà 0 in caso di una somma, 1 in caso di una differenza.
--! Il secondo operando del RCA (Y) è determinato dalla XOR tra SUBTRACT e B: se subtract = 1, ne farà il complemento.
--! Il subtract è portato anche come c_in del RCA, in modo tale che, se 1, B diventerà !B + 1 = -B, e dunque il RCA farà (A - B).
--! Se subtract è 0, Y sarà B e c_in sarà 0 (eseguirà A + B).
--! L'overflow è alto se ho una somma di numeri positivi e risultato negativo, 
--! somma di numeri negativi e risultato positivo, differenza positivo e negativo con
--! risultato negativo o differenza negativo e positivo con risultato positivo.
--! Usiamo una macchina overflow_checker che fa tale controllo usando i bit più
--! significativi (segno) di A, B, S e il bit di subtract.

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
                                                                        --! output: risultato
            overflow   :   out STD_LOGIC                             	--! rippleCarry_addsub 
                                                                        --! output: condizione di overflow
    );
end rippleCarry_addsub;

--================================================================================================
--! architecture declaration
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
                a:   in  STD_LOGIC;
                b:   in  STD_LOGIC;
                subtract: in STD_LOGIC;
                s:   in  STD_LOGIC;
                overflow: out STD_LOGIC
        );
    end component;

    signal S_ff: STD_LOGIC_VECTOR (width-1 downto 0) := (others => '0');   --! segnale temporaneo per l'uscita

    signal subtract_vector: STD_LOGIC_VECTOR (width-1 downto 0) := (others => '0'); --! vettore per il complemento
    signal B_complementato: STD_LOGIC_VECTOR (width-1 downto 0) := (others => '0');       --! vettore in cui verrà inserito B complementato (caso sottrazione)

--================================================================================================
--! architecture structural of rippleCarry_addsub begin
--================================================================================================
    begin
    
        S <= S_ff;

        subtract_vector <= (others => subtract);    --! il vettore viene riempito col valore di subtract
        B_complementato <=  (B XOR subtract_vector);    --! se subtract è 1 (subtract vector tutti 1), 
                                                    --! complemento B con la XOR, altrimenti se è 0
                                                    --! avrò B_complementato = B (non complemento).
        
        rippleCarry: rippleCarry_adder generic map (
            width => width
        ) port map (
            X => A,
            Y => B_complementato,
            c_in => subtract,   --! sarà 1 se ho sottrazione (poiché ho già complementato B in B_complementato,
                                --! se sommo a 1 ottengo l'opposto e faccio una sottrazione), 0 se somma normale.
            S => S_ff,
            c_out => open       --! il riporto in uscita non viene utilizzato
        );

        --! l'overflow è alto se ho una somma di numeri positivi e risultato negativo, 
        --! somma di numeri negativi e risultato positivo, differenza positivo e negativo con
        --! risultato negativo o differenza negativo e positivo con risultato positivo.
        --! Usiamo una macchina overflow_checker che fa tale controllo usando i bit più
        --! significativi (segno) di A, B, S e il bit di subtract.

        oc:  overflow_checker port map (
            a => A(width-1),
            b => B(width-1),
            subtract => subtract,
            s => S_ff(width-1),
            overflow => overflow
        );


    end structural;
--================================================================================================
--! architecture structural of rippleCarry_addsub end
--================================================================================================
