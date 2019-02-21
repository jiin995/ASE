library IEEE;
    use IEEE.STD_LOGIC_1164.all;
	 use IEEE.math_real.all;
	 use IEEE.numeric_std.all;

entity carrySelect_addSub is 
    generic (	 M       : NATURAL :=  4;
    -- P parallelismo delle celle dell carry select
                P       : NATURAL :=  2
    -- Come metto M e P, marco e co fanno la stima dei tempi e mettono solo width da cui ricavano poi M e P 
    -- io direi di fare una versione con M e P espliciti e una versione come l'hanno fatta loro, ma su quella
    --resta da capire come fanno a prendere solo una parte del segnale 
    );
    port (
            A           : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- input addendo
            B           : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- input addendo
            subtract    : in    STD_LOGIC ;
            S           : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);  -- output somma
            overflow    : out   STD_LOGIC ;
            c_out       : out   STD_LOGIC                               -- output carry in uscita
    );
end carrySelect_addSub;

--================================================================================================
-- architecture declaration
--================================================================================================

architecture structural of carrySelect_addSub is

    component overflow_checker is 
        port (
                    a:   in  STD_LOGIC; --! bit più significativo (segno) di A
                    b:   in  STD_LOGIC; --! bit più significativo (segno) di B
                    subtract: in STD_LOGIC; --! bit di operazione: 1 se sottrazione, 0 se addizione
                    s:   in  STD_LOGIC; --! bit più significativo (segno) di S
						  c_out : in STD_LOGIC;
                    overflow: out STD_LOGIC --! bit alto se ho una condizione di overflow
            );
        end component;

    component carrySelect_adder is 
		  generic ( M : NATURAL := 4;
						P : NATURAL := 2
				);
        port (
                A       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);
                B       : in    STD_LOGIC_VECTOR (((M*P)-1) downto 0);
                c_in    : in    STD_LOGIC ;
                S       : out   STD_LOGIC_VECTOR (((M*P)-1) downto 0);
                c_out   : out   STD_LOGIC
        );
    end component;

-- Devo fare la XOR con subtract
signal internal_B   : STD_LOGIC_VECTOR (((M*P)-1) downto 0) := (others => '0');
signal subtract_vec : STD_LOGIC_VECTOR (((M*P)-1) downto 0 ) := (others => '0');
signal S_TEMP       : STD_LOGIC_VECTOR (((M*P)-1) downto 0 ) := (others => '0');
signal c_out_int	  : STD_LOGIC := '0';
begin

    S            <= S_TEMP;
    subtract_vec <= (others => subtract);
    internal_B   <= B xor subtract_vec;
	 c_out <= c_out_int;
    
-- istanzio il numero di celle e le mappo con gli ingressi
    carrySelect_adder_inst: carrySelect_adder generic	map (  M => M,
																				 P => P
																)
															 port map (    A       => A ,
                                                            B       => internal_B,
                                                            c_in    => subtract,
                                                            S       => S_TEMP,
                                                            c_out   => c_out_int
                                                );
	 
    overflow_checker_inst : overflow_checker port map (  a => A((M*P)-1),
                                                         b => B((M*P)-1),
                                                         subtract => subtract,
                                                         s => S_TEMP((M*P)-1),
																			c_out => c_out_int,
                                                         overflow => overflow
                                                );
end structural;