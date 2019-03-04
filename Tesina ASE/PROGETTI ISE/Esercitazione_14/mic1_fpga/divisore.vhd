----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:28 03/20/2009 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Library UNISIM;
use UNISIM.vcomponents.all;


  -- DCM_SP: Digital Clock Manager Circuit
   --         Spartan-3E/3A
   -- Xilinx HDL Language Template, version 9.2i






entity divisore_freq is
 port(
  clk_div: out std_logic; 
  clk:in std_logic
 );
end divisore_freq;

architecture Behavioral of divisore_freq is

 
 component clock_div is
	port(-- Clock in ports
		CLK_IN1           : in     std_logic;
		-- Clock out ports
		CLK_OUT1          : out    std_logic
	);
 end component;
begin
	
--	clknetwork : clock_div port map(
--		-- Clock in ports
--		CLK_IN1            => clk,
--		-- Clock out ports
--		CLK_OUT1           => clk_div);
	
	clk_div <= clk;
end Behavioral;

