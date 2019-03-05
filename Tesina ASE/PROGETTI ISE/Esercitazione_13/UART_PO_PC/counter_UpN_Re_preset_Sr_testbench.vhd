--------------------------------------------------------------------------------
--! Company: 
--! Engineer:
--
--! Create Date:   23:26:40 02/25/2019
--! Design Name:   
--! Module Name:   /home/jiin995/ASE_WorkSpace/Test/UART_PO_PC/counter_UpN_Re_preset_Sr_testbench.vhd
--! Project Name:  UART_PO_PC
--! Target Device:  
--! Tool versions:  
--! Description:   
--! 
--! VHDL Test Bench Created by ISE for module: counter_UpN_Re_preset_Sr
--! 
--! Dependencies:
--! 
--! Revision:
--! Revision 0.01 - File Created
--! Additional Comments:
--
--! Notes: 
--! This testbench has been automatically generated using types std_logic and
--! std_logic_vector for the ports of the unit under test.  Xilinx recommends
--! that these types always be used for the top-level I/O of a design in order
--! to guarantee that the testbench will bind correctly to the post-implementation 
--! simulation model.
--------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter_UpN_Re_preset_Sr_testbench IS
    generic (   n_test : NATURAL :=4
    );
END counter_UpN_Re_preset_Sr_testbench;
 
ARCHITECTURE behavior OF counter_UpN_Re_preset_Sr_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_UpN_Re_preset_Sr
	 generic (   n               : NATURAL :=n_test;
                enable_level    : STD_LOGIC :='1'
    );
    PORT(
         enable : IN  std_logic;
         reset_n : IN  std_logic;
         clock : IN  std_logic;
         preset      : in STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0);
			load 	: in STD_LOGIC;
         count_hit : OUT  std_logic;
         COUNTS :out STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal enable : std_logic := '0';
	signal load : std_logic := '0';
   signal reset_n : std_logic := '1';
   signal clock : std_logic := '0';
   signal preset : STD_LOGIC_VECTOR ((integer(ceil(log2(real(n_test)))) -1) downto 0) := ('1','0');


 	--Outputs
   signal count_hit : std_logic;
   signal COUNTS : STD_LOGIC_VECTOR ((integer(ceil(log2(real(n_test)))) -1) downto 0);

   --! Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: counter_UpN_Re_preset_Sr PORT MAP (
          enable => enable,
          reset_n => reset_n,
          clock => clock,
			 load => load,
          preset => preset,
          count_hit => count_hit,
          COUNTS => COUNTS
        );

   --! Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
		enable <= '1' after 10 ns ;
		load <= '1' after 10 ns , '0' after 20 ns;
      wait for clock_period*10;

      --! insert stimulus here 

      wait;
   end process;

END;
