library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity clock_divisor is
    generic (   clock_frequency_in  : integer := 100000000;
                clock_frequency_out : integer := 1000
    );

    port (  enable      :   in STD_LOGIC;
            reset_n     :   in STD_LOGIC;
            clock_freq_in    :   in STD_LOGIC ;
            clock_freq_out   :   out STD_LOGIC 
    );

end clock_divisor;

architecture behavioral of clock_divisor is

signal clock_out_temp : STD_LOGIC :='0';

constant max_value : integer := (clock_frequency_in/clock_frequency_out)-1;

begin
    clock_freq_out <= clock_out_temp;

    clock_division : process (clock_freq_in,reset_n,enable) 
        variable counter : integer range 0 to max_value := 0;
        begin   
            if reset_n = '0' then 
                counter := 0;
                clock_out_temp <= '0';
            elsif (rising_edge (clock_freq_in) and (enable='1')) then 
                if(counter = max_value) then
                    counter := 0;
                    clock_out_temp <= '1';
                else
                    counter := counter +1;
                    clock_out_temp <= '0';
                end if;
            end if;
        end process;
end;