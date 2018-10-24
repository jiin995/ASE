-- Definition of testbench for mux2_1
-- Author: Gabriele Previtera

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_1_testbench is
end mux2_1_testbench;

architecture behavioral of mux2_1_testbench is

  component mux2_1 is
      Port( SEL : in  STD_LOGIC;
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            X   : out STD_LOGIC
          );
  end component;

-- define signal that are used for test the component
  signal SEL  : STD_LOGIC :='0';
  signal A    : STD_LOGIC :='0';
  signal B    : STD_LOGIC :='0';

  signal X    : STD_LOGIC :='0';

  begin
      uut: mux2_1 PORT MAP  (
                              A =>A,
                              B => B,
                              SEL =>  SEL,
                              X => X
                            );
      stim_proc: process
        begin
            wait for 10 ns;
              A <= '1';
            wait for 10 ns;
              SEL <= '1';
            wait for 10 ns;
--Barbareschi ci da un uso sbagliato di assert
            --assert (X /= '1') report "X should be 1 " severity error;
--l'assert visualizza il msg solo quando la condizione booleana è false.
-- nel nostro caso se scriviamo X /= '1' l'assert mostrerà il msg solo quando X=1!
-- quindi lo avremo sempre ==> il modo corretto per scrivere l'assert è X='1'
              assert (X = '1') report "X should be 1 " severity error;
            wait for 10 ns;
              B <= '1';
            wait for 10 ns;
              SEL <= 'Z';
            wait for 10 ns;
              A<= '1','0' after 10 ns;
            wait;
        end process;
end behavioral;
