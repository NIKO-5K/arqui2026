
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity suma1b is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sout : out STD_LOGIC;
           cout : out STD_LOGIC);
end suma1b;

architecture Behavioral of suma1b is

begin

sout <= a xor b xor cin;
cout <= (a and b) or ((a xor b) and cin); 


end Behavioral;
