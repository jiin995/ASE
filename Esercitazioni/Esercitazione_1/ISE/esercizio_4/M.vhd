----------------------------------------------------------------------------------
-- Company: Gruppo 14
-- Engineer: Gabriele Previtera, Mirko Pennone, Simone Penna
-- 
-- Create Date:    12:13:55 11/10/2018 
-- Design Name: 
-- Module Name:    M - Dataflow 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: La macchina M,data una parola X di 6 bit in ingresso (X5 X4 X3 X2 X1 X0), restituisce una parola Y di 3 bit (Y2 Y1 Y0) che rappresenta la codifica binaria del numero di bit alti in X.
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

entity M is
    Port ( x0 : in  STD_LOGIC;
           x1 : in  STD_LOGIC;
           x2 : in  STD_LOGIC;
           x3 : in  STD_LOGIC;
           x4 : in  STD_LOGIC;
           x5 : in  STD_LOGIC;
           y0 : out  STD_LOGIC;
           y1 : out  STD_LOGIC;
           y2 : out  STD_LOGIC);
end M;

architecture Dataflow of M is

-- defining temporary exits
signal y0_temp : std_logic := '0';
signal y1_temp : std_logic := '0';
signal y2_temp : std_logic := '0';

-- defining all the nodes of the network generated in the previous exercise (with rugged.script)
signal n10 : std_logic := '0';
signal n3 : std_logic := '0';
signal n4 : std_logic := '0';
signal n5 : std_logic := '0';
signal n6 : std_logic := '0';
signal n7 : std_logic := '0';
signal n8 : std_logic := '0';
signal n9 : std_logic := '0';

begin

-- update nodes
n10 <= x3 AND x2;
n3 <= ( x5 AND (NOT x4) ) OR ( (NOT x5) AND x4);
n4 <= ( (NOT x3) AND (NOT n3) ) OR ( x3 AND n3 );
n5 <= ( (NOT x2) AND (NOT n4) ) OR ( x2 AND n4 );
n6 <= x0 OR x1;
n8 <= x2 OR x3;
n9 <= x1 AND x0;

-- update temporary exit y0
y0_temp <= ( (NOT n5) AND n6 AND (not n9) )
				OR ( n5 AND n9 )
				OR ( n5 AND (NOT n6) );
				
-- update node n7 (requires y0_temp)
n7 <= (x5 AND (NOT y0_temp)) OR n10;

-- update temporary exits y2 and y1
y2_temp <= ( x5 AND (NOT y0_temp) AND n10 )
				OR ( x4 AND n8 AND n9 )
				OR ( x4 AND n6 AND n7 )
				OR ( n7 AND n9 );
y1_temp <= ( x4 AND (NOT n3) AND (NOT n6) AND (NOT n10) )
				OR ( x4 AND (NOT n3) AND n9 AND n10 )
				OR ( (NOT y2_temp) AND (NOT y0_temp) AND n8 )
				OR ( (NOT y2_temp) AND n3 AND n6 )
				OR ( (NOT y2_temp) AND n10 )
				OR ( (NOT y2_temp) AND n9 );

-- update exits
y0 <= y0_temp;
y1 <= y1_temp;
y2 <= y2_temp;

end Dataflow;

