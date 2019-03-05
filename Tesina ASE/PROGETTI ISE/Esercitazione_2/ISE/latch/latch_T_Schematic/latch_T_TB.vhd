
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY latch_T_latch_T_sch_tb IS
END latch_T_latch_T_sch_tb;
ARCHITECTURE behavioral OF latch_T_latch_T_sch_tb IS 

   COMPONENT latch_T
   PORT( T	:	IN	STD_LOGIC; 
          E	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL T	:	STD_LOGIC;
   SIGNAL E	:	STD_LOGIC;
   SIGNAL Q	:	STD_LOGIC;

BEGIN

   UUT: latch_T PORT MAP(
		T => T, 
		E => E, 
		Q => Q
   );

--! *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		WAIT for 10 ns;
		E <= '1', '0' after 20 ns;
		T <= '1', '0' after 10 ns, '1' after 20 ns;
      WAIT; --! will wait forever
   END PROCESS;
--! *** End Test Bench - User Defined Section ***

END;
