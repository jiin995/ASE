----------------------------------------------------------------------------------
-- Company: 
-- Engineer: taken from Pong Chu , Wiley , "FPGA PROTOTYPING BY VHDL EXAMPLES"
-- 
-- Create Date:    10:10:15 01/12/2008 
-- Design Name: 
-- Module Name:    uart_rx - Behavioral 
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

library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity uart_rx is
 generic(
  DBIT :integer:=8; -- # d a t a b i t s
  SB_TICK: integer:=16 -- # ticks for stop bits
 ) ;
 port(
  ck:in std_logic;
  rx:in std_logic;
  s_tick:in std_logic;
  rx_done_tick:out std_logic;
  dout:out std_logic_vector(7 downto 0)
 );
end uart_rx;

architecture arch of uart_rx is
 type state_type is(idle,start,data,stop) ;
 signal s_reg,s_next : ieee.numeric_std.unsigned ( 3 downto 0) :=(others => '0');
 signal n_reg,n_next: ieee.numeric_std.unsigned (2 downto 0):=(others => '0');
 signal b_reg,b_next:std_logic_vector(7 downto 0):=(others => '0');
 signal state_reg,state_next:state_type:=idle;
begin
-- FSMD s t a t e & d a t a r e g i s t e r s
process (ck)
begin
-- if reset = '1' then
--  state_reg<=idle;
--  s_reg <= (others => '0');
--  n_reg <= (others => '0');
--  b_reg <= (others => '0');  
 if (rising_edge(ck)) then
  state_reg <= state_next;
  s_reg <= s_next;
  n_reg <= n_next;
  b_reg <= b_next;
 end if;
end process;

process (state_reg,s_reg,n_reg,b_reg,s_tick,rx)
begin
-- next  state logic & datapath functionalunits/routing
 state_next<= state_reg;
 s_next <= s_reg;
 n_next <= n_reg;
 b_next <= b_reg;
 rx_done_tick <= '0';
 --case state_reg is
 case state_reg is
  when idle =>
   if rx='0' then
    state_next <= start;
    s_next <= ( others => '0');
   end if;
  when start =>
   if (s_tick = '1') then
    if s_reg = 7 then
     state_next <= data;
     s_next <= (others => '0') ;
     n_next <= (others => '0') ;
    else
	  s_next <= s_reg+1;
    end if;
   end if;
  when data =>
   if (s_tick = '1') then
    if s_reg = 15 then
     s_next<= (others => '0');
     b_next <= rx & b_reg (7 downto 1);
     if n_reg = (DBIT -1) then
      state_next <= stop;     
	  else
      n_next <= n_reg+1;	  
     end if ;
    else
     s_next <= s_reg + 1;
    end if;
   end if;
  when stop =>
   if (s_tick = '1') then
    if s_reg=(SB_TICK-1) then
     state_next <= idle;
     rx_done_tick <= '1';
    else
     s_next <= s_reg + 1 ;
    end if ;
   end if;
 end case ;
end process;
dout <= b_reg;
end arch;  