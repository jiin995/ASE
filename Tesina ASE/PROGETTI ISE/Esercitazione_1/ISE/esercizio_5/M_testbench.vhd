---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : M_testbench
--
-- unit name: M_testbench.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       25/10/2018
--! @version    0.1
--! @brief     	Testbench per la macchina M
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <21/11/2018> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY M_testbench IS
END M_testbench;
 
ARCHITECTURE behavior OF M_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT M
    PORT(
         X : IN  std_logic_vector(5 downto 0);
         Y : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: M PORT MAP (
          X => X,
          Y => Y
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
      -- wait per 100 ns (reset)
      wait for 100 ns;	
		
      -- transizione da 0 a 1 di ogni ingresso Xi (ogni 10 ns)
		for i in 0 to 5 loop
			X(i) <= '1';
			wait for 10 ns;
		end loop;
		
      wait;
   end process;

END;
