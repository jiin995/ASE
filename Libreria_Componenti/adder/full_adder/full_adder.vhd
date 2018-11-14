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

--=============================================================================
-- architecture begin
--=============================================================================

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
        HALF_1  : half_adder PORT MAP (
                                        X => X,
                                        Y => Y,
                                        S => SOUT,
                                        C => COUT1
        );
        HALF_2  : half_adder PORT MAP (
                                        X => SOUT,
                                        Y => CIN,
                                        S => S,
                                        C => COUT2
                                    );

    C <= ( COUT1 or COUT2 );

  end structural;
--=============================================================================
-- architecture end
--=============================================================================
