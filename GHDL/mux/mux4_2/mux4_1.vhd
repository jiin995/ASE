-------------------------------------------------------
--! @file
--! @brief 4:2 Mux using with-select
-------------------------------------------------------
-- mux4_2 describes a multiplex with 4 ingress and 1 output
-- Author : Gabriele Previtera


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1 is
  PORT (  SEL1  : in STD_LOGIC;
          SEL0  : in STD_LOGIC;
          A     : in STD_LOGIC;
          B     : in STD_LOGIC;
          C     : in STD_LOGIC;
          D     : in STD_LOGIC;
          Z     : out STD_LOGIC
        );
end mux4_1;

architecture architectural of mux4_1 is
  -- componente usato per costruire il mux4_1
  component mux2_1 is
      Port( SEL : in  STD_LOGIC;
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            X   : out STD_LOGIC
          );
  end component;

  --segnali di appoggio
  signal X : STD_LOGIC :='0';
  signal Y : STD_LOGIC :='0';

  begin
    GEN_MUX2_1: for i in 0 to 3 generate

      FIRST_MUX: if i=0 generate
        M1: mux2_1 PORT MAP(
                              A => A,
                              B => B,
                              SEL =>  SEL0,
                              X => X
                            );
      end generate FIRST_MUX;

      SECOND_MUX: if i=1 generate
        M2: mux2_1 PORT MAP(
                              A => C,
                              B => D,
                              SEL =>  SEL0,
                              X => Y
                            );
      end generate SECOND_MUX;

      THIRD_MUX: if i=2 generate
        M3: mux2_1 PORT MAP(
                              A => X,
                              B => Y,
                              SEL =>  SEL1,
                              X => Z
                            );
      end generate THIRD_MUX;

    end generate GEN_MUX2_1;
end architectural;
