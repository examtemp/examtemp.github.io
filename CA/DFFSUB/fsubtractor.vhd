----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:55 06/13/2022 
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

begin

DIFF <= A XOR B XOR C;
BORROW <= ((NOT A) AND (B XOR C)) OR (B AND C);

end Behavioral;

