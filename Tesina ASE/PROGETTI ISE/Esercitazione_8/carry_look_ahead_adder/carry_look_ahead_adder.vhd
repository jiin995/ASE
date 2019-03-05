---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : carry_look_ahead_adder
--
--! unit name: carry_look_ahead_adder.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      Sommatore Carry Lokk-Ahead
--! @details
--!
--! <b>Dependencies:</b>\n
--!   half_adder
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity carry_look_ahead_adder is 
    generic (   width     :   NATURAL := 8
    );
    port (  --! carry_look_ahead_adder input   : carry ingresso
            c_in   :   in STD_LOGIC;  
            --! carry_look_ahead_adder inputs  : primo addendo
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! carry_look_ahead_adder inputs  : secondo addendo
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
            --! carry_look_ahead_adder output  : carry uscita
            c_out   :   out STD_LOGIC ;
            --! carry_look_ahead_adder outputs : somma
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0)
    );
end carry_look_ahead_adder;

architecture structural of carry_look_ahead_adder is  

    component full_adder is 
        port (
                x   :   in  STD_LOGIC;
                y   :   in  STD_LOGIC;
                c_in :   in  STD_LOGIC;
                s   :   out STD_LOGIC;  
                c_out   :   out STD_LOGIC
        );
    end component;

    component propagation_generation_calculator is
        generic (   width : NATURAL :=width
        );
        port (  X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
                Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
                G       :   out  STD_LOGIC_VECTOR (width-1 downto 0);    
                P       :   out  STD_LOGIC_VECTOR (width-1 downto 0) 
        );
    end component;


    signal G    :   STD_LOGIC_VECTOR ((width-1) downto 0);    --!Segnale per conservare le condizioni di generazione
    signal P    :   STD_LOGIC_VECTOR ((width-1) downto 0);    --!Segnale per conservare le condizioni di propagazione
    signal C  :   STD_LOGIC_VECTOR ((width) downto 0) := (others => '0'); --! Segnale per conservare i carry calcolati dal carry_look_ahead
    signal S_TEMP       :   STD_LOGIC_VECTOR  ((width-1) downto 0) := (others => '0'); --! Segnale di supporto per la somma

    signal C_null       :   STD_LOGIC_VECTOR ((width-1) downto 0) := (others => '0'); --!Segnale per collegare a niete le uscite del fulladder

begin

    C(0) <= c_in;
    c_out <= C(width); --! per rendere la struttura generica

    S <= S_TEMP;

    --! Propagation/Generation calculator: rete che calcola le condizioni di propagazione e generazione
    prop_gen_calculator: propagation_generation_calculator port map ( X => X,
                                                                Y => Y,
                                                                G => G,
                                                                P => P
    );

    --! Carry Look Ahead: rete che calcola i carry in ingresso agli stadi successivi con le condizioni di gen/prop
    carry_look_ahead: for i in 0 to (width-1) generate
        carry_ahead : 
                    C(i+1) <= G(i) or (P(i) and C(i));
    end generate carry_look_ahead;

    --! Full Adders: rete di full adder che fa la somma tra i valori x, y e i carry in ingresso
    full_adders: for i in 0 to (width-1) generate
        fullAdder : 
                    full_adder port map (   x => X(i),
                                            y => Y(i),
                                            c_in => C (i),
                                            s => S_TEMP(i)
                                            --c_out => C(i) // non è necessario, è già stato calcolato con il propagation/generation calculator

                    );
    end generate full_adders;

end structural;
