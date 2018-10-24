-------------------------------------------------------
--! @file
--! @brief 2:1 Mux using with-select
-------------------------------------------------------
-- mux2_1 describes a multiplex with 2 ingress and 1 output
-- Author : Gabriele Previtera


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--definisco il componente e ne dichiaro l'interfaccia
entity mux2_1 is
  Port( SEL : in  STD_LOGIC;
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        X   : out STD_LOGIC
      );
end mux2_1;

architecture dataflow of mux2_1 is

begin
    --X <= A when SEL='0' else B;
    X <= (A and (not SEL) ) or (B and (SEL));
end dataflow;
