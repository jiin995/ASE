---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : RobertsonMultiplier
--
-- unit name: carrySelect_cell.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Singolo blocco di un sommatore carry Select
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

entity carrySelect_cell is 
    generic (   width   : NATURAL := 4
    );
    port (
            A       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
            B       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
            c_in    : in    STD_LOGIC ;
            S       : out   STD_LOGIC_VECTOR ((width-1) downto 0);
            c_out   : out   STD_LOGIC
    );
end carrySelect_cell;

--================================================================================================
--! architecture declaration
--================================================================================================
--! Componenti necessari :   
--!  - mux2_1 con parallelismo variabile
--!  - ripple carry adder
architecture structural of carrySelect_cell is 
    component mux2_1 is 
            generic (   width : natural :=width                    --! parallelismo dell' I/O del multiplexer
    );
    port(   SEL : in  STD_LOGIC;                                    --! mux2_1 input: selezione 
            A   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: A
            B   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: B
            X   : out STD_LOGIC_VECTOR ((width-1) downto 0)         --! mux2_1 output: X
        );
    end component;

    component rippleCarry_adder is  
         generic (   width   : NATURAL := width      
    );
    port (
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);	   
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    	
            c_in    :   in  STD_LOGIC;                              	
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   	
            c_out   :   out STD_LOGIC                             	    
    );
    end component;

--segnale che mantiene l'1 e lo 0 in ingresso ai due ripplecarry
    signal internal_carry_in    : STD_LOGIC_VECTOR (1 downto 0) :="10";
--segnale che mantiene i carry in uscita dei due ripplecarry
    signal internal_carry_out   : STD_LOGIC_VECTOR (1 downto 0) :="00";
--array di segnali che mantengono la somma dei ripplecarry
    type arrays_of_VECTOR is array (0 to 1) of STD_LOGIC_VECTOR ((width-1) downto 0);
    signal internal_sum         : arrays_of_VECTOR; 
--Segnale temporeneo per porre l'uscita a 0
    signal S_TEMP : STD_LOGIC_VECTOR ((width - 1) downto 0) := ( others => '0');
begin

S <= S_TEMP;
--adder che procedono alla somma degli width bits con i carry differenti 
    adders:
        for i in 0 to 1 generate 
            rippleCarry_adder_instance : rippleCarry_adder port map(    X       => A,
                                                                        Y       => B,
                                                                        c_in    => internal_carry_in(i),
                                                                        S       => internal_sum (i),
                                                                        c_out   => internal_carry_out(i)
            );
    end generate adders;

--multiplexer che seleziona il carry in uscita in base al carry in ingresso
   mux2_1_carry_select : mux2_1 generic map (width => 1) 
                                    port map (  A(0)   => internal_carry_out(0),
                                                B(0)   => internal_carry_out(1),
                                                SEL    => c_in,
                                                X(0)   => c_out
                                            );
                                            
--multiplexer che seleziona la somma in uscita in base al carry in ingresso 
    mux2_1_sum_select : mux2_1 port map (   A   => internal_sum(0),
                                            B   => internal_sum(1),
                                            SEL =>  c_in,
                                            X   => S_TEMP
                                         );
end structural;
