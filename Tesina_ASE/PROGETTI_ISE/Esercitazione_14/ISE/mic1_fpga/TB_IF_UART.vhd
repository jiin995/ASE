library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tb_if_uart IS
END tb_if_uart;

ARCHITECTURE testbench_arch OF tb_if_uart IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT if_uart
        PORT (
            TXD : Out std_logic;
            RXD : In std_logic;
            CLK : In std_logic;
            CE_UART : In std_logic;
            if_databus : InOut std_logic_vector (31 DownTo 0);
            RD : In std_logic;
            LEDS : Out std_logic_vector (7 DownTo 0);
            WR : In std_logic
        );
    END COMPONENT;

    SIGNAL TXD : std_logic := '0';
    SIGNAL RXD : std_logic := '0';
    SIGNAL CLK : std_logic := '0';
    SIGNAL CE_UART : std_logic := '0';
    SIGNAL if_databus : std_logic_vector (31 DownTo 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
    SIGNAL RD : std_logic := '0';
    SIGNAL LEDS : std_logic_vector (7 DownTo 0) := "00000000";
    SIGNAL WR : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : if_uart
        PORT MAP (
            TXD => TXD,
            RXD => RXD,
            CLK => CLK,
            CE_UART => CE_UART,
            if_databus => if_databus,
            RD => RD,
            LEDS => LEDS,
            WR => WR
        );

        PROCESS    --! clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                --! -------------!  Current Time:  550ns
                RXD <= '1'; 
					 WAIT FOR 550 ns;
                CE_UART <= '1';
                WR <= '1';
                if_databus <= "00000000000000000000000000010010";
                --! -------------------------------------
                --! -------------!  Current Time:  650ns
                WAIT FOR 200 ns;
                CE_UART <= '0';
                WR <= '0';
                if_databus <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
                --! -------------------------------------
					 WAIT FOR 4000 us;



	
                --! ricevo un dato a 115200 bps        
                --! -------------------------------------
                WAIT FOR 104  us;
					 RXD <= '0';  --start bit	
                WAIT FOR 104  us;
					 
					 
					 
					 RXD <= '1';  --! bit 0	95hex
                WAIT FOR 104  us;
					 RXD <= '0';  --! bit 1	
                WAIT FOR 104  us;
					 RXD <= '1';  --! bit 2
                WAIT FOR 104  us;
					 RXD <= '0';  --! bit 3
                WAIT FOR 104  us;
					 RXD <= '1';  --! bit 4	
                WAIT FOR 104  us;
					 RXD <= '0';  --! bit 5	
                WAIT FOR 104  us;
					 RXD <= '0';  --! bit 6
                WAIT FOR 104  us;
					 RXD <= '1';  --! bit 7					 
                
					 
					 
					 WAIT FOR 104  us;
					 RXD <= '1';  --! bit di stop			
					 
	
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

    END testbench_arch;

