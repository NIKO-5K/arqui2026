----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2026 11:58:04
-- Design Name: 
-- Module Name: flip_flop - Behavioral
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

entity flip_flop is
    Port ( d : in STD_LOGIC;
           clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           q : out STD_LOGIC);
end flip_flop;

architecture Behavioral of flip_flop is

begin

process (clock)
begin
    if (clock'event and clock ='1') then
        if clear = '1' then
            q <= '0';
        else
            q <= d;
        end if;
    end if;
    
end process;

--process (clock,clear)
--begin
--    if clear = '1' then
--            q <= '0';
--    elsif (clock'event and clock ='1') then
--            q <= d;
--    end if;

    
--end process;
end Behavioral;
