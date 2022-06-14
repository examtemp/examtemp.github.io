--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : waluu.vhw
-- /___/   /\     Timestamp : Mon Jun 13 22:37:07 2022
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: waluu
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY waluu IS
END waluu;

ARCHITECTURE testbench_arch OF waluu IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT aluu
        PORT (
            a : In std_logic_vector (1 DownTo 0);
            b : In std_logic_vector (1 DownTo 0);
            sel : In std_logic_vector (1 DownTo 0);
            res : Out std_logic_vector (1 DownTo 0)
        );
    END COMPONENT;

    SIGNAL a : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL b : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL sel : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL res : std_logic_vector (1 DownTo 0) := "00";

    BEGIN
        UUT : aluu
        PORT MAP (
            a => a,
            b => b,
            sel => sel,
            res => res
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                a <= "01";
                b <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                sel <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                sel <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                sel <= "11";
                -- -------------------------------------
                WAIT FOR 600 ns;

            END PROCESS;

    END testbench_arch;

