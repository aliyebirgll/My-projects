
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_reg_tb is
--  Port ( );
end shift_reg_tb;



architecture Behavioral of shift_reg_tb is
component Shift_rg is
 Port (
 Load : in std_logic;
 Shift : in std_logic;
 Reset : in std_logic;
 clk : in std_logic;
 register_input : in std_logic_vector (11 downto 0);
 shift_output : out std_logic 
 );
 
end component;

signal Load : std_logic;
signal Shift : std_logic;
signal Reset : std_logic;
signal clk : std_logic;
signal register_input : std_logic_vector (11 downto 0);
signal shift_output : std_logic;

begin

dut : Shift_rg 
Port map (
Load             => Load          , 
Shift            => Shift         , 
Reset            => Reset         , 
clk              => clk           , 
register_input   => register_input, 
shift_output     => shift_output  

);

process 
begin 
clk <= '0' ;
wait for 5ns;
clk <= '1';
wait for 5ns;
end process;

process 
begin 
wait for 3ns;
register_input <= "011101011001"; -- 1 bit için tek dendendi, coklu bit icin iki denden
wait for 10ns;
Load <= '1';
wait for 10ns;
Load <= '0';
wait for 10ns; 
Shift <= '1';
wait for 10ns;
Shift <= '0';
wait for 150ns;
Reset <= '1';
wait for 10ns;
Reset <= '0';
wait for 10ns;
end process;






end Behavioral;
