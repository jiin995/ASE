--------------------------------------------------------------------------------
--! Company: 
--! Engineer:
--
--! Create Date:   18:07:12 02/09/2019
--! Design Name:   
--! Module Name:   /home/simone/Scrivania/latch_T/latch_T_TB.vhd
--! Project Name:  latch_T
--! Target Device:  
--! Tool versions:  
--! Description:   
--! 
--! VHDL Test Bench Created by ISE for module: latch_T
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
 
ENTITY latch_T_TB IS
END latch_T_TB;
 
ARCHITECTURE behavior OF latch_T_TB IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latch_T
    PORT(
         en : IN  std_logic;
         T : IN  std_logic;
         Q : OUT  std_logic;
         QN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal en : std_logic := '0';
   signal T : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal QN : std_logic;
   --! No clocks detected in port list. Replace <clock> below with 
   --! appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: latch_T PORT MAP (
          en => en,
          T => T,
          Q => Q,
          QN => QN
        );
 

   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
      wait for 100 ns;	

      --! insert stimulus here 
		en <= '1' after 100 ns, '0' after 300 ns, '1' after 500 ns, '0' after 700 ns;
		T <= '1' after 120 ns, '0' after 200 ns, '1' after 280 ns, '0' after 360 ns, '1' after 400 ns;
      wait;
   end process;

END;
