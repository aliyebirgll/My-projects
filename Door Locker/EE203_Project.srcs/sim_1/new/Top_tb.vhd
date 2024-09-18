


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Top_tb is
--  Port ( );
end Top_tb;

architecture Behavioral of Top_tb is

component top_module is
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
end component;

signal CLK100MHZ    : std_logic;
signal LED          : std_logic_vector(11 downto 0);
signal sw           : std_logic_vector(11 downto 0);
signal BTNL         : std_logic;
signal BTNR         : std_logic;
signal BTNC         : std_logic;
signal LED1         : std_logic;
signal LED_CLK      : std_logic;

begin  
      UNIT_UNDER_TEST : top_module 
      port map (
      CLK100MHZ      => CLK100MHZ,
      LED            => LED      ,
      sw             => sw       ,
      BTNL           => BTNL     ,
      BTNR           => BTNR     ,
      BTNC           => BTNC     ,
      LED1           => LED1     ,
      LED_CLK        => LED_CLK  
      );
      CLOCK : process 
      begin 
        CLK100MHZ <= '0';
        wait for 5ns;
        CLK100MHZ <= '1';
        wait for 5ns;
      end process;
      simulation : process 
      begin 
            BTNR <= '0';
            BTNL <= '0';
            BTNC <= '0';
            wait for 50ns;
            sw <= "000001110000";
            wait for 10ns;
            BTNR <= '1';
            wait for 10ns;
            BTNR <= '0';
            wait for 10ns;
            BTNL <= '1';
            wait for 10ns;
            BTNL <= '0';
            wait for 190ns;
            BTNC <= '1';
            wait for 10ns;
            BTNR <= '0';
            BTNL <= '0';
            BTNC <= '0';
            wait for 5ns;
            sw <= "001001110000";
            wait for 10ns;
            BTNR <= '1';
            wait for 10ns;
            BTNR <= '0';
            wait for 10ns;
            BTNL <= '1';
            wait for 10ns;
            BTNL <= '0';
            wait for 190ns;
            BTNC <= '1';
            wait for 10ns;
      end process;
      
       
end Behavioral;
