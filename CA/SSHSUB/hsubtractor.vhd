----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:34 06/13/2022 
-- Design Name: 
-- Module Name:    hsubtractor - Behavioral 
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

entity hsubtractor is
    Port ( A,B : in  STD_LOGIC;
           DIFF,BORROW : out  STD_LOGIC);
end hsubtractor;

architecture Behavioral of hsubtractor is

COMPONENT xg is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;


COMPONENT ng is
    Port ( A : in  STD_LOGIC;
           B : out  STD_LOGIC);
end COMPONENT;


COMPONENT ag is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

SIGNAL P : STD_LOGIC;

begin

L1: xg PORT MAP(A,B,DIFF);
L2: ng PORT MAP(A,P);
L3: ag PORT MAP(P,B,BORROW);

end Behavioral;

