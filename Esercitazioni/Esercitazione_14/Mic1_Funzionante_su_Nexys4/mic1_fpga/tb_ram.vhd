
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:17:25 04/03/2009
-- Design Name:   ram
-- Module Name:   C:/Documents and Settings/caccolillo/Desktop/ccellar_mic_vhdl/mic1/tb_ram.vhd
-- Project Name:  mic1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : tb_ram.vhw
-- /___/   /\     Timestamp : Fri Apr 03 20:43:39 2009
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tb_ram
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tb_ram IS
END tb_ram;

ARCHITECTURE testbench_arch OF tb_ram IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT ram
        PORT (
            cs : In std_logic;
            ck : In std_logic;
            we : In std_logic;
            rd : In std_logic;
            addr : In std_logic_vector (6 DownTo 0);
            data : InOut std_logic_vector (31 DownTo 0)
        );
    END COMPONENT;

    SIGNAL cs : std_logic := '0';
    SIGNAL ck : std_logic := '0';
    SIGNAL we : std_logic := '0';
    SIGNAL rd : std_logic := '0';
    SIGNAL addr : std_logic_vector (6 DownTo 0) := "0000000";
    SIGNAL data : std_logic_vector (31 DownTo 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : ram
        PORT MAP (
            cs => cs,
            ck => ck,
            we => we,
            rd => rd,
            addr => addr,
            data => data
        );

        PROCESS    -- clock process for ck
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                ck <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                ck <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  900ns
                WAIT FOR 900 ns;
                cs <= '1';
                we <= '1';
                data <= "00000000000000000000000000000001";
                -- -------------------------------------
                -- -------------  Current Time:  1100ns
                WAIT FOR 200 ns;
                cs <= '0';
                we <= '0';
                data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
                -- -------------------------------------
                -- -------------  Current Time:  1500ns
                WAIT FOR 400 ns;
                cs <= '1';
                rd <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1700ns
                WAIT FOR 200 ns;
                cs <= '0';
                rd <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  2300ns
                WAIT FOR 600 ns;
                cs <= '1';
                rd <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  2500ns
                WAIT FOR 200 ns;
                cs <= '0';
                rd <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  2900ns
                WAIT FOR 400 ns;
                rd <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  3100ns
                WAIT FOR 200 ns;
                cs <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  3300ns
                WAIT FOR 200 ns;
                cs <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  3500ns
                WAIT FOR 200 ns;
                rd <= '0';
                -- -------------------------------------
                WAIT FOR 5700 ns;

            END PROCESS;

    END testbench_arch;

