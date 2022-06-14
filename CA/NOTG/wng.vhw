--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wng.vhw
-- /___/   /\     Timestamp : Mon Jun 13 20:22:26 2022
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wng
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wng IS
END wng;

ARCHITECTURE testbench_arch OF wng IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT ng
        PORT (
            A : In std_logic;
            B : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';

    BEGIN
        UUT : ng
        PORT MAP (
            A => A,
            B => B
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                A <= '1';
                -- -------------------------------------
                WAIT FOR 800 ns;

            END PROCESS;

    END testbench_arch;

