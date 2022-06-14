----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:12 06/13/2022 
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
           SUM,COUT : out  STD_LOGIC);
end fadder;

architecture Behavioral of fadder is

begin

SUM <= A XOR B XOR CIN;
COUT <= (CIN AND (A XOR B)) OR (A AND B);

end Behavioral;

