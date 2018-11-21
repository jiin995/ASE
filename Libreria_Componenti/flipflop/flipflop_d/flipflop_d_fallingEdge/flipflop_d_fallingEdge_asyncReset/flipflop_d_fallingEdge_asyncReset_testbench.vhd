---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : flipflop_d_fallingEdge_asyncReset_testbench
--
-- unit name: flipflop_d_fallingEdge_asyncReset_testbench.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief     	Testbench per flipflop_d_fallingEdge_asyncReset
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
 
ENTITY flipflop_d_fallingEdge_asyncReset_testbench IS
END flipflop_d_fallingEdge_asyncReset_testbench;
 
ARCHITECTURE behavior OF flipflop_d_fallingEdge_asyncReset_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipflop_d_fallingEdge_asyncReset
    generic (   init_value   :  STD_LOGIC   :='0';
                reset_level  :  STD_LOGIC   :='0';
                enable_level :  STD_LOGIC   :='1');
    PORT(
         clock : IN  std_logic;
         enable : IN  std_logic;
         reset : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset_n : std_logic := '1';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipflop_d_fallingEdge_asyncReset PORT MAP (
          clock => clock,
          enable => enable,
          reset => reset_n,
          d => d,
          q => q
        );

   -- Clock process definitions
   clock_process: process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
	-- Enable process
	-- Ogni 10 periodi di clock enable va da alto a basso e viceversa
	enable_process: process
	begin
		wait for clock_period*10;
		enable <= not enable;
	end process;

   -- Stimulus process
   stim_proc: process
   begin	
		-- Ogni 5 periodi di clock d commuta
		wait for clock_period*5;
		d <= not d;
   end process;

END;
