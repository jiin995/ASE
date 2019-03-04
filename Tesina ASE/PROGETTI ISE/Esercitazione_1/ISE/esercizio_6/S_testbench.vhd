---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : S_testbench
--
-- unit name: S_testbench.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       25/10/2018
--! @version    0.1
--! @brief     	Testbench della macchina S.
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
-- last changes: <21/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY S_testbench IS
END S_testbench;
 
ARCHITECTURE behavior OF S_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT S
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         C : IN  std_logic_vector(2 downto 0);
         D : IN  std_logic_vector(2 downto 0);
         E : IN  std_logic_vector(2 downto 0);
         F : IN  std_logic_vector(2 downto 0);
         W : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(2 downto 0) := (others => '0');
   signal C : std_logic_vector(2 downto 0) := (others => '0');
   signal D : std_logic_vector(2 downto 0) := (others => '0');
   signal E : std_logic_vector(2 downto 0) := (others => '0');
   signal F : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal W : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: S PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          W => W
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- wait di 100 ns (reset)
      wait for 100 ns;	

		--alzo tutti i bit delle stringhe in ingresso, a distanza di 10 ns l'una dall'altra.
		A <= (others => '1');
		wait for 10 ns;
		B <= (others => '1');
		wait for 10 ns;
		C <= (others => '1');
		wait for 10 ns;
		D <= (others => '1');
		wait for 10 ns;
		E <= (others => '1');
		wait for 10 ns;
		F <= (others => '1');
		wait for 10 ns;

      wait;
   end process;

END;
