---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : counter_mod2n
--
-- unit name: counter_mod2n_testbench.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      counter_mod2n_testbench è l'implementazione del testbench di un contatore modulo 2^n
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothing
--!
-- modified by: Simone Penna
--
---------------------------------------------------------------------------------------------------
-- last changes: <11/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter_mod2n_testbench IS
    generic (   n_test : NATURAL := 3 );
END counter_mod2n_testbench;
 
ARCHITECTURE behavior OF counter_mod2n_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_mod2n is

    generic (   n               :   NATURAL := n_test;	--! usato per definire il valore massimo (2**n)-1 di fine conteggio.
                enable_level    :   std_logic := '1'	--! definisce il livello enable
    );
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   enable : in STD_LOGIC;
           counter : out  STD_LOGIC_VECTOR (n-1 downto 0));

    end Component;
    

   --Inputs
    signal clock : std_logic := '0';
    signal enable : std_logic := '1';
    signal reset : std_logic := '1';

 	--Outputs

    signal counter : STD_LOGIC_VECTOR ((n_test-1) downto 0);

   -- Clock period definitions
    constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_mod2n PORT MAP (
          reset => reset,
          clock => clock,
          enable => enable,
          counter => counter
        );

   -- Clock process definitions
   clock_process: process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;

END;
