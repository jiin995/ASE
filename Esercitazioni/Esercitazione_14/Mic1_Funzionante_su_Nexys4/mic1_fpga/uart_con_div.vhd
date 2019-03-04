----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    16:17:31 01/12/2008 
-- Design Name: 
-- Module Name:    uart_con_div - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity uart_9600bps is
	port(
		reset : IN std_logic;
		clk : IN std_logic;
		rx_data_serial : IN std_logic;
		tx_data_in : IN std_logic_vector(7 downto 0);
		tx_data_en : IN std_logic;
  		rx_data_out : OUT std_logic_vector(7 downto 0);
		rx_data_en : OUT std_logic;
		rx_ovf_err : OUT std_logic;
		rx_parity_err : OUT std_logic;
		tx_data_serial : OUT std_logic;
		tx_ch_rdy : OUT std_logic
		);
end uart_9600bps;

architecture Behavioral of uart_9600bps is
	COMPONENT main
	PORT(
		clk : IN std_logic;          
		clk_div : OUT std_logic
		);
	END COMPONENT;

	COMPONENT uart_serial
	PORT(
		reset : IN std_logic;
		clk : IN std_logic;
		rx_data_serial : IN std_logic;
		tx_data_in : IN std_logic_vector(7 downto 0);
		tx_data_en : IN std_logic;
		baud_sel : IN std_logic_vector(3 downto 0);
		parity_en : IN std_logic;
		parity_type : IN std_logic;          
		rx_data_out : OUT std_logic_vector(7 downto 0);
		rx_data_en : OUT std_logic;
		rx_ovf_err : OUT std_logic;
		rx_parity_err : OUT std_logic;
		tx_data_serial : OUT std_logic;
		tx_ch_rdy : OUT std_logic
		);
	END COMPONENT;
   

begin



	Inst_uart_serial: uart_serial PORT MAP(
		reset => reset,
		clk => clk,
		rx_data_serial => rx_data_serial,
		rx_data_out => rx_data_out,
		rx_data_en => rx_data_en,
		rx_ovf_err => rx_ovf_err,
		rx_parity_err => rx_parity_err,
		tx_data_serial => tx_data_serial,
		tx_data_in => tx_data_in,
		tx_data_en => tx_data_en,
		tx_ch_rdy => tx_ch_rdy,
		baud_sel => x"4",  --vado a 9600 bps
		parity_en => '0', --no parity
		parity_type => '0'
	);




end Behavioral;

