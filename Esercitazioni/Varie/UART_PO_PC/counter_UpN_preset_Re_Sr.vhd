library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;
    use IEEE.math_real.all;
    
entity counter_UpN_Re_preset_Sr is 
    generic (   n               : NATURAL :=4;
                enable_level    : STD_LOGIC :='1'
    );
    port(   enable      : in STD_LOGIC ;                                --! enable input
            reset_n     : in STD_LOGIC;                                 --! reset input
            clock       : in STD_LOGIC;                                 --! clock input
				load 			: in STD_LOGIC;
            preset      : in STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0);
            count_hit   : out STD_LOGIC;                                --! count_hit output
            COUNTS      : out STD_LOGIC_VECTOR ((integer(ceil(log2(real(n)))) -1) downto 0)    --! COUNT output
    );
end counter_UpN_Re_preset_Sr;

architecture behavioral of counter_UpN_Re_preset_Sr is

signal COUNTS_temp      : ieee.numeric_std.unsigned  ((integer(ceil(log2(real(n)))) -1) downto 0):= (others => '0');
signal count_hit_temp   : STD_LOGIC := '0';

constant max_value : NATURAL :=n-1;

begin 
    COUNTS <= std_logic_vector(COUNTS_temp);
    count_hit <= count_hit_temp;

    count : process (clock,load)
        begin
            if (rising_edge(clock) ) then 
                if (reset_n = '0') then 
                    count_hit_temp <= '0';
                    COUNTS_temp <= ( others => '0'); 
					 elsif ( load = '1' ) then 
						  counts_temp <= unsigned(preset);
                elsif(enable = enable_level) then 
                    if COUNTS_temp = max_value then 
                        count_hit_temp <= '1';
                        COUNTS_temp <= ( others => '0'); 
                    else 
                        count_hit_temp <= '0';
                        COUNTS_temp <= COUNTS_temp +1;
                    end if;
                end if;
            end if;
        end process;

    
end behavioral;