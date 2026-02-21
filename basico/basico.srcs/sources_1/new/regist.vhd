----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2026 12:18:34
-- Design Name: 
-- Module Name: regist - Behavioral
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

entity regist is
    Port ( d : in STD_LOGIC_VECTOR (7 downto 0);
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end regist;

architecture Behavioral of regist is

begin
process (clock,reset)
begin
    if reset = '1' then
            q <= "00000000";
    elsif (clock'event and clock ='1') then
            q <= d;
    end if;
end process;
end Behavioral;
