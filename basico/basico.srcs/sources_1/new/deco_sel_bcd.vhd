


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity deco_sel_bcd is
    Port ( clock_div : in STD_LOGIC_VECTOR (1 downto 0);
           sel : out STD_LOGIC_VECTOR (3 downto 0));
end deco_sel_bcd;

architecture Behavioral of deco_sel_bcd is

begin
sel <= "1110" when clock_div = "00" else
       "1101" when clock_div = "01" else
       "1011" when clock_div = "10" else
       "0111" when clock_div = "11" else
       "1111";

end Behavioral;
