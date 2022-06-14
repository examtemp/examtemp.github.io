----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:19 06/13/2022 
-- Design Name: 
-- Module Name:    fadder - Behavioral 
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

entity fadder is
    Port ( A,B,CIN : in  STD_LOGIC;
           SUM,CARRY : out  STD_LOGIC);
end fadder;

architecture Behavioral of fadder is

COMPONENT hadder is
    Port ( A,B : in  STD_LOGIC;
           SUM,CARRY : out  STD_LOGIC);
end COMPONENT;

COMPONENT og is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

SIGNAL S1,C1,C2 : STD_LOGIC;

begin

L1: hadder PORT MAP(A,B,S1,C1);
L2: hadder PORT MAP(S1,CIN,SUM,C2);
L3: og PORT MAP(C1,C2,CARRY);

end Behavioral;

