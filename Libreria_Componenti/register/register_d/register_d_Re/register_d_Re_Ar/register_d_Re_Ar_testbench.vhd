---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : register_d_Re_Ar
--
-- unit name: register_d_Re_Ar_testbench.vhdl
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       13/11/2018
--! @version    0.1
--! @brief      register_d_Re_Ar_testbench è l'implementazione del testbench di un register_d_Re_Ar
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
-- last changes: <16/11/2018> <16/11/2018> <log>
--              create
---------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_d_Re_Ar_testbench IS
    generic (
            dimension_tb  : NATURAL   :=15
    );
END register_d_Re_Ar_testbench;
 
ARCHITECTURE behavior OF register_d_Re_Ar_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_d_Re_Ar
     generic(    dimension   :   NATURAL := dimension_tb;
                reset_level     :   STD_LOGIC :='0';    -- define reset level
                enable_level    :   STD_LOGIC := '1'    -- define enable level
    );

    port(   clock   :   in  STD_LOGIC;
            enable  :   in  STD_LOGIC;
            reset   :   in  STD_LOGIC;
            D       :   in  STD_LOGIC_VECTOR    (dimension-1 downto 0);
            Q       :   out STD_LOGIC_VECTOR    (dimension-1 downto 0)
    );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset_n : std_logic := '1';
   signal d : std_logic_vector (dimension_tb-1 downto 0):= (others => '0');

   --Outputs
   signal q : std_logic_vector (dimension_tb-1 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_d_Re_Ar PORT MAP (
          clock => clock,
          enable => enable,
          reset => reset_n,
          D => d,
          Q => q
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
