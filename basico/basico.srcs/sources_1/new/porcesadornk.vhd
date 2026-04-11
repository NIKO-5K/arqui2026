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
signal regDst : std_logic_vector  (2 downto 0);
signal regF_addres3 : std_logic_vector (3 downto 0) ;
signal memtoreg : std_logic_vector (1 downto 0);
signal aluoutpeg : std_logic_vector (31 downto 0);
component registro32b 
    Port ( reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (31 downto 0);
           dataout : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
 component  mux4_1_5bb 
    Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
           b : in STD_LOGIC_VECTOR (4 downto 0);
           c : in STD_LOGIC_VECTOR (4 downto 0);
           d : in STD_LOGIC_VECTOR (4 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           mux_out5b : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
 component mux4_1_32b 
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           c : in STD_LOGIC_VECTOR (31 downto 0);
           d : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           mux_out32b : out STD_LOGIC_VECTOR (31 downto 0));
end component ;
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
        
    mux_01: mux4_1_5bb
    port map(
        a => ir_out (20 downto 16),
        b => ir_out (15 downto 11),
        c => "11111",
        d => "00000",
        sel  => regDst,
        mux_out5b => regF_addres3
    
    );
    
    mux_02: mux4_1_32b
    port map (
    a => aluoutpeg,
    b => mdr_out,
    c => x"00000000",
    d => x"00000000",
    sel => memtoreg,
    mux_out32b => regf_addres3
    );

end Behavioral;
