library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.NUMERIC_STD.all;

entity cathodes_manager is 
    port (  select_digit    : in    STD_LOGIC_VECTOR (1 downto 0);
            values          : in    STD_LOGIC_VECTOR (15 downto 0);
            dots            : in    STD_LOGIC_VECTOR (3 downto 0);
            cathodes        : out   STD_LOGIC_VECTOR (7 downto 0)
    );
end cathodes_manager;

architecture behavioral of cathodes_manager is

constant zero       : STD_LOGIC_VECTOR(6 downto 0) := "1000000"; 
constant one        : STD_LOGIC_VECTOR(6 downto 0) := "1111001"; 
constant two        : STD_LOGIC_VECTOR(6 downto 0) := "0100100"; 
constant three      : STD_LOGIC_VECTOR(6 downto 0) := "0110000"; 
constant four       : STD_LOGIC_VECTOR(6 downto 0) := "0011001"; 
constant five       : STD_LOGIC_VECTOR(6 downto 0) := "0010010"; 
constant six        : STD_LOGIC_VECTOR(6 downto 0) := "0000010"; 
constant seven      : STD_LOGIC_VECTOR(6 downto 0) := "1111000"; 
constant eight      : STD_LOGIC_VECTOR(6 downto 0) := "0000000"; 
constant nine       : STD_LOGIC_VECTOR(6 downto 0) := "0010000"; 
constant a   	    : STD_LOGIC_VECTOR(6 downto 0) := "0001000"; 
constant b          : STD_LOGIC_VECTOR(6 downto 0) := "0000011"; 
constant c          : STD_LOGIC_VECTOR(6 downto 0) := "1000110"; 
constant d          : STD_LOGIC_VECTOR(6 downto 0) := "0100001"; 
constant e          : STD_LOGIC_VECTOR(6 downto 0) := "0000110"; 
constant f          : STD_LOGIC_VECTOR(6 downto 0) := "0001110";

alias digit_0 is values (3 downto 0);
alias digit_1 is values (7 downto 4);
alias digit_2 is values (11 downto 8);
alias digit_3 is values (15 downto 12);

signal cathodes_for_digit : STD_LOGIC_VECTOR (6 downto 0) := (others => '0');
signal nibble   : STD_LOGIC_VECTOR (3 downto 0 ) := (others => '0');

begin

    digit_switching: process (select_digit,values)
        begin  
            case select_digit is 
                when "00" => nibble <= digit_0;
                when "01" => nibble <= digit_1;
                when "10" => nibble <= digit_2;
                when "11" => nibble <= digit_3;
                when others => nibble <= (others => '0');
            end case;
        end process;

    decoder : process (nibble)
        begin  
            case nibble is
                when "0000" => cathodes_for_digit <= zero; 
                when "0001" => cathodes_for_digit <= one; 
                when "0010" => cathodes_for_digit <= two; 
                when "0011" => cathodes_for_digit <= three; 
                when "0100" => cathodes_for_digit <= four; 
                when "0101" => cathodes_for_digit <= five; 
                when "0110" => cathodes_for_digit <= six; 
                when "0111" => cathodes_for_digit <= seven; 
                when "1000" => cathodes_for_digit <= eight; 
                when "1001" => cathodes_for_digit <= nine; 
                when "1010" => cathodes_for_digit <= a; 
                when "1011" => cathodes_for_digit <= b; 
                when "1100" => cathodes_for_digit <= c; 
                when "1101" => cathodes_for_digit <= d; 
                when "1110" => cathodes_for_digit <= e; 
                when "1111" => cathodes_for_digit <= f;
            when others => cathodes_for_digit <= (others => '0');
            end case;
        end process;

    cathodes <=  not dots(to_integer(unsigned(select_digit))) & cathodes_for_digit;
end behavioral;