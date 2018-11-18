library IEEE;
    use IEEE.STD_LOGIC_1164.all;

-- per accendere il digit scelto, c'è bisogno l'anodo sia basso !
-- anche se il l'anodo dovrebbe essere alto, il circuito è 0 attivo!

entity anodes_manager is 
    port (  select_digit    :   in  STD_LOGIC_VECTOR (1 downto 0) ;
            enable_digit    :   in  STD_LOGIC_VECTOR (3 downto 0) ;
            anodes          :   out STD_LOGIC_VECTOR (3 downto 0)
    );
end anodes_manager;

architecture dataflow of anodes_manager is   

signal anodes_swhitching : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin
    anodes <= not anodes_swhitching OR not enable_digit;
    
    -- non è altro che una lookuptable!
    with select_digit select anodes_swhitching <= 
        x"1"    when "00",
        x"2"    when "01",
        x"4"    when "10",
        x"8"    when "11",
        x"F"    when others;

end dataflow;