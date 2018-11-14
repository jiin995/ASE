library IEEE;
    use IEEE.STD_LOGIC_1164.all;


entity flipflop_d is 

-- reset_level indicate the level for reset ff
    generic (   init_level   :  STD_LOGIC   := '0';
                reset_level  :  STD_LOGIC   := '0';
                enable_level :  STD_LOGIC   := '1');

    port (  clock   :   in  STD_LOGIC;
            enable  :   in  STD_LOGIC;
            reset   :   in  STD_LOGIC;
            d       :   in  STD_LOGIC;
            q       :   out STD_LOGIC );
end flipflop_d;

architecture behavioral of flipflop_d is
    
signal q_temp   :   STD_LOGIC := init_level;

begin
    q <= q_temp;

    ff : process (clock)
        begin  
            if rising_edge (clock) then
                if reset = reset_level then
                    q_temp <= init_level;
                elsif enable = enable_level then
                    q_temp <= d;
                end if;
            end if;
    end process ff;

end behavioral;


