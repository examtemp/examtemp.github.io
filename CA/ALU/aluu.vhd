----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:02 06/13/2022 
-- Design Name: 
-- Module Name:    aluu - Behavioral 
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

entity aluu is
    Port ( a,b,sel : in  STD_LOGIC_VECTOR (1 downto 0);
           res : out  STD_LOGIC_VECTOR (1 downto 0));
end aluu;

architecture Behavioral of aluu is

begin


Process(a,b,sel)
begin
	case sel is 
		when "00" =>
			res <= a+b;
		when "01" =>
			res <= a+(not b)+1;
		when "10" =>
			res <= a and b;
		when "11" =>
			res <= a or b;
		when others =>
			res <= "XX";
	end case;
end process;


end Behavioral;

