----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2026 11:57:31
-- Design Name: 
-- Module Name: muxfix4_1_5b - Behavioral
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

entity muxfix4_1_5b is
    Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
           b : in STD_LOGIC_VECTOR (4 downto 0);
           c : in STD_LOGIC_VECTOR (4 downto 0);
           d : in STD_LOGIC_VECTOR (4 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           mux_out5b : out STD_LOGIC_VECTOR (4 downto 0));
end muxfix4_1_5b;

architecture Behavioral of muxfix4_1_5b is

begin
--    mux_out32b <= a when sel = "00" else 
--                  b when sel = "01" else
--                  c when sel = "10" else
--                  d ;


    with sel select
        mux_out5b <= a when "00",
                      b when "01",
                      c when "10",
                      d when others;
                      
end Behavioral;
