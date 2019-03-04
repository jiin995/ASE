
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:42:42 03/28/2009
-- Design Name:   if_uart
-- Module Name:   C:/Xilinx92i/sistema_a_mic1/tb_uart.vhd
-- Project Name:  sistema_a_mic1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: if_uart
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb_uart_vhd IS
END tb_uart_vhd;

ARCHITECTURE behavior OF tb_uart_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT if_uart
	PORT(
		RXD : IN std_logic;
		CLK : IN std_logic;
		CE_UART : IN std_logic;
		RD : IN std_logic;
		WR : IN std_logic;    
		if_databus : INOUT std_logic_vector(31 downto 0);      
		TXD : OUT std_logic;
		LEDS : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL RXD :  std_logic := '0';
	SIGNAL CLK :  std_logic := '0';
	SIGNAL CE_UART :  std_logic := '0';
	SIGNAL RD :  std_logic := '0';
	SIGNAL WR :  std_logic := '0';

	--BiDirs
	SIGNAL if_databus :  std_logic_vector(31 downto 0);

	--Outputs
	SIGNAL TXD :  std_logic;
	SIGNAL LEDS :  std_logic_vector(7 downto 0);


    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;


BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: if_uart PORT MAP(
		TXD => TXD,
		RXD => RXD,
		CLK => CLK,
		CE_UART => CE_UART,
		if_databus => if_databus,
		RD => RD,
		LEDS => LEDS,
		WR => WR
	);
	
	
        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;
	

	tb : PROCESS
	BEGIN
                -- -------------  Current Time:  550ns
                RXD <= '1'; 
					 WAIT FOR 550 ns;
                CE_UART <= '1';
                WR <= '1';
                if_databus <= "00000000000000000000000000010010";
                -- -------------------------------------
                -- -------------  Current Time:  650ns
                WAIT FOR 200 ns;
                CE_UART <= '0';
                WR <= '0';
                if_databus <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
                -- -------------------------------------
					 WAIT FOR 4000 us;



	
                -- ricevo un dato a 115200 bps        
                -- -------------------------------------
                WAIT FOR 104  us;
					 RXD <= '0';  --start bit	
                WAIT FOR 104  us;
					 
					 
					 
					 RXD <= '1';  -- bit 0	95hex
                WAIT FOR 104  us;
					 RXD <= '0';  -- bit 1	
                WAIT FOR 104  us;
					 RXD <= '1';  -- bit 2
                WAIT FOR 104  us;
					 RXD <= '0';  -- bit 3
                WAIT FOR 104  us;
					 RXD <= '1';  -- bit 4	
                WAIT FOR 104  us;
					 RXD <= '0';  -- bit 5	
                WAIT FOR 104  us;
					 RXD <= '0';  -- bit 6
                WAIT FOR 104  us;
					 RXD <= '1';  -- bit 7					 
                
					 
					 
					 WAIT FOR 104  us;
					 RXD <= '1';  -- bit di stop			
					 
	
					 WAIT FOR 550  ns;
                CE_UART <= '1';
                RD <= '1';
                WAIT FOR 200 ns;
                CE_UART <= '0';
                RD <= '0';

                WAIT FOR 1 us;

					 WAIT FOR 550  ns;
                CE_UART <= '1';
                RD <= '1';
                WAIT FOR 200 ns;
                CE_UART <= '0';
                RD <= '0';


               WAIT FOR 1 us;

					 WAIT FOR 550  ns;
                CE_UART <= '1';
                RD <= '1';
                WAIT FOR 200 ns;
                CE_UART <= '0';
                RD <= '0';

					 WAIT ;


	END PROCESS;

END;
