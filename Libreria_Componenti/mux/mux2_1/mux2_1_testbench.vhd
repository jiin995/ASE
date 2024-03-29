---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mux2_1
--
-- unit name: mux2_1_testbench.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      mux2_1_testbench è l'implementazione del testbench di un mux2_1 
--
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Definisco la entity che non ha interfaccia perchè non serve per il testbench
entity mux2_1_testbench is
generic ( width_uut : NATURAL :=2
);
end mux2_1_testbench;

-- Il componente mux2_1_testbench usa il componente mux2_1.
-- Gli connette i suoi segnali interni e li fa variare seguendo un pattern ben definito, al fine
-- di poter osservare se il nostro componente sta eseguendo correttamente il suo compito quando 
-- ha degli ingressi definiti come nel patter.  

--=================================================================================================
-- architecture begin
--=================================================================================================
architecture behavioral of mux2_1_testbench is

    component mux2_1 is
    generic( width : NATURAL :=width_uut
    );
        port(   SEL : in  STD_LOGIC;      -- mux2_1 selezione input
            A   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: A
            B   : in  STD_LOGIC_VECTOR ((width-1) downto 0);        --! mux2_1 input: B
            X   : out STD_LOGIC_VECTOR ((width-1) downto 0)  
            );
    end component;

-- definisco i segnali interni a mux2_1_testbench
    signal SEL  : STD_LOGIC :='0';          
    signal A    : STD_LOGIC_VECTOR ((width_uut-1) downto 0) := (others => '0');
    signal B    : STD_LOGIC_VECTOR ((width_uut-1) downto 0) := (others => '0');

    signal X    : STD_LOGIC_VECTOR ((width_uut-1) downto 0) := (others => '0');

--=================================================================================================
-- architecture dataflow of mux2_1 begin
--=================================================================================================

    begin
-- mappo gli ingressi del componente mux2_1 con i segnali interni del mux2_1_testbench
        UUT: mux2_1 port map  (   A =>  A,
                                  B => B,
                                  SEL =>  SEL,
                                  X => X
                              );
        stim_proc: process
        begin
            wait for 10 ns;
              A <=  (others => '1');
            wait for 10 ns;
              SEL <= '1';
            wait for 10 ns;
            --Barbareschi ci da un uso sbagliato di assert
            --assert (X /= '1') report "X should be 1 " severity error;
            --l'assert visualizza il msg solo quando la condizione booleana è false.
            -- nel nostro caso se scriviamo X /= '1' l'assert mostrerà il msg solo quando X=1!
            -- quindi lo avremo sempre ==> il modo corretto per scrivere l'assert è X='1'
            assert (X = x"1") report "X should be 1 " severity error;
            wait for 10 ns;
              B <=  (others => '1');
            wait for 10 ns;
              SEL <= 'Z';
            wait for 10 ns;
              A<=  (others => '1'), (others => '0') after 10 ns;
            wait;
        end process;
end behavioral;
--=================================================================================================
-- architecture dataflow of mux2_1 end
--=================================================================================================
