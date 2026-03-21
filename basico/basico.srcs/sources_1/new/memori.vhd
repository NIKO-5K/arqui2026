----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2026 11:50:48
-- Design Name: 
-- Module Name: memori - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memori is
    Port ( addres : in STD_LOGIC_VECTOR (7 downto 0);
           datain : in STD_LOGIC_VECTOR (7 downto 0);
           write : in std_logic;
            clock : in std_logic;
            dataOut : out STD_LOGIC_VECTOR (7 downto 0));
end memori;

architecture Behavioral of memori is
    type tipo_ram is array(0 to 255) of std_logic_vector (7 downto 0);
    signal ram_memori : tipo_ram;
begin
process (clock)
begin
if( clock'event and clock = '1' and write = '1') then
    ram_memori (conv_integer (addres))<= datain;
    end if;
    end process ;
dataOut <= ram_memori (conv_integer(addres));

end Behavioral;
