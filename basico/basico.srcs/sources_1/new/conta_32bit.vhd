
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity conta_32bit is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (31 downto 0));
end conta_32bit;

architecture Behavioral of conta_32bit is
signal current_stade, next_stade : std_logic_vector (31 downto 0);
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
count <= current_stade;
end Behavioral;
