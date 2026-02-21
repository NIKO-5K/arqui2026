----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2026 12:16:45
-- Design Name: 
-- Module Name: decoBDC_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoBDC_7seg is
    Port ( bcd : in STD_LOGIC_VECTOR (3 downto 0);
           seg7 : out STD_LOGIC_VECTOR (6 downto 0));
end decoBDC_7seg;

architecture Behavioral of decoBDC_7seg is

begin
-- seven seg abcdefg  /       bcd 8420
    seg7 <= "0000001" when bcd = "0000" else
            "1001111" when bcd = "0001" else
            "0010010" when bcd = "0010" else
            "0000110" when bcd = "0011" else
            "1001100" when bcd = "0100" else
            "0100100" when bcd = "0101" else
            "0100000" when bcd = "0110" else
            "0001111" when bcd = "0111" else
            "0000000" when bcd = "1000" else
            "0001100" when bcd = "1001" else
            "1101010";
                


end Behavioral;
