---------------------------------------------------------------------------------------------------
-- 
-- FEDERICO II , CORSO DI ASE 18/19, Gruppo 14 --
-- 
---------------------------------------------------------------------------------------------------
-- project name : mac_multiplier
--
-- unit name: mac_cell.vhd
--     
-- file description:
--! @file
--! @author     Gabriele Previtera, Mirko Pennone, Simone Penna
--! @date       04/03/2019
--! @version    0.2
--! @brief     	Cella MAC che si occupa di realizzare le somme parziali ad ogni stadio del moltiplicatore
--! @details
--!
--! <b>Dependencies:</b>\n
--!   Nothings
--!
-- modified by: Simone Penna, Mirko Pennone
--
---------------------------------------------------------------------------------------------------
-- last changes: <04/03/2019> <15/10/2018> <log>
--                Aggiunta doc doxygen
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

--! la cella MAC si occupa di realizzare le somme parziali
--! ad ogni stadio del moltiplicatore, effettuando prima la
--! moltiplicazione tra x e y e poi sommando tale risultato
--! con carry e somma degli stadi precedenti (c_in e s_in)
--! tramite un full adder

entity mac_cell is    
    port (  X       : in    STD_LOGIC;  --! primo operando
            Y       : in    STD_LOGIC;  --! secondo operando
            C_in    : in    STD_LOGIC;  --! carry in ingresso
            S_in    : in    STD_LOGIC;  --! somma in ingresso
            C_out   : out   STD_LOGIC;  --! carry in uscita  
            S_out   : out   STD_LOGIC   --! somma in uscita
    );
end mac_cell;

architecture dataflow of mac_cell is

component full_adder is
  PORT (  X   :   in  STD_LOGIC;	--! full_adder input : addendo
          Y   :   in  STD_LOGIC;	--! full_adder input : addendo
          C_in :   in  STD_LOGIC;	--! full_adder input : carry in ingresso
          S   :   out STD_LOGIC;	--! full_adder output : somma
          C_out   :   out STD_LOGIC		--! full_adder output : carry

  );
end component;

signal prodotto_xy : STD_LOGIC := '0';  --! prodotto parziale

begin

    prodotto_xy <= X and Y;     --! calcolo il prodotto parziale

    full_adder_inst : full_adder port map ( X   => prodotto_xy, 
                                            Y   => S_in,
                                            C_in => C_in,
                                            S   => S_out, --! somma parziale
                                            C_out   => C_out  --! carry in uscita
                                );

end dataflow;
