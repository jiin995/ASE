library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all
   
    
entity counter_UpMod2n_Re_Ar is 
    generic (   n               :   NATURAL :=1;
                enable_level    :   std_logic := '1'
    );
    port(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR ((n-1) downto 0)    --! COUNT output
    );
end entity;

architecture behavioral of counter_UpMod2n_Re_Ar is

signal COUNTS_temp      : STD_LOGIC_VECTOR ((n-1) downto 0) := (others => '0');
signal count_hit_temp   : STD_LOGIC := '0';

constant max_value : NATURAL :=((2**n)-1);

begin 
    COUNTS <= COUNTS_temp;
    count_hit <= count_hit_temp;

    count : process (clock,reset_n)
        variable counter : integer range 0 to max_value := 0;

        begin
            if (reset_n = '0') then 
                counter := 0;
                count_hit_temp <= '0';
                COUNTS_temp <= ( others => '0'); 
            elsif (rising_edge(clock) and (enable = enable_level)) then 
                if counter = max_value then 
                    count_hit_temp <= '1';
                    counter := 0;
                    COUNTS_temp <= ( others => '0'); 
                else 
                    count_hit_temp <= '0';
                    counter := counter + 1;
                    COUNTS_temp <= std_logic_vector(to_unsigned(counter, COUNTS_temp'length));
                end if;
            end if;
        end process;

    
end behavioral;