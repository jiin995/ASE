--------------------------------------------------------------------------
--! @file
--! @brief full_adder with 2 inputs e 2 outputs, carry and sum
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
  PORT (  X   :   in  STD_LOGIC;
          Y   :   in  STD_LOGIC;
          CIN :   in  STD_LOGIC;
          S   :   out STD_LOGIC;
          C   :   out STD_LOGIC

  );
end full_adder;

architecture dataflow of full_adder is
  begin
    S <=  (X xor Y xor CIN);
    C <=  ((X and Y) or ((X xor Y) and CIN));
  end dataflow;

architecture structural of full_adder is
  component half_adder is
    PORT (  X : in  STD_LOGIC;
            Y : in  STD_LOGIC;
            C : out STD_LOGIC;
            S : out STD_LOGIC
    );
  end component;

  signal  COUT1   : STD_LOGIC :='0';
  signal  COUT2   : STD_LOGIC :='0';

  signal  SOUT    : STD_LOGIC :='0';

  begin
    GEN_2_HALF_ADDER  : for i in 0 to 2 generate
      FIRST_HALF  : if i = 0 generate
        HALF_1  : half_adder PORT MAP (
                                        X => X,
                                        Y => Y,
                                        S => SOUT,
                                        C => COUT1
                                  );
      end generate FIRST_HALF;
      SECOND_HALF : if i = 1 generate
        HALF_2  : half_adder PORT MAP (
                                        X => SOUT,
                                        Y => CIN,
                                        S => S,
                                        C => COUT2
                                    );
      end generate SECOND_HALF;
    end generate GEN_2_HALF_ADDER;

    C <= ( COUT1 or COUT2 );

  end structural;
