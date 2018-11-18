----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:06 11/18/2018 
-- Design Name: 
-- Module Name:    clock_divisor_counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divisor_counter is
    Port ( clock : in  STD_LOGIC;
				hit : out STD_LOGIC;
           counts : out  STD_LOGIC_VECTOR (1 downto 0));
end clock_divisor_counter;

architecture architectural of clock_divisor_counter is

component clock_divisor is
    generic (   clock_frequency_in  : integer := 100000000;
                clock_frequency_out : integer := 10
    );

    port (  enable      :   in STD_LOGIC;
            reset_n     :   in STD_LOGIC;
            clock_freq_in    :   in STD_LOGIC ;
            clock_freq_out   :   out STD_LOGIC 
    );
end component;

component counter_UpMod2n_Re_Sr is 
    generic (   n               : NATURAL :=2;
                enable_level    : STD_LOGIC :='1'
    );
    port(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR ((n-1) downto 0)    --! COUNT output
    );
end component;

signal internal_enable : STD_LOGIC := '1';
signal internal_reset : STD_LOGIC := '1';
signal clockfx : STD_LOGIC :='0';

begin

	clock_filter: clock_divisor port map (  enable      => internal_enable,
            reset_n     => internal_reset,
            clock_freq_in    => clock,
            clock_freq_out   => clockfx 
    );

	counter: counter_UpMod2n_Re_Sr 
    port map(   enable      => internal_enable ,                              --! enable input
            reset_n     => internal_reset,                             --! reset input
            clock       => clockfx,                                 --! clock input
            count_hit   => hit,                                --! count_hit output
            COUNTS      => counts  --! COUNT output
    );

end architectural;

