----------------------------------------------------------------------------------
-- Company: UNIVERSITA' DEGLI STUDI DI NAPOLI FEDERICO SECONDO
-- Engineer: AIELLO MARCO MATR. 045/004437
-- 
-- Create Date:    16:17:31 01/12/2008 
---- Design Name: 
---- Module Name:    uart_serial - Behavioral 
---- Project Name: 
---- Target Devices: 
---- Tool versions: 
---- Description: 
----
---- Dependencies: 
----
---- Revision: 
---- Revision 0.01 - File Created
---- Additional Comments: 
----
------------------------------------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
------ Uncomment the following library declaration if instantiating
------ any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
--
--entity uart_serial is
--end uart_serial;
--
--architecture Behavioral of uart_serial is
--
--begin
--
--
--end Behavioral;
--



-------------------------------------------------------------------------------
-- Use of this source code through a simulator and/or a compiler tool
-- is illegal if not authorised through Author License agreement.
-------------------------------------------------------------------------------
-- top level   : uart_serial.vhd
-- File        : uart_serial.vhd
-- Author      : Xavier Martin
-- Email       : 
-- Organization: 
-- Created     : 2008, june 30th
-- Last update :
-- Simulators  : ModelSim Altera 6.0c
-- Synthesizers: Quartus II 5.0
-- Targets     : 
-- Dependency  :
-------------------------------------------------------------------------------
-- Description : This entity is a generic UART block 
--               UART allows to work with one or two bits stop
--               baud : 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200
--                      230400, 460800, 921600
--               Note:
--                   Br*br_divisor=921.600
--                   Fclk/921.600=clk_divisor
--                   => Br=Fclk/(clk_divisor*br_divisor)=1/((clk_divisor*Tclk)*br_divisor) 
-------------------------------------------------------------------------------
-- Version     : 1.0
-- Date        : 
-- Modifier    : 
-- Modif.      : 
-------------------------------------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
entity uart_serial is
  port(
    -- Global signal
    reset          : in  std_logic;                      -- reset control signal
    clk            : in  std_logic;                      -- 14.7456 Mhz Clock frequency
    -- Reception channel
    rx_data_serial : in  std_logic;                      -- Received Serial data from RS232
    rx_data_out    : out std_logic_vector(7 downto 0);   -- Received Data
    rx_data_en     : out std_logic;                      -- Received data enable control signal
    rx_ovf_err     : out std_logic;                      -- Received data over frame error detected
    rx_parity_err  : out std_logic;                      -- Received data parity error
    -- Transmition channel
    tx_data_serial : out std_logic;                      -- Transmited Serial data to RS232
    tx_data_in     : in  std_logic_vector(7 downto 0);   -- Transmited data 
    tx_data_en     : in  std_logic;                      -- Transmited data latch enable
    tx_ch_rdy      : out std_logic;                      -- Transmition channel ready status signal
    -- Control command
    baud_sel       : in  std_logic_vector(3 downto 0);   -- Baud value see Note   
    parity_en      : in  std_logic;                      -- Enable parity control signal active HIGH
    parity_type    : in  std_logic);                     -- 1:ODD parity / 0:EVEN parity 
end entity;
 
 
architecture rtl of uart_serial is
 
  -------------------------------------------------------------------------------
  -- CONSTANT DECLARATION
  -------------------------------------------------------------------------------
  constant ODD_PARITY        : std_logic := '1';
  constant EVEN_PARITY       : std_logic := '0';
--  constant CLK_DIVISOR       : integer := 16;    -- clock divisor to obtain 921600 bauds - CLK_DIVISOR = Fclk/921600
  constant CLK_DIVISOR       : integer := 5;    -- clock divisor to obtain 921600 bauds - CLK_DIVISOR = Fclk/921600
  constant BR_DIVISOR_300    : integer := 3072;  --    300 bauds bit rate divisor value
  constant BR_DIVISOR_1200   : integer := 768;   --   1200 bauds bit rate divisor value
  constant BR_DIVISOR_2400   : integer := 384;   --   2400 bauds bit rate divisor value
  constant BR_DIVISOR_4800   : integer := 192;   --   4800 bauds bit rate divisor value
--  constant BR_DIVISOR_9600   : integer := 96;    --   9600 bauds bit rate divisor value
  constant BR_DIVISOR_9600   : integer := 104;    --   9600 bauds bit rate divisor value
  constant BR_DIVISOR_19200  : integer := 48;    --  19200 bauds bit rate divisor value
  constant BR_DIVISOR_38400  : integer := 24;    --  38400 bauds bit rate divisor value
  constant BR_DIVISOR_57600  : integer := 16;    --  57600 bauds bit rate divisor value
  constant BR_DIVISOR_115200 : integer := 8;     -- 115200 bauds bit rate divisor value
--  constant BR_DIVISOR_115200 : integer := 104;     -- 115200 bauds bit rate divisor value

  constant BR_DIVISOR_230400 : integer := 4;     -- 230400 bauds bit rate divisor value
  constant BR_DIVISOR_460800 : integer := 2;     -- 460800 bauds bit rate divisor value
  constant BR_DIVISOR_921600 : integer := 1;     -- 921600 bauds bit rate divisor value
 
 
  -------------------------------------------------------------------------------
  -- SIGNAL DECLARATION
  -------------------------------------------------------------------------------
  type tx_state_m is (IDLE,LOAD_TX_DATA,TX_DATA,TX_STOP);
  type rx_state_m is (IDLE,START_RX,EDGE_RX,SHIFT_RX,STOP_RX,RX_OVF);
  signal tx_state      : tx_state_m;
  signal rx_state      : rx_state_m;
  signal br_divisor    : std_logic_vector(9 downto 0);   -- Bit rate divisor
  signal top_ref_baud  : std_logic;                      -- Top reference baud 921600
  signal tx_top_baud   : std_logic;                      -- Transmit Top selected baud
  signal rx_top_baud   : std_logic;                      -- Transmit Top selected baud
  signal tx_data_s     : std_logic_vector(7 downto 0);   -- Sample Transmited data input
  signal tx_data_reg   : std_logic_vector(10 downto 0);  -- Transmited data register
  signal rx_data_i     : std_logic_vector(7 downto 0);   -- Intermediary Received data
  signal rx_parity_err_i : std_logic;                    -- Intermediary parity error status signal
  signal clr_rx_baud   : std_logic;                      -- clear Receive baud counter divisor counter
 
  -------------------------------------------------------------------------------
  -- FUNCTION DECLARATION
  ------------------------------------------------------------------------------
  function parity (data: std_logic_vector; parity_type : std_logic) return std_logic is
    variable tmp : std_logic;
  begin
    if parity_type = EVEN_PARITY then    -- making the number of data even
      tmp := '0';
      for i in data'range loop
        tmp := tmp xor data(i);
      end loop;
    elsif parity_type = ODD_PARITY then  -- making the number of data odd
      tmp := '1';
      for i in data'range loop
        tmp := tmp xnor data(i);
      end loop;
    end if;
 
    return tmp;
  end function;
 
 
begin
 
 
  -------------------------------------------------------------------------------
  -- This process is used to select bit rate divisor associated to baud_sel
  -- vector value. The bit rate divisor is necessary to obtain the correct baud
  -- once the 921600 baud is obtain by clock division
  -------------------------------------------------------------------------------
  baud_sel_proc:
  process(reset, clk)
  begin
    if reset = '1' then
      br_divisor <= (others => '0');
    elsif rising_edge(clk) then
      case baud_sel is
           when x"0" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_300,br_divisor'length));       --    300 bauds
           when x"1" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_1200,br_divisor'length));      --   1200 bauds
           when x"2" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_2400,br_divisor'length));      --   2400 bauds
           when x"3" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_4800,br_divisor'length));      --   4800 bauds
           when x"4" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_9600,br_divisor'length));      --   9600 bauds
           when x"5" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_19200,br_divisor'length));     --  19200 bauds
           when x"6" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_38400,br_divisor'length));     --  38400 bauds
           when x"7" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_57600,br_divisor'length));     --  57600 bauds
           when x"8" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_115200,br_divisor'length));    -- 115200 bauds
           when x"9" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_230400,br_divisor'length));    -- 230400 bauds
           when x"A" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_460800,br_divisor'length));    -- 460800 bauds
           when x"B" =>   br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_921600,br_divisor'length));    -- 921600 bauds
           when others => br_divisor <= std_logic_vector(to_unsigned(BR_DIVISOR_115200,br_divisor'length));
      end case;
    end if;
  end process;
 
 
  -------------------------------------------------------------------------------
  -- This process is neccessary to obtain the 921600 baud. This baud is obtained by
  -- dividing clock frequency with the followed equation CLK_DIVISOR = Fclk/921600
  -- This baud will be the reference one to obtain others ones.
  -------------------------------------------------------------------------------
  baud_ref_proc:
  process(reset, clk)
    variable clk_divisor_cnt : integer range 0 to CLK_DIVISOR;  -- Clock divisier counter
  begin
    if reset = '1' then
      top_ref_baud     <= '0';
      clk_divisor_cnt := 0;
    elsif rising_edge(clk) then
      top_ref_baud    <= '0';
      clk_divisor_cnt := clk_divisor_cnt + 1;
 
      if clk_divisor_cnt = CLK_DIVISOR then
        top_ref_baud    <= '1';
        clk_divisor_cnt := 0;
      end if;
 
    end if;
  end process;
 
 
  -------------------------------------------------------------------------------
  -- This process is necessary to obtain the selected bit rate by divising the 
  -- 921600 reference baud with baud selected value.
  -------------------------------------------------------------------------------
  tx_baud_proc:
  process(reset, clk)
    variable tx_br_divisor_cnt : integer range 0 to BR_DIVISOR_300;
  begin
    if reset = '1' then
      tx_top_baud       <= '0';
      tx_br_divisor_cnt := 0;
    elsif rising_edge(clk) then
      tx_top_baud       <= '0';
      if top_ref_baud = '1' then
        tx_br_divisor_cnt := tx_br_divisor_cnt + 1;
 
        if tx_br_divisor_cnt = br_divisor then
          tx_top_baud       <= '1';
          tx_br_divisor_cnt := 0;
        end if;
 
      end if;
    end if;
  end process;
 
  rx_baud_proc:
  process(reset, clk)
    variable rx_br_divisor_cnt : std_logic_vector(9 downto 0);
  begin
    if reset = '1' then
      rx_top_baud       <= '0';
      rx_br_divisor_cnt := (others => '0');
    elsif rising_edge(clk) then
      rx_top_baud       <= '0';
      if clr_rx_baud = '1' then
        rx_br_divisor_cnt := (others => '0');
      elsif top_ref_baud = '1' and rx_state /= IDLE then
        rx_br_divisor_cnt := rx_br_divisor_cnt + 1;
 
        if rx_br_divisor_cnt(8 downto 0) = br_divisor(9 downto 1) then
          rx_top_baud       <= '1';
          rx_br_divisor_cnt := (others => '0');
        end if;
 
      end if;
    end if;
  end process;  
 
 
  -------------------------------------------------------------------------------
  -- Transmition process
  -------------------------------------------------------------------------------
  tx_proc:
  process(reset, clk)
    variable tx_bit_cnt : integer;
  begin
    if reset = '1' then
      tx_data_s      <= (others => '0');
      tx_data_reg    <= (others => '1');
      tx_ch_rdy      <= '0';
    elsif rising_edge(clk) then
      case tx_state is
        when IDLE =>
             if tx_data_en = '1' then
               tx_data_s <= tx_data_in;
               tx_ch_rdy <= '0';
               tx_state  <= LOAD_TX_DATA;
             else
               tx_ch_rdy <= '1';
             end if;
 
        when LOAD_TX_DATA =>
             if tx_top_baud = '1' then
               if parity_en = '1' then
                 -- start + data + parity + stop
                 tx_bit_cnt  := 8 + 3;
                 tx_data_reg(10 downto 0) <= '1' & parity(tx_data_s,parity_type) & tx_data_s(7 downto 0) & '0';
               else
                 -- start + data + stop
                 tx_bit_cnt  := 8 + 2;
                 tx_data_reg(10 downto 0) <= "11" & tx_data_s(7 downto 0) & '0';
               end if;
               tx_state <= TX_DATA;
             end if;
 
        when TX_DATA =>
             if tx_top_baud = '1' then
               tx_data_reg(10 downto 0) <= '1' & tx_data_reg(10 downto 1);
               tx_bit_cnt  := tx_bit_cnt-1;
               if tx_bit_cnt = 1 then
                 tx_state <= TX_STOP;
               end if;
             end if;
 
        when TX_STOP => -- stop bit
             if tx_top_baud = '1' then
               tx_state <= IDLE;
             end if;             
 
        when others =>
             null;
      end case;
    end if;
  end process;
 
  tx_data_serial <= tx_data_reg(0);
 
 
  -------------------------------------------------------------------------------
  -- Reception process
  -------------------------------------------------------------------------------
  process(reset, clk)
    variable rx_bit_cnt : integer;
  begin
    if reset = '1' then
      rx_data_out    <= (others => '0');
      rx_data_en     <= '0';
      rx_ovf_err     <= '0';
      rx_data_i      <= (others => '0');    
      rx_parity_err  <= '0';
      rx_parity_err_i<= '0';
 
    elsif rising_edge(clk) then
 
      clr_rx_baud    <= '0';
      rx_ovf_err     <= '0';
      rx_parity_err  <= '0';
      rx_parity_err_i<= '0';
      rx_data_en     <= '0';
 
      case rx_state is
        when IDLE =>  -- Wait start bit
             if top_ref_baud = '1' then
               if rx_data_serial = '0' then
                 clr_rx_baud <= '1';
                 rx_state <= START_RX;
                 rx_bit_cnt := 1;
               end if;
             end if;
 
 
        when START_RX =>
             if rx_top_baud = '1' then                  
               if rx_data_serial = '1' then
                 rx_state <= RX_OVF;
               else  
                 rx_state <= EDGE_RX;
               end if;
             end if;
 
 
        when EDGE_RX =>
             if rx_top_baud = '1' then
               if (parity_en = '1' and rx_bit_cnt = 10) or                             -- start + data + parity + stop
                  (parity_en = '0' and rx_bit_cnt = 9) then                            -- start + data + stop
                 rx_state <= STOP_RX;
               else                         -- data
                 rx_state <= SHIFT_RX;
               end if;
             end if;
 
        when SHIFT_RX =>
             if rx_top_baud = '1' then
               rx_bit_cnt := rx_bit_cnt + 1;
               if not((parity_en = '1' and rx_bit_cnt = 10)) then                      -- start + data + parity + stop
                 rx_data_i(7 downto 0) <= rx_data_serial & rx_data_i(7 downto 1); 
               else
                 if parity(rx_data_i,parity_type) /= rx_data_serial then
                   rx_parity_err_i <= '1';
                 end if;
               end if;
               rx_state <= EDGE_RX;
             end if;
 
 
        when STOP_RX =>
--             if rx_top_baud = '1' then
               rx_data_out <= rx_data_i;
               rx_parity_err <= rx_parity_err_i;
               rx_ovf_err  <= '0';
               rx_data_en  <= '1';
               rx_state <= IDLE;
--             end if;
 
        when RX_OVF =>    -- Overframe error
             rx_ovf_err <= '1';
             if rx_data_serial = '1' then
               rx_state <= IDLE;
             end if;
 
        when others => null;
      end case;
    end if;
  end process;
 
end rtl;

