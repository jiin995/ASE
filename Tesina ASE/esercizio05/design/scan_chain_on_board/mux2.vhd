----------------------------------------------------------------------------------
--! Company: 
--! Engineer: Mirko Pennone, Simone Penna, Gabriele Previtera
--! 
--! Create Date:    11:23:00 02/08/2019 
--! Design Name: 
--! Module Name:    multiplexer - Behavioral 
--! Project Name: 
--! Target Devices: 
--! Tool versions: 
--! Description: 
--
--! Dependencies: 
--
--! Revision: 
--! Revision 0.01 - File Created
--! Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--! multiplexer: l'uscita o è in0 se sel = 0, in1 se sel = 1
--! se sel assume altri valori, lo riporto in uscita per evitare fault masking

entity mux2 is
    Port ( in0 : in  STD_LOGIC;
           in1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           o : out  STD_LOGIC);
end mux2;

architecture dataflow of mux2 is

begin

with sel select
	o   <=  in0 when '0',
		    in1 when '1',
		    sel when others;

end dataflow;

