--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wfadder.vhw
-- /___/   /\     Timestamp : Mon Jun 13 21:12:00 2022
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wfadder
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wfadder IS
END wfadder;

ARCHITECTURE testbench_arch OF wfadder IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT fadder
        PORT (
            A : In std_logic;
            B : In std_logic;
            CIN : In std_logic;
            SUM : Out std_logic;
            CARRY : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';
    SIGNAL CIN : std_logic := '0';
    SIGNAL SUM : std_logic := '0';
    SIGNAL CARRY : std_logic := '0';

    BEGIN
        UUT : fadder
        PORT MAP (
            A => A,
            B => B,
            CIN => CIN,
            SUM => SUM,
            CARRY => CARRY
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                CIN <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                B <= '1';
                CIN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                CIN <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                A <= '1';
                B <= '0';
                CIN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                CIN <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                B <= '1';
                CIN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                CIN <= '1';
                -- -------------------------------------
                WAIT FOR 200 ns;

            END PROCESS;

    END testbench_arch;

