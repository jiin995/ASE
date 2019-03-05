----------------------------------------------------------------------------------
--! Company: 
--! Engineer: 
--! 
--! Create Date:    17:43:28 03/20/2009 
--! Design Name: 
--! Module Name:    main - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Library UNISIM;
use UNISIM.vcomponents.all;


  --! DCM_SP: Digital Clock Manager Circuit
   --!         Spartan-3E/3A
   --! Xilinx HDL Language Template, version 9.2i






entity divisore_freq is
 port(
  clk_div: out std_logic; 
  clk:in std_logic
 );
end divisore_freq;

architecture Behavioral of divisore_freq is
 signal CLK0_s : std_logic :='0';
 signal CLK180_s : std_logic :='0';
 signal CLK270_s : std_logic :='0';
 signal CLK2X_s : std_logic :='0'; 
 signal CLK2X180_s : std_logic :='0';
 signal CLK90_s : std_logic :='0'; 
 signal CLKDV_s : std_logic :='0'; 
 signal CLKFX_S : std_logic :='0'; 
 signal CLKFX180_s : std_logic :='0'; 
 signal LOCKED_s : std_logic :='0'; 
 signal PSDONE_s : std_logic :='0'; 
 signal STATUS_s : std_logic_vector(7 downto 0) :="00000000"; 
 signal CLKFB_s : std_logic :='0'; 
 signal CLKIN_s : std_logic :='0'; 
 signal PSINCDEC_s : std_logic :='0'; 
 signal PSCLK_s : std_logic :='0';
 signal PSEN_s : std_logic :='0';
 signal RST_s : std_logic :='0'; 
 signal clk_s : std_logic :='0'; 
 
 component clock_div is
	port(--! Clock in ports
		CLK_IN1           : in     std_logic;
		--! Clock out ports
		CLK_OUT1          : out    std_logic
	);
 end component;
begin
--
--!   clk_s<=clk;
--!  
--!   DCM_SP_inst : DCM_SP
--!   generic map (
--!      CLKDV_DIVIDE => 5.0, --!  Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
--!                           --!     7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
--!      CLKFX_DIVIDE => 4,   --!  Can be any interger from 1 to 32
--!      CLKFX_MULTIPLY => 4, --!  Can be any integer from 1 to 32
--!      CLKIN_DIVIDE_BY_2 => TRUE, --!  TRUE/FALSE to enable CLKIN divide by two feature
----!      CLKIN_DIVIDE_BY_2 => FALSE, --!  TRUE/FALSE to enable CLKIN divide by two feature
--!      CLKIN_PERIOD => 20.0, --!  Specify period of input clock
--!      CLKOUT_PHASE_SHIFT => "NONE", --!  Specify phase shift of "NONE", "FIXED" or "VARIABLE" 
--!      CLK_FEEDBACK => "1X",         --!  Specify clock feedback of "NONE", "1X" or "2X" 
--!      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", --! "SOURCE_SYNCHRONOUS", "SYSTEM_SYNCHRONOUS" or
--!                                             --!     an integer from 0 to 15
--!      DFS_FREQUENCY_MODE => "LOW",     --! "HIGH" or "LOW" frequency mode for 
--!                                       --! frequency synthesis
--!      DLL_FREQUENCY_MODE => "LOW",     --! "HIGH" or "LOW" frequency mode for DLL
--!      DUTY_CYCLE_CORRECTION => TRUE, --!  Duty cycle correction, TRUE or FALSE
--!      FACTORY_JF => X"C080",          --!  FACTORY JF Values
--!      PHASE_SHIFT => 0,        --!  Amount of fixed phase shift from -255 to 255
--!      STARTUP_WAIT => FALSE) --!  Delay configuration DONE until DCM_SP LOCK, TRUE/FALSE
--
--!   port map (
--!      CLK0 => CLK0_s,     --! 0 degree DCM CLK ouptput
--!      CLK180 => CLK180_s, --! 180 degree DCM CLK output
--!      CLK270 => CLK270_s, --! 270 degree DCM CLK output
--!      CLK2X => CLK2X_s,   --! 2X DCM CLK output
--!      CLK2X180 => CLK2X180_s, --! 2X, 180 degree DCM CLK out
--!      CLK90 => CLK90_s,   --! 90 degree DCM CLK output
----!      CLKDV => CLKDV,   --! Divided DCM CLK out (CLKDV_DIVIDE)
--!      CLKDV => clk_div,   --! Divided DCM CLK out (CLKDV_DIVIDE)
--!      CLKFX => CLKFX_s,   --! DCM CLK synthesis out (M/D)
--!      CLKFX180 => CLKFX180_s, --! 180 degree CLK synthesis out
--!      LOCKED => LOCKED_s, --! DCM LOCK status output
--!      PSDONE => PSDONE_s, --! Dynamic phase adjust done output
--!      STATUS => STATUS_s, --! 8-bit DCM status bits output
--!      CLKFB => clk_s,   --! DCM clock feedback
----!      CLKIN => CLKIN,   --! Clock input (from IBUFG, BUFG or DCM)
--		CLKIN => clk_s,   --! Clock input (from IBUFG, BUFG or DCM)
--!      PSCLK => PSCLK_s,   --! Dynamic phase adjust clock input
--!      PSEN => PSEN_s,     --! Dynamic phase adjust enable input
--!      PSINCDEC => PSINCDEC_s, --! Dynamic phase adjust increment/decrement
--!      RST => RST_s        --! DCM asynchronous reset input
--!   );
--
--!   --! End of DCM_SP_inst instantiation

	
	clknetwork : clock_div port map(
		--! Clock in ports
		CLK_IN1            => clk,
		--! Clock out ports
		CLK_OUT1           => clk_div);
	
end Behavioral;

