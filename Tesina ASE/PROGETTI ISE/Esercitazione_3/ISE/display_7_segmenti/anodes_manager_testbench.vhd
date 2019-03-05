--------------------------------------------------------------------------------
--! Company: 
--! Engineer:
--
--! Create Date:   18:02:10 11/17/2018
--! Design Name:   
--! Module Name:   /home/jiin995/ASE_WorkSpace/Test/Test7Segmenti/display_7_segmenti/anodes_manager_testbench.vhd
--! Project Name:  display_7_segmenti
--! Target Device:  
--! Tool versions:  
--! Description:   
--! 
--! VHDL Test Bench Created by ISE for module: anodes_manager
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
 
ENTITY anodes_manager_testbench IS
END anodes_manager_testbench;
 
ARCHITECTURE behavior OF anodes_manager_testbench IS 
 
    --! Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT anodes_manager
    PORT(
         counter : IN  std_logic_vector(1 downto 0);
         enable_digit : IN  std_logic_vector(3 downto 0);
         anodes : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal counter : std_logic_vector(1 downto 0) := (others => '0');
   signal enable_digit : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal anodes : std_logic_vector(3 downto 0);
   --! No clocks detected in port list. Replace <clock> below with 
   --! appropriate port name 
 
 
BEGIN
 
	--! Instantiate the Unit Under Test (UUT)
   uut: anodes_manager PORT MAP (
          counter => counter,
          enable_digit => enable_digit,
          anodes => anodes
        );


   --! Stimulus process
   stim_proc: process
   begin		
      --! hold reset state for 100 ns.
		
			enable_digit <= x"1";
			counter <= "00";
			wait for 10 ns;
			enable_digit <= x"2";
			counter <= "00";
			wait for 100 ns;
      --! insert stimulus here 

      wait;
   end process;

END;
