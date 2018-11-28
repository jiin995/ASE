
-------------------------------------------------------------------------------
-- Copia da me modificata il 16/11/2018
--
--
-- Copyright Jamil Khatib 1999
-- 
--
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it under the terms of the Openip General Public
-- License as it is going to be published by the OpenIP Organization and any
-- coming versions of this license.
-- You can check the draft license at
-- http://www.openip.org/oc/license.html
--
--
-- Creator : Jamil Khatib
-- Date 10/10/99
--
-- version 0.19991226
--
-- This file was tested on the ModelSim 5.2EE
-- The test vecors for model sim is included in vectors.do file
-- This VHDL design file is proved through simulation but not verified on Silicon
-- 
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
USE ieee.std_logic_unsigned.ALL;

-- Dual port Memory core

ENTITY dpmem IS
generic ( ADD_WIDTH: integer := 8 ;
		 WIDTH : integer := 8);
  PORT (
    clk      : IN  std_logic;                                -- write clock
    reset    : IN  std_logic;                                -- System Reset
    W_add    : IN  std_logic_vector(add_width -1 downto 0);  -- Write Address
    R_add    : IN  std_logic_vector(add_width -1 downto 0);  -- Read Address
    Data_In  : IN  std_logic_vector(WIDTH - 1  DOWNTO 0);    -- input data
    Data_Out : OUT std_logic_vector(WIDTH -1   DOWNTO 0);    -- output Data
    WE       : IN  std_logic;                                -- Write Enable
    RE       : IN  std_logic);                               -- Read Enable
END dpmem;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

ARCHITECTURE dpmem_v3 OF dpmem IS


  TYPE data_array IS ARRAY (integer range <>) OF std_logic_vector(WIDTH -1  DOWNTO 0);
                                        -- Memory Type
  SIGNAL data : data_array(0 to (2** add_width) );  -- Local data



  procedure init_mem(signal memory_cell : inout data_array ) is
  begin

    for i in 0 to (2** add_width) loop
      memory_cell(i) <= (others => '0');
    end loop;

  end init_mem;


BEGIN  -- dpmem_v3

  PROCESS (clk, reset)

  BEGIN  -- PROCESS
    -- activities triggered by asynchronous reset (active low)
    IF reset = '0' THEN
      data_out <= (OTHERS => 'U');
      init_mem ( data);

      -- activities triggered by rising edge of clock
    ELSIF clk'event AND clk = '0' THEN
      IF RE = '1' THEN
       data_out <= data(CONV_INTEGER(R_add));
      else
        data_out <= (OTHERS => 'U');    -- Defualt value
      END IF;

      IF WE = '1' THEN
        data(CONV_INTEGER(W_add)) <= Data_In;
      END IF;
    END IF;
  END PROCESS;
END dpmem_v3;

