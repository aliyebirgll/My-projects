
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClkDiv is
Port (
 CLK100MHZX : in std_logic;
 LEDX : out std_logic
 );
end ClkDiv;


architecture Behavioral of ClkDiv is

   signal counter : integer := 0 ;
   signal temp : std_logic := '0';
 
begin
  process (CLK100MHZX) 
  begin 
  if (rising_edge(CLK100MHZX)) then
   if (counter >= 100000000) then 
    temp <= not temp;
    counter <= 0;
   else 
    counter <= counter +1;
   end if;
   end if;
  end process;
  
  LEDX <= temp;
end Behavioral;
