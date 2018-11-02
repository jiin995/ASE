--------------------------------------------------------------------------
--! @file
--! @brief half_adder with 2 inputs e 2 outputs, carry and sum
--------------------------------------------------------------------------
-- half_adder.vhd describes an simple half_adder
-- Author : Gabriele Previtera

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--define component and declare its interface
entity half_adder is
  PORT (  X:  in  STD_LOGIC;
          Y:  in  STD_LOGIC;
          C:  out STD_LOGIC;
          S:  out STD_LOGIC
  );
end half_adder;

architecture dataflow of half_adder is
  begin
    C <=  (X and Y);
    S <=  (X xor Y);
end dataflow;
