---------------------------------------------------------------------------------------------------
--! 
--! FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
--! 
---------------------------------------------------------------------------------------------------
--! project name : rippleCarry_adder
--
--! unit name: rippleCarry_adder_testbench.vhdl
--!     
--! file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       15/10/2018
--! @version    0.1
--! @brief      rippleCarry_adder_testbench è l'implementazione del testbench di un rippleCarry_adder
--! @details
--!
--! <b>Dependencies:</b>\n
--!   full_adder
--!
--! modified by: Gabriele Previtera
--
---------------------------------------------------------------------------------------------------
--! last changes: <11/11/2018> <15/10/2018> <log>
--!                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.numeric_std.all;

entity rippleCarry_adder_testbench is 
    generic (
                par : NATURAL :=4
    );
end rippleCarry_adder_testbench;

architecture behaviral of rippleCarry_adder_testbench is 

signal  X       : STD_LOGIC_VECTOR (par-1 downto 0) := (others => '0');    
signal  Y       : STD_LOGIC_VECTOR (par-1 downto 0) := (others => '0');    
signal  c_in    : STD_LOGIC := '0';

signal  S       : STD_LOGIC_VECTOR (par-1 downto 0); 
signal  c_out   : STD_LOGIC := '0';

component rippleCarry_adder is 
    generic (
                width   : NATURAL := 8          
    );

    port (  X       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            Y       :   in  STD_LOGIC_VECTOR (width-1 downto 0);    
            c_in    :   in  STD_LOGIC;                              
            S       :   out STD_LOGIC_VECTOR  (width-1 downto 0);   
            c_out   :   out STD_LOGIC                             
    );
end component;

begin

    uut : rippleCarry_adder generic map (
                                        width => par
    )
        port map ( X       => X,
                                        Y       => Y,
                                        c_in    => c_in,
                                        S       => S,
                                        c_out   => c_out
    );

    stim_proc: process
        begin
            c_in <= '0';
            wait for 40 ns;
                for i in 0 to par-1 loop 
                    X(i) <= '1'; --std_logic_vector(to_unsigned(i, X'length));
                    wait for 10 ns;
                    c_in <= NOT c_in;
                    wait for 10 ns;
                    Y(i)<= '1';
                    wait for 10 ns;
                end loop;

            wait;
        end process;
end behaviral;
