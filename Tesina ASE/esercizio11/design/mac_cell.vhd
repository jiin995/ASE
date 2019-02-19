library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- la cella MAC si occupa di realizzare le somme parziali
-- ad ogni stadio del moltiplicatore, effettuando prima la
-- moltiplicazione tra x e y e poi sommando tale risultato
-- con carry e somma degli stadi precedenti (c_in e s_in)
-- tramite un full adder

entity mac_cell is    
    port (  X       : in    STD_LOGIC;  -- primo operando
            Y       : in    STD_LOGIC;  -- secondo operando
            C_in    : in    STD_LOGIC;  -- carry in ingresso
            S_in    : in    STD_LOGIC;  -- somma in ingresso
            C_out   : out   STD_LOGIC;  -- carry in uscita  
            S_out   : out   STD_LOGIC   -- somma in uscita
    );
end mac_cell;

architecture dataflow of mac_cell is

component full_adder is
  PORT (  X   :   in  STD_LOGIC;	--! full_adder input : addendo
          Y   :   in  STD_LOGIC;	--! full_adder input : addendo
          CIN :   in  STD_LOGIC;	--! full_adder input : carry in ingresso
          S   :   out STD_LOGIC;	--! full_adder output : somma
          C   :   out STD_LOGIC		--! full_adder output : carry

  );
end component;

signal prodotto_xy : STD_LOGIC := '0';  -- prodotto parziale

begin

    prodotto_xy <= X and Y;     -- calcolo il prodotto parziale

    full_adder_inst : full_adder port map ( X   => prodotto_xy, 
                                            Y   => S_in,
                                            CIN => C_in,
                                            S   => S_out, -- somma parziale
                                            C   => C_out  -- carry in uscita
                                );

end dataflow;