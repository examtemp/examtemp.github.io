----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:40:53 06/13/2022 
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

begin

DIFF <= A XOR B;
BORROW <= (NOT A) AND B;

end Behavioral;

