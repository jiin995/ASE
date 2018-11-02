-- Definition of testbench for mux2_1
-- Author: Gabriele Previtera

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1_testbench is
end mux4_1_testbench;

architecture behavioral of mux4_1_testbench is

  component mux4_1 is
    PORT (  SEL1  : in STD_LOGIC;
            SEL0  : in STD_LOGIC;
            A     : in STD_LOGIC;
            B     : in STD_LOGIC;
            C     : in STD_LOGIC;
            D     : in STD_LOGIC;
            Z     : out STD_LOGIC
          );
  end component;

-- define signal that are used for test the component
  signal SEL1 : STD_LOGIC :='0';
  signal SEL0 : STD_LOGIC :='0';
  signal A    : STD_LOGIC :='0';
  signal B    : STD_LOGIC :='0';
  signal C    : STD_LOGIC :='0';
  signal D    : STD_LOGIC :='0';

  signal Z    : STD_LOGIC :='0';

  begin
      uut: mux4_1 PORT MAP  (
                              A =>A,
                              B => B,
                              C => C,
                              D => D,
                              SEL0 => SEL0,
                              SEL1 =>  SEL1,
                              Z => Z
                            );
      stim_proc: process
        begin
            wait for 10 ns;
              A <= '1';
            wait for 10 ns;
              SEL0 <= '1';
            wait for 10 ns;
              B <= '1';
            wait for 10 ns;
              D <= '1';
            wait for 10 ns;
              SEL0 <= '0';
            wait for 10 ns;
              SEL1 <= '1';
            wait for 10 ns;
              C <= '1','0' after 10 ns;
            wait;
        end process;
end behavioral;
