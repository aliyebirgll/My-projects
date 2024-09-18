
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_module is
Port (
CLK100MHZ : in std_logic;
LED : out std_logic_vector (11 downto 0);
sw : in std_logic_vector (11 downto 0);
BTNL : in std_logic;
BTNR : in std_logic;
BTNC : in std_logic;
LED1 : out std_logic;
LED_CLK : out std_logic
);
end top_module;

architecture Behavioral of top_module is

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


component ClkDiv is
Port (
 CLK100MHZX : in std_logic;
 LEDX : out std_logic
 );
end component;
signal HZ1: std_logic;
signal sp: std_logic;
signal sk : std_logic;

component Shift_rg is
 Port (
 Load : in std_logic;
 Shift : in std_logic;
 Reset : in std_logic;
 stop_in : in std_logic;
 clk : in std_logic;
 register_input : in std_logic_vector (11 downto 0);
 shift_output : out std_logic;
 stop_info_input : in std_logic_vector (3 downto 0)
 );
end component;

signal between : std_logic_vector (3 downto 0);
begin
MY_CLOCK : ClkDiv 
port map(
CLK100MHZX => CLK100MHZ,
LEDX => HZ1
);

LED_CLK <= HZ1;
MY_REGISTER: Shift_rg 
port map(
Load            => BTNR,
stop_in         => sp,
Shift           => BTNL,
Reset           => BTNC,
clk             => HZ1,
register_input  => sw,
shift_output    => sk,
stop_info_input => between
);
MY_MACHINE : State_Machine 
port map(
start => BTNL,
stop_out => sp,
reset_statemachine => BTNC,
clk_statemachine => HZ1,
input_statemachine => sk,
output_statemachine => LED,
stop_statemachine => LED1,
stop_info => between
);
end Behavioral;
