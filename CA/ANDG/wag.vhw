--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : wag.vhw
-- /___/   /\     Timestamp : Mon Jun 13 20:16:24 2022
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wag
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wag IS
END wag;

ARCHITECTURE testbench_arch OF wag IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT ag
        PORT (
            A : In std_logic;
            B : In std_logic;
            C : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';
    SIGNAL C : std_logic := '0';

    BEGIN
        UUT : ag
        PORT MAP (
            A => A,
            B => B,
            C => C
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  200ns
                WAIT FOR 200 ns;
                B <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                A <= '1';
                B <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                B <= '1';
                -- -------------------------------------
                WAIT FOR 600 ns;

            END PROCESS;

    END testbench_arch;

