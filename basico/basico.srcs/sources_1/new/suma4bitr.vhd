library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity suma4bitr is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           sout : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end suma4bitr;

architecture Behavioral of suma4bitr is
component suma1b
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sout : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal c0,c1,c2,c3 : std_logic; 
begin
    s0: suma1b 
        port map(
            cin => cin,
            a => a(0),
            b => b(0),
            sout => sout(0),
            cout => c0
        );
    s1: suma1b 
        port map(
            cin => c0,
            a => a(1),
            b => b(1),
            sout => sout(1),
            cout => c1
        );
    s2: suma1b 
        port map(
            cin => c1,
            a => a(2),
            b => b(2),
            sout => sout(2),
            cout => c2
        );
    s3: suma1b 
        port map(
            cin => c2,
            a => a(3),
            b => b(3),
            sout => sout(3),
            cout => cout
        );
    
end Behavioral;
