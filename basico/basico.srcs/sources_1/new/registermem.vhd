----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2026 11:45:43
-- Design Name: 
-- Module Name: registermem - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registermem is
    Port ( clock : in STD_LOGIC;
           write : in STD_LOGIC;
           addres1 : in STD_LOGIC_VECTOR (4 downto 0);
           addres2 : in STD_LOGIC_VECTOR (4 downto 0);
           addres3 : in STD_LOGIC_VECTOR (4 downto 0);
           datain : in STD_LOGIC_VECTOR (31 downto 0);
           dataout1 : out STD_LOGIC_VECTOR (31 downto 0);
           dataout2 : out STD_LOGIC_VECTOR (31 downto 0));
end registermem;

architecture Behavioral of registermem is
type ram_type is array (0 to 31 ) of std_logic_vector (31 downto 0);
signal  registerfile : ram_type;
begin

process  (clock,write)
begin
    if(rising_edge (clock) and write = '1')then
        registerfile(conv_integer(addres3))<= datain;
    end if;
end process ;

dataout1 <= registerfile(conv_integer (addres1));
dataout2 <= registerfile(conv_integer (addres2));

end Behavioral;
