----------------------------------------------------------------------------------
-- Company: 
-- Engineer: taken from Pong Chu , Wiley , "FPGA PROTOTYPING BY VHDL EXAMPLES"
-- 
-- Create Date:    10:10:15 01/12/2008 
-- Design Name: 
-- Module Name:    baud_rate_gen - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity baud_gen is
 generic(
  N: integer := 4; -- number of bits
  M : integer := 163 -- mod 4
 );
 port(
  ck: in std_logic;
  max_tick: out std_logic;
  q: out std_logic_vector (N-1 downto 0)
 );
end baud_gen;

architecture arch of baud_gen is
 signal r_reg : ieee.numeric_std.unsigned (N-1 downto 0):=(others => '0');
 signal r_next : ieee.numeric_std.unsigned  (N-1 downto 0);
 begin
 -- r e g i s t e r

	process(ck)
	begin
	 if (rising_edge(ck)) then
     r_reg <= r_next;	 
	 end if;
	end process;
	 -- next - state logic
	 r_next <= (others => '0') when r_reg=(M-1) else 
	            r_reg+1;
	 -- output logic
	 q <= std_logic_vector(r_reg);
	 max_tick <= '1' when r_reg=(M-1) else '0';
end arch;