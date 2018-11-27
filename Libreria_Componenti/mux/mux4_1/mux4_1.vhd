---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mux4_1
--
-- unit name: mux4_1.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      mux4_1 descrive il comportamento di un multiplexer con 4 ingressi e 1 uscita
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <14/11/2018> <13/11/2018> <log>
--              create
---------------------------------------------------------------------------------------------------

--! Uso la libreria standard di IEEE
library IEEE;
--! Uso gli elementi logici della libreria IEEE
    use IEEE.STD_LOGIC_1164.all;
    
-- Descrizione comportamento
--! Caratterizzato da 2 segnali di selezione e 4 segnali di ingresso. In base al valore del segnale di selezione in uscita avremo un valore diverso:\n
--! SEL = 00 -> Z=A;
--! SEL = 01 -> Z=B;
--! SEL = 10 -> Z=C;
--! SEL = 11 -> Z=D;

entity mux4_1 is
    port (    SEL   : in STD_LOGIC_VECTOR (1 downto 0);       --! mux4_1 input primo bit di selezione
              A     : in STD_LOGIC;       --! mux4_1 input: A 
              B     : in STD_LOGIC;       --! mux4_1 input: B 
              C     : in STD_LOGIC;       --! mux4_1 input: C
              D     : in STD_LOGIC;       --! mux4_1 input: D
              Z     : out STD_LOGIC       --! mux4_1 output: Z
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
                                      SEL =>  SEL(0),
                                      X => X
                                );
          end generate FIRST_MUX;

          SECOND_MUX: if i=1 generate
              M2: mux2_1 port map(    A => C,
                                      B => D,
                                      SEL =>  SEL(0),
                                      X => Y
                                  );
          end generate SECOND_MUX;

          THIRD_MUX: if i=2 generate
              M3: mux2_1 port map(    A => X,
                                      B => Y,
                                      SEL =>  SEL(1),
                                      X => Z
                                  );
            end generate THIRD_MUX;

      end generate GEN_MUX2_1;
    end architectural;
--================================================================================================
-- architecture architectural of mux4_1 end
--================================================================================================

--================================================================================================
-- architecture declaration (alternativa behavioral)
--================================================================================================
architecture behavioral of mux4_1 is
--================================================================================================
-- architecture behavioral of mux4_1 begin
--================================================================================================
begin
    process (A, B, C, D, SEL)
    begin
      case SEL is 
         when "00" => Z <= A;
         when "01" => Z <= B;
         when "10" => Z <= C;
         when "11" => Z <= D;
         when others => Z <= A;
      end case;
    end process;
end behavioral;
--================================================================================================
-- architecture behavioral of mux4_1 end
--================================================================================================
