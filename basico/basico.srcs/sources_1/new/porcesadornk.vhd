----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2026 12:52:20
-- Design Name: 
-- Module Name: porcesadornk - Behavioral
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

entity porcesadornk is
    Port ( reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0);
           read : out STD_LOGIC;
           write : out STD_LOGIC;
           addres : out STD_LOGIC_VECTOR (31 downto 0));
end porcesadornk;

architecture Behavioral of porcesadornk is
signal irwrite : std_logic;
signal ir_out, mdr_out : std_logic_vector (31 downto 0);
component registro32b 
    Port ( reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (31 downto 0);
           dataout : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    ir_reg: registro32b
    port map(
        reset => reset,
        clock => clock,
        enable => irwrite,
        datain => data_in,
        dataout=> ir_out
        );
        
    mdr_reg: registro32b
    port map(
        reset => reset,
        clock => clock,
        enable => '1',
        datain => data_in,
        dataout=> mdr_out
        );

end Behavioral;
