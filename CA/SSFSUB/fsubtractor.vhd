----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:56 06/13/2022 
-- Design Name: 
-- Module Name:    fsubtractor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsubtractor is
    Port ( A,B,C : in  STD_LOGIC;
           DIFF,BORROW : out  STD_LOGIC);
end fsubtractor;

architecture Behavioral of fsubtractor is

COMPONENT ag is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

COMPONENT ng is
    Port ( A : in  STD_LOGIC;
           B : out  STD_LOGIC);
end COMPONENT;

COMPONENT og is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

COMPONENT xg is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

SIGNAL T1,T2,T3,T4,T5 : STD_LOGIC;

begin

L1: xg PORT MAP(B,C,T1);
L2: ng PORT MAP(A,T2);
L3: ag PORT MAP(T1,T2,T3);
L4: ag PORT MAP(B,C,T4);
L5: og PORT MAP(T3,T4,BORROW);
L6: xg PORT MAP(A,B,T5);
L7: xg PORT MAP(C,T5,DIFF);

end Behavioral;

