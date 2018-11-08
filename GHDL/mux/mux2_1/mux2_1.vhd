---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- --
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mux2_1
--
-- unit name: mux2_1.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera
--! @date       15/10/2018
--! @version    0.1
--! @brief      mux2_1 describes a multiplex with 2 ingress and 1 output
--
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------


--! Use standard library
library IEEE;
--! Use logic elements
  use IEEE.STD_LOGIC_1164.ALL;

--! When SEL is low the output is the value of signal on input A, otherwise if select is high the 
--! output is the value of signal B

-- define componet with their interface

entity mux2_1 is
  PORT( SEL : in  STD_LOGIC;    --! Mux select input
        A   : in  STD_LOGIC;    --! Mux first input
        B   : in  STD_LOGIC;    --! Mux second input
        X   : out STD_LOGIC     --! Mux output
      );
end mux2_1;


--! @brief Architecture definition of the MUX 
--! @details More details about this mux element.
--! When SEL is low the output is the value of signal on input A, otherwise if select is high the 
--! output is the value of signal B
architecture dataflow of mux2_1 is

begin
    --X <= A when SEL='0' else B;
    X <= (A and (not SEL) ) or (B and (SEL));
end dataflow;
