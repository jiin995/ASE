---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : rca_add_sub
--
-- unit name: full_adder.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Implementazione di un full adder in data flow
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! Descrizione
--! Somma i 3 bit in ingresso (2 addendi e 1 carry in ingresso).\n In uscita abbiamo il risultato della somma sul bit S e il riporto
--! sul bit C.

entity full_adder is
  PORT (  x       :   in  STD_LOGIC;	--! full_adder input : addendo
          y       :   in  STD_LOGIC;	--! full_adder input : addendo
          c_in    :   in  STD_LOGIC;	--! full_adder input : carry in ingresso
          s       :   out STD_LOGIC;	--! full_adder output : somma
          c_out   :   out STD_LOGIC		--! full_adder output : carry

  );
end full_adder;

--================================================================================================
--! architecture declaration
--================================================================================================

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
--=============================================================================
--! architecture structural of full_adder begin
--=============================================================================
  begin
        HALF_1  : half_adder PORT MAP (
                                        X => X,
                                        Y => Y,
                                        S => SOUT,
                                        C => COUT1
        );
        HALF_2  : half_adder PORT MAP (
                                        X => SOUT,
                                        Y => c_in,
                                        S => S,
                                        C => COUT2
                                    );

    c_out <= ( COUT1 or COUT2 );

  end structural;
--=============================================================================
--! architecture structural of full_adder end
--=============================================================================

--================================================================================================
--! architecture declaration
--================================================================================================
architecture dataflow of full_adder is
--================================================================================================
--! architecture dataflow of full_adder begin
--================================================================================================
  begin
    s <=  (x xor y xor c_in);
    c_out <=  ((x and y) or ((x xor y) and c_in));
  end dataflow;
--================================================================================================
--! architecture dataflow of full_adder end
--================================================================================================
