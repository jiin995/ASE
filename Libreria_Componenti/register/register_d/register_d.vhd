
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity register_d is 

    generic(    dimension   :   NATURAL :=7;
                reset_level     :   STD_LOGIC :='0';    --! define reset level
                enable_level    :   STD_LOGIC := '1'    --! define enable level
    );

    port(   clock   :   in  STD_LOGIC;
            enable  :   in  STD_LOGIC;
            reset   :   in  STD_LOGIC;
            D       :   in  STD_LOGIC_VECTOR    (dimension downto 0);
            Q       :   out STD_LOGIC_VECTOR    (dimension downto 0)
    );
end register_d;

architecture behavioral of register_d is 

signal Q_temp   :   STD_LOGIC_VECTOR    (dimension downto 0) := (others => '0');

begin
    Q <= Q_temp;

    ff : process (clock)
        begin
            if rising_edge(clock) and (enable = enable_level) then
                Q_temp <= D;
            end if;
        end process ff;
end behavioral;