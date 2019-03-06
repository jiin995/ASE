library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY TB_SISTEMA_COMPLETO IS
END TB_SISTEMA_COMPLETO;

ARCHITECTURE testbench_arch OF TB_SISTEMA_COMPLETO IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT sistema_mic1
        PORT (
            RXD : In std_logic;
            TXD : Out std_logic;
            ck : In std_logic
        );
    END COMPONENT;

    SIGNAL RXD : std_logic := '1';
    SIGNAL TXD : std_logic := '0';
    SIGNAL ck : std_logic := '0';
	

    constant PERIOD : time := 20 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : sistema_mic1
        PORT MAP (
            RXD => RXD,
            TXD => TXD,
            ck => ck
        );

        PROCESS    --! clock process for ck
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                ck <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                ck <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN



					 RXD <= '1'; 	
                WAIT FOR 1 us;  

                --! -------------!  Current Time:  2100ns
                WAIT FOR 1 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';
                --! -------------------------------------


                WAIT FOR 1600 us;  --pausa



					 RXD <= '1'; 	
                WAIT FOR 204 us;  --tempo di bit

                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';



                WAIT FOR 1000 us;  --pausa




                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';


                WAIT FOR 1000 us;  --pausa



                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';


                WAIT FOR 1000 us;  --pausa



                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';


                WAIT FOR 1000 us;  --pausa




                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';


                WAIT FOR 1000 us;  --pausa




                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';



                WAIT FOR 1000 us;  --pausa




                --! -------------!  Current Time:  2100ns
                WAIT FOR 104 us;  --tempo di bit
                RXD <= '0';  --start bit
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '1';  --bit 0
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 1
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 2
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 3
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 4
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '1';  --bit 5
                WAIT FOR 104 us;  --tempo di bit
  
                RXD <= '0';  --bit 6
                WAIT FOR 104 us;  --tempo di bit

                RXD <= '0';  --bit 7
                WAIT FOR 104 us;  --tempo di bit
 
                RXD <= '1';  --bit di stop
                WAIT FOR 104 us;  --tempo di bit 
 
                RXD <= '1';


                WAIT;

            END PROCESS;

    END testbench_arch;

