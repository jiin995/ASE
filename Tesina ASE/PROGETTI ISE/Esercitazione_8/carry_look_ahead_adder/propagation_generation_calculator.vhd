---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : carry_look_ahead_adder
--
--! unit name: propagation_generation_calculator.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      Componente che calcola le condizioni di Propagazione e Generazione
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

entity propagation_generation_calculator is 
    generic (   width : NATURAL :=2
    );
    port (  --! propagation_generation_calculator inputs  : primo addendo
            X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! propagation_generation_calculator inputs  : secondo addendo
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0); 
            --! propagation_generation_calculator inputs  : riporto generato
            G       :   out  STD_LOGIC_VECTOR (width-1 downto 0);    
            --! propagation_generation_calculator inputs  : riporto propagato 
            P       :   out  STD_LOGIC_VECTOR (width-1 downto 0) 
    );
end propagation_generation_calculator;

architecture dataflow of propagation_generation_calculator is 

begin
    --calcolo se il riporto si genera allo stadio i-esimo 
    G <= X and Y;
    --calcolo se il riporto si propaga dallo stadio i-esimo 
    P <= X or Y;
end;
