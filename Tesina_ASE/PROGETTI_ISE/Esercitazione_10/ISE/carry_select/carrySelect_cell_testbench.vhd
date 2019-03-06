library IEEE;
    use IEEE.STD_lOGIC_1164.all;

entity carry_select_block_testbench is
    generic ( test_width : NATURAL :=4);
end carry_select_block_testbench;

--Scopo verificare che le due somme degli test_width bit avvengano parallelamente e
--! che in base al carry ingresso vengano selezionati l'opportuna somma e resto

architecture behavioral of carry_select_block_testbench is   
    component carry_select_block is 
        generic (   width   : NATURAL := test_width
        );
        port (
                A       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
                B       : in    STD_LOGIC_VECTOR ((width-1) downto 0);
                c_in    : in    STD_LOGIC ;
                S       : out   STD_LOGIC_VECTOR ((width-1) downto 0);
                c_out   : out   STD_LOGIC
        );
    end  component;

    signal X : STD_LOGIC_VECTOR (test_width-1 downto 0 ) := x"4";
    signal Y : STD_LOGIC_VECTOR (test_width-1 downto 0 ) := x"2";
    signal SUM : STD_LOGIC_VECTOR (test_width-1 downto 0) := (others => '0');
    signal c_in :  STD_LOGIC := '0';
    signal c_out : STD_LOGIC := '0';

begin
    uut: carry_select_block port map (
            A => X,
            B => Y,
            c_in => c_in,
            S => SUM,
            c_out => c_out
    );

stim_proc: process 
    begin
        wait for 20 ns;
        c_in <= '1';
        wait;
    end process;
end behavioral;