----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2026 12:40:36
-- Design Name: 
-- Module Name: registro32b - Behavioral
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

entity registro32b is
    Port ( reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (31 downto 0);
           dataout : out STD_LOGIC_VECTOR (31 downto 0));
end registro32b;

architecture Behavioral of registro32b is

begin
    process(clock,reset)
    begin
        if(reset = '1')then
            dataout <= x"00000000";
        elsif (clock'event and clock = '1' and enable = '1') then
            dataout <= datain;
        end if;
    end process;


end Behavioral;
