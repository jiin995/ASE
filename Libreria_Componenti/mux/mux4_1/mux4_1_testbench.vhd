---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mux4_1
--
-- unit name: mux4_1_testbench.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      mux4_1_testbench è l'implementazione del testbench di un mux4_1
--! @details
--!
--! <b>Dependencies:</b>\n
--! <mux2_1>
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux4_1_testbench is
end mux4_1_testbench;

architecture behavioral of mux4_1_testbench is

  component mux4_1_b is
    port (  SEL   : in STD_LOGIC_VECTOR (1 downto 0);
            A     : in STD_LOGIC;
            B     : in STD_LOGIC;
            C     : in STD_LOGIC;
            D     : in STD_LOGIC;
            Z     : out STD_LOGIC
          );
  end component;

-- define signal that are used for test the component
  signal SEL  : STD_LOGIC_VECTOR (1 downto 0):= (others => '0');
  signal A    : STD_LOGIC :='0';
  signal B    : STD_LOGIC :='0';
  signal C    : STD_LOGIC :='0';
  signal D    : STD_LOGIC :='0';

  signal Z    : STD_LOGIC :='0';

  for uut: mux4_1_b use entity
         work.mux4_1(behavioral);

  begin

      uut: mux4_1_b port map  (
                              A =>A,
                              B => B,
                              C => C,
                              D => D,
                              SEL => SEL,
                              Z => Z
                            );
      stim_proc: process
        begin
            wait for 10 ns;
              A <= '1';
            wait for 10 ns;
              SEL(0) <= '1';
            wait for 10 ns;
              B <= '1';
            wait for 10 ns;
              D <= '1';
            wait for 10 ns;
              SEL(0) <= '0';
            wait for 10 ns;
              SEL(1) <= '1';
            wait for 10 ns;
              C <= '1','0' after 10 ns;
            wait;
        end process;
end behavioral;
