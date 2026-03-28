----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2026 12:26:12
-- Design Name: 
-- Module Name: luzuwu - Behavioral
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

entity luzuwu is
    Port ( led : out STD_LOGIC_VECTOR (7 downto 0);
           reset : in STD_LOGIC;
           clock :in STD_LOGIC;
           modo : in STD_LOGIC_VECTOR (1 downto 0));
end luzuwu;

architecture Behavioral of luzuwu is
signal currentState ,nextState : std_logic_vector (7 downto 0);
signal counter: integer := 0 ;
signal i_clock: std_logic ;
begin
statelogregister : process (reset, i_clock)
begin
    if (reset = '1') then
        currentState <= "00000001";
    elsif (i_clock'event and i_clock = '1') then
    currentState <= nextState;
    end if;
    end process ;
led<= currentState;

nextstatefuntion: process (modo,currentState)
begin
    case (modo) is 
        when "00" => 
            nextState <= currentState (6 downto 0) & currentState(7);
        when "01" => 
            nextState <= currentState (6 downto 0) & currentState(7);
        when "10" => 
            nextState <= not currentState;
        when others =>
            if(currentState = "01010101") then
                nextState <= "10101010";
            else
                nextState <= "01010101"; 
           end if;
    end case;
  end process;
    
 slow_clock : process (clock)
 begin
    if rising_edge (clock) then
        counter <= counter +1;
        if counter = 50_000_000 then
            i_clock <= not i_clock;
            counter <= 0;
        end if;
    end if;
 
 end process ;
end Behavioral;
