----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2026 12:31:57
-- Design Name: 
-- Module Name: conta_v1 - Behavioral
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
use IEEE.std_logic_unsigned.ALL;



entity conta_v1 is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end conta_v1;

architecture Behavioral of conta_v1 is
signal current_stade, next_stade : std_logic_vector (31 downto 0);
signal bcd : std_logic_vector (3 downto 0);  
begin
process (clock,reset)
begin
    if reset = '1' then
            current_stade <= x"00000000";
    elsif (clock'event and clock ='1') then
            current_stade <= next_stade;
    end if;
end process;

next_stade <= current_stade +1;

bcd <= current_stade(31 downto 28);

 seg <= "0000001" when bcd = "0000" else
            "1001111" when bcd = "0001" else
            "0010010" when bcd = "0010" else
            "0000110" when bcd = "0011" else
            "1001100" when bcd = "0100" else
            "0100100" when bcd = "0101" else
            "0100000" when bcd = "0110" else
            "0001111" when bcd = "0111" else
            "0000000" when bcd = "1000" else
            "0001100" when bcd = "1001" else
            "0001000" when bcd = "1010" else
            "1100000" when bcd = "1011" else
            "0110001" when bcd = "1100" else
            "1000010" when bcd = "1101" else
            "0110000" when bcd = "1110" else
            "0111000" when bcd = "1111" else
            "1101010";
end Behavioral;
