----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2026 12:40:17
-- Design Name: 
-- Module Name: display_control - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_control is
    Port ( bcd_4 : in STD_LOGIC_VECTOR (15 downto 0);
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           sel_seg : out STD_LOGIC_VECTOR (3 downto 0));
end display_control;

architecture Behavioral of display_control is
component decoBDC_7seg 
    Port ( bcd : in STD_LOGIC_VECTOR (3 downto 0);
           seg7 : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component deco_sel_bcd 
    Port ( clock_div : in STD_LOGIC_VECTOR (1 downto 0);
           sel : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component conta_32bit 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component conta_2bits 
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           conta : out STD_LOGIC_VECTOR (1 downto 0));
end component;
component mux4_1_4bits 
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (3 downto 0);
           d : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component; 
signal selMux : std_logic_vector (1 downto 0);
signal bcd_data: std_logic_vector (3 downto 0);
signal icounter: std_logic_vector (31 downto 0);
begin


 multiplesor_senal_bcd: mux4_1_4bits
 port map(
    a => bcd_4(3 downto 0),
    b => bcd_4(7 downto 4),
    c => bcd_4(11 downto 8),
    d => bcd_4(15 downto 12),
    sel => selMux,
    mux_out => bcd_data
 );
 
 contador_hasta_20bit: conta_32bit
 port map(
 clock => clock,
 reset => reset,
 count => icounter
 );
 contador_hasta4:conta_2bits
 port map(
 clock => icounter(20),
 reset => reset,
 conta => selMux
 );
 
 docodificar_bcd: decoBDC_7seg
 port map(
 bcd => bcd_data,
 seg7 => seg
 );
 decodificar_que_7seg:deco_sel_bcd
 port map(
 clock_div => selMux,
 sel => sel_seg
 );

end Behavioral;
