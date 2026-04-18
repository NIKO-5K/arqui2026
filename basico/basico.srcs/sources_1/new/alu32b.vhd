----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2026 12:39:56
-- Design Name: 
-- Module Name: alu32b - Behavioral
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
use IEEE.std_logic_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu32b is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           opcode : in STD_LOGIC_VECTOR (2 downto 0);
           zero : out STD_LOGIC;
           alu32bOut : out STD_LOGIC_VECTOR (31 downto 0));
end alu32b;



architecture Behavioral of alu32b is
signal result : std_logic_vector (31 downto 0);
begin

process (a, b, opcode)
begin 
    case(opcode) is
        when "000" => result <= a and b;
        when "001" => result <= a or b;
        when "010" => result <= a + b;
        when "011" => result <= a - b;
        when "111" => 
            if (a < b) then 
                result <= x"00000001";
            else 
                result <= x"00000000";
            end if;
        when others => result <= a + b; 
    end case;
 end process ;
 
 zero <= '1' when result = x"00000000" else '0';
 alu32bOut <= result;
end Behavioral;
