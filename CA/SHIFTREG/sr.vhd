----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:20 06/13/2022 
-- Design Name: 
-- Module Name:    sr - Behavioral 
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

entity sr is
    Port ( A,CLK : in  STD_LOGIC;
           B : out  STD_LOGIC);
end sr;

architecture Behavioral of sr is

COMPONENT dff is
    Port ( D,CLOCK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end COMPONENT;

SIGNAL Z1,Z2,Z3 : STD_LOGIC;

begin

L1: dff PORT MAP(A,CLK,Z1);
L2: dff PORT MAP(Z1,CLK,Z2);
L3: dff PORT MAP(Z2,CLK,Z3);
L4: dff PORT MAP(Z3,CLK,B);

end Behavioral;

