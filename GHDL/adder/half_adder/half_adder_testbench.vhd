-- Definition of testbench for half_adder
-- Author: Gabriele Previtera

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity half_adder_testbench is
end half_adder_testbench;

architecture behavioral of half_adder_testbench is

  component half_adder is
    port (  X : in  STD_LOGIC;
            Y : in  STD_LOGIC;
            C : out STD_LOGIC;
            S : out STD_LOGIC
    );
  end component;

  signal  X  :  STD_LOGIC :='0';
  signal  Y  :  STD_LOGIC :='0';

  signal  C  :  STD_LOGIC :='0';
  signal  S  :  STD_LOGIC :='0';

  begin
    uut: half_adder port map ( X =>  X,
                                Y =>  Y,
                                C =>  C,
                                S =>  S
                              );

    stim_proc : process
      begin
        X <=  '1','0' after 15 ns,'1' after 25 ns,'1' after 35 ns;
        Y <=  '0','1' after 15 ns,'1' after 25 ns,'1' after 35 ns;
        wait;
    end process;
end behavioral;
