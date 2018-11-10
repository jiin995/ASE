---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mux4_1
--
-- unit name: mux4_1.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera
--! @date       15/10/2018
--! @version    0.1
--! @brief      mux4_1 descrive il comportamento di un multiplexer con 4 ingressi e una uscita
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

--! Uso la libreria standard di IEEE
library IEEE;
--! Uso gli elementi logici della libreria IEEE
    use IEEE.STD_LOGIC_1164.all;
    
-- Descrizione comportamento

entity mux4_1 is
    port (    SEL1  : in STD_LOGIC;       --! mux4_1 input primo bit di selezione
              SEL0  : in STD_LOGIC;       --! mux4_1 input secondo bit di selezione
              A     : in STD_LOGIC;       --! mux4_1 input 
              B     : in STD_LOGIC;       --! mux4_1 input 
              C     : in STD_LOGIC;       --! mux4_1 input 
              D     : in STD_LOGIC;       --! mux4_1 input 
              Z     : out STD_LOGIC       --! mux4_1 output
        );
end mux4_1;

--================================================================================================
-- architecture declaration
--================================================================================================
architecture architectural of mux4_1 is
  -- componente usato per costruire il mux4_1
    component mux2_1 is
        PORT(   SEL : in  STD_LOGIC;
                A   : in  STD_LOGIC;
                B   : in  STD_LOGIC;
              X   : out STD_LOGIC
            );
    end component;

  --segnali di appoggio
    signal X : STD_LOGIC :='0';       --! segnale interno per collegare i tre mux2_1
    signal Y : STD_LOGIC :='0';       --! segnale interno per collegare i tre mux2_1

--================================================================================================
-- architecture architectural of mux4_1 begin
--================================================================================================
    begin
    -- Istanzio i mux2_1 utilizzando il for generate anche se si puo' fare meglio usando i vector
      GEN_MUX2_1: for i in 0 to 3 generate
    -- Controllo quale elemnto sto instanziando per poter collegare
          FIRST_MUX: if i=0 generate
    -- collego l'input e l'uscita al componente 
              M1: mux2_1 port map(    A => A,
                                      B => B,
                                      SEL =>  SEL0,
                                      X => X
                                );
          end generate FIRST_MUX;

          SECOND_MUX: if i=1 generate
              M2: mux2_1 port map(    A => C,
                                      B => D,
                                      SEL =>  SEL0,
                                      X => Y
                                  );
          end generate SECOND_MUX;

          THIRD_MUX: if i=2 generate
              M3: mux2_1 port map(    A => X,
                                      B => Y,
                                      SEL =>  SEL1,
                                      X => Z
                                  );
            end generate THIRD_MUX;

      end generate GEN_MUX2_1;
    end architectural;
--================================================================================================
-- architecture architectural of mux4_1 end
--================================================================================================
