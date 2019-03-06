--------------------------------------------------------------------------------
--! Company: 
--! Engineer:
--
--! Create Date:   16:16:19 02/14/2019
--! Design Name:   
--! Module Name:   /home/jiin995/ASE_WorkSpace/Test/TestClock/left_right_shift_register_testbench.vhd
--! Project Name:  TestClock
--! Target Device:  
--! Tool versions:  
--! Description:   
--! 
--! VHDL Test Bench Created by ISE for module: left_right_shift_register
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--! Uncomment the following library declaration if using
--! arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY left_right_shift_register_testbench IS
END left_right_shift_register_testbench;
 
ARCHITECTURE behavior OF left_right_shift_register_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT left_right_shift_register
    PORT(
         clock : IN  std_logic;
         enable : IN  std_logic;
         reset_n : IN  std_logic;
         left : IN  std_logic;
         d_in : IN  std_logic;
         q_out : OUT  std_logic;
         Q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enable : std_logic := '1';
   signal reset_n : std_logic := '1';
   signal left : std_logic := '1';
   signal d_in : std_logic := '0';

 	--Outputs
   signal q_out : std_logic;
   signal Q : std_logic_vector(7 downto 0);

   --! Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: left_right_shift_register PORT MAP (
          clock => clock,
          enable => enable,
          reset_n => reset_n,
          left => left,
          d_in => d_in,
          q_out => q_out,
          Q => Q
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
      wait for 10 ns;	

      wait for clock_period*10;
		d_in <= '1' after 20 ns, '0' after 50 ns;
      --! insert stimulus here 

      wait;
   end process;

END;
