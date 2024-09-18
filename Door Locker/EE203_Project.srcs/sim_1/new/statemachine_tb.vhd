
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity statemachine_tb is
--  Port ( );
end statemachine_tb;

architecture Behavioral of statemachine_tb is
component State_Machine is
Port (
start : in std_logic;
stop_out : out std_logic;
stop_info : out std_logic_vector(3 downto 0);
reset_statemachine : in std_logic;
clk_statemachine : in std_logic;
input_statemachine : in std_logic;
output_statemachine : out std_logic_vector (11 downto 0);
stop_statemachine : out std_logic
);
end component; 

signal start                  :   std_logic;
signal stop_out               :   std_logic;
signal stop_info              :   std_logic_vector(3 downto 0);
signal reset_statemachine     :   std_logic;
signal clk_statemachine       :   std_logic;
signal input_statemachine     :   std_logic;
signal output_statemachine    :   std_logic_vector(11 downto 0);
signal stop_statemachine      :   std_logic;

begin

uut : State_Machine
port map(

start                =>    start              ,
stop_out             =>    stop_out           ,
stop_info            =>    stop_info          ,
reset_statemachine   =>    reset_statemachine ,
clk_statemachine     =>    clk_statemachine   ,
input_statemachine   =>    input_statemachine ,
output_statemachine  =>    output_statemachine,
stop_statemachine    =>    stop_statemachine  

);
--1070
-- 0000 0111 0000

process 
begin 
     clk_statemachine <= '0';
     wait for 5ns;
     clk_statemachine <= '1';
     wait for 5ns;
end process;

process 
begin 
    start <= '0';
    reset_statemachine <='0';
    wait for 10ns;
    start <= '1';
    wait for 10ns;
    start <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '1';
    wait for 10ns;
    input_statemachine <= '1';
    wait for 10ns;
    input_statemachine <= '1';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 30ns;
    reset_statemachine <='1';
    wait for 10ns;
    reset_statemachine <='0';
    wait for 10ns;
    
    
    start <= '1';
    wait for 10ns;
    start <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '1';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '1';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 10ns;
    input_statemachine <= '0';
    wait for 30ns;
    
end process;
end Behavioral;
