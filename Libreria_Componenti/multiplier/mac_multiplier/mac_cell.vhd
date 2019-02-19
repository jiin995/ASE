library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mac_cell is 
    port (  X       : in    STD_LOGIC;
            Y       : in    STD_LOGIC;
            C_in    : in    STD_LOGIC;
            S_in    : in    STD_LOGIC;
            C_out   : out   STD_LOGIC;
            S_out   : out   STD_LOGIC
    );
end mac_cell;

architecture architectural of mac_cell is

component full_adder is
  PORT (  X   :   in  STD_LOGIC;	--! full_adder input : addendo
          Y   :   in  STD_LOGIC;	--! full_adder input : addendo
          CIN :   in  STD_LOGIC;	--! full_adder input : carry in ingresso
          S   :   out STD_LOGIC;	--! full_adder output : somma
          C   :   out STD_LOGIC		--! full_adder output : carry

  );
end component;

signal prodotto_xy : STD_LOGIC := '0';

begin

    prodotto_xy <= X and Y;

    full_adder_inst : full_adder port map ( X   => prodotto_xy,
                                            Y   => S_in,
                                            CIN => C_in,
                                            S   => S_out,
                                            C   => C_out
                                );

end architectural;