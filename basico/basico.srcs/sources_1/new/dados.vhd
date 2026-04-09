

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;



entity dados is
    Port ( reset : in STD_LOGIC;
           ini : in STD_LOGIC;
           clock : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           win : out STD_LOGIC;
           lose : out STD_LOGIC;
           tryagain : out STD_LOGIC);
end dados;

architecture Behavioral of dados is
component conta_32bit 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal tiempo_1, tiempo_2 : std_logic_vector (31 downto 0);
begin
tiempoa: conta_32bit
    port map (
        clock => clock,
        reset => reset,
        count => tiempo_1
    );
tiempob: conta_32bit
    port map (
        clock => clock,
        reset => reset,
        count => tiempo_2
    );
process 
variable seed1,seed2 : positive :=1;
variable rand : real;
variable dados : time;
begin
 uniform(seed1, seed2, rand);
 dados := integer(rand * 100.0) * 1 ns;
  wait for dados;
end process;
end Behavioral;
