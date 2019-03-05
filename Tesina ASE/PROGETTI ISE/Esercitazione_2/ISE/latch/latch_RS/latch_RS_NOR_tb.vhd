
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY latch_RS_NOR_latch_RS_NOR_sch_tb IS
END latch_RS_NOR_latch_RS_NOR_sch_tb;
ARCHITECTURE behavioral OF latch_RS_NOR_latch_RS_NOR_sch_tb IS 

   COMPONENT latch_RS_NOR
   PORT( Q	:	OUT	STD_LOGIC; 
          NQ	:	OUT	STD_LOGIC; 
          S	:	IN	STD_LOGIC; 
          R	:	IN	STD_LOGIC;
			 E :  IN STD_LOGIC);
   END COMPONENT;

   SIGNAL Q	:	STD_LOGIC;
   SIGNAL NQ	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;
   SIGNAL R	:	STD_LOGIC;
	SIGNAL E :  STD_LOGIC;

BEGIN

   UUT: latch_RS_NOR PORT MAP(
		Q => Q, 
		NQ => NQ, 
		S => S, 
		R => R,
		E => E
   );

--! *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		E <= '1' after 10 ns;
		S <= '0' , '1' after 20 ns, '0' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns; 
		R <= '0' , '0' after 20 ns, '1' after 40 ns,'0' after 60 ns,'1' after 80 ns,'0' after 100 ns;
      WAIT FOR 20 ns;
		WAIT; --! will wait forever
   END PROCESS; 
--! *** End Test Bench - User Defined Section ***

END;
