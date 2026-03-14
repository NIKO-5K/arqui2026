

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux4_1_4bits is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end mux4_1_4bits;

architecture Behavioral of mux4_1_4bits is

begin
with sel select
    mux_out <= a when "00",
               b when "01",
               c when "10",
               d when "11",
               a when others;

end Behavioral;
