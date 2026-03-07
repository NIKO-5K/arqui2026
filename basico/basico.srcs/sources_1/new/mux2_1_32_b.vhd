


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux2_1_32_b is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC;
           mux_out32b : out STD_LOGIC_VECTOR (31 downto 0));
end mux2_1_32_b;

architecture Behavioral of mux2_1_32_b is

begin

    mux_out32b <= a when sel = '0' else 
    b;


end Behavioral;
