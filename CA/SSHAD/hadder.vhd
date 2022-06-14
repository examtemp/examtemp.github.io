----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:44 06/13/2022 
-- Design Name: 
-- Module Name:    hadder - Behavioral 
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

entity hadder is
    Port ( A,B : in  STD_LOGIC;
           SUM,CARRY : out  STD_LOGIC);
end hadder;

architecture Behavioral of hadder is

COMPONENT xg is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

COMPONENT ag is
    Port ( A,B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

begin

L1: xg PORT MAP(A,B,SUM);
L2: ag PORT MAP(A,B,CARRY);

end Behavioral;

