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
signal irwrite, regwrite : std_logic;
signal ir_out, mdr_out, singExt_out, aluOutpReg, regF_writeData, regF_Out1, regF_Out2 : std_logic_vector (31 downto 0);
signal regDst, memToReg : std_logic_vector  (1 downto 0);
signal regF_addres3 : std_logic_vector (4 downto 0);
component registro32b 
    Port ( reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (31 downto 0);
           dataout : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
 component  muxfix4_1_5b 
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
component  registermem 
    Port ( clock : in STD_LOGIC;
           write : in STD_LOGIC;
           addres1 : in STD_LOGIC_VECTOR (4 downto 0);
           addres2 : in STD_LOGIC_VECTOR (4 downto 0);
           addres3 : in STD_LOGIC_VECTOR (4 downto 0);
           datain : in STD_LOGIC_VECTOR (31 downto 0);
           dataout1 : out STD_LOGIC_VECTOR (31 downto 0);
           dataout2 : out STD_LOGIC_VECTOR (31 downto 0));
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
        
    mux_01: muxfix4_1_5b
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
    a => aluOutpReg,
    b => mdr_out,
    c => x"00000000",
    d => x"00000000",
    sel => memtoreg,
    mux_out32b => regF_writeData
    );
    regFile: registermem 
    port map(
        clock => clock,
        write => regWrite,
        addres1 => ir_out(25 downto 21),
        addres2 =>ir_out(20 downto 16),
        addres3 => regF_addres3,
        dataIn => regF_writeData,
        dataOut1 => regF_Out1,
        dataOut2 => regF_Out2
    );
    
    signexteds : process (ir_out(15 downto 0))
    begin 
        if (ir_out(15) = '0') then
            singExt_out (31 downto 16) <= x"0000";
        else
            singExt_out (31 downto 16) <= x"ffff";
        end if;
        end process ;

end Behavioral;
