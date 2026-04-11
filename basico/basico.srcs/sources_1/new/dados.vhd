

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
component display_control 
    Port ( bcd_4 : in STD_LOGIC_VECTOR (15 downto 0);
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           sel_seg : out STD_LOGIC_VECTOR (3 downto 0));
end component ;

signal tiempo_1, tiempo_2 : std_logic_vector (31 downto 0);
signal numeroa, numerob : std_logic_vector  (3 downto 0 );
signal noseve, siseve : std_logic_vector (7 downto 0);
signal paldisplay : std_logic_vector (15 downto 0);
signal sel : std_logic_vector (3 downto 0);
signal segmento : std_logic_vector (6 downto 0); 
signal count_i , count, count_i2 , count2     : std_logic_vector (3 downto 0);
signal feedback,reset_int     : std_logic;

begin
reset_int <= ini or reset;
noseve <= "00000000";
siseve(7 downto 4) <= numeroa;
siseve(3 downto 0) <= numerob;
paldisplay(15 downto 8) <= noseve;
paldisplay(7 downto 0) <= siseve;

tiempoa: conta_32bit
    port map (
        clock => clock,
        reset => reset_int,
        count => tiempo_1
    );
tiempob: conta_32bit
    port map (
        clock => clock,
        reset => reset_int,
        count => tiempo_2
    );
 display : display_control
     port map (
        bcd_4 => paldisplay,
        clock => clock,
        reset => reset_int,
        seg => segmento,
        sel_seg => sel
     );
feedback <= not(count_i(3) xor count_i(2));

    process (reset_int, clock) 
        begin
        if (reset = '1') then
            count_i <= (others=>'0');
        elsif (rising_edge(clock)) then
            count_i <= count_i(2 downto 0) & feedback;
        end if;
    end process;
    count <= count_i;
    
    process (reset_int, clock) 
        begin
        if (reset = '1') then
            count_i2 <= (others=>'0');
        elsif (rising_edge(clock)) then
            count_i2 <= count_i2(2 downto 0) & feedback;
        end if;
    end process;
    count2 <= count_i2;
    process (reset,clock)
        begin
            if (reset = '1') then
                win <= '0';
                lose <= '0';
                tryagain <= '0';
            elsif (rising_edge (clock) and numeroa = numerob)then
                win <= '1';
                lose <= '0';
                tryagain <= '0';
            elsif(rising_edge (clock) and (not(numeroa = numerob))) then 
                if (numerob < numeroa)then
                    tryagain <= '1';
                    lose <= '0';
                    win <= '0';
                else
                    lose <= '1';
                    win<= '0';
                    tryagain <= '0';
                    reset_int <= '1';
                end if;
            end if;                    
        
    
    end process ;
    numeroa <= count2;
    numerob <= count;
end Behavioral;
