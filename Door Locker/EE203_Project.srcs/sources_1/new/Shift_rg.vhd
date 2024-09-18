
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Shift_rg is
 Port (
 Load : in std_logic;
 Shift : in std_logic;
 Reset : in std_logic;
 clk : in std_logic;
 stop_in : in std_logic;
 register_input : in std_logic_vector (11 downto 0);
 shift_output : out std_logic;
 stop_info_input : in std_logic_vector (3 downto 0)
 );
end Shift_rg;

architecture Behavioral of Shift_rg is
signal shift_register: std_logic_vector (11 downto 0);
type register_statemachine is (initial, sh0, sh1, sh2, sh3, sh4, sh5, sh6, sh7, sh8, sh9, sh10, sh11, sh12, reset0);
signal state : register_statemachine := initial;
signal state_next : register_statemachine := initial; 

begin
process (clk) 
begin 
if (rising_edge(clk)) then
state <= state_next;
end if;
end process;

process (Load, Shift, Reset, state, stop_info_input)
begin 
case state is
    when initial => 
        if (Load = '1') then 
            state_next <= sh0;
            shift_register <= register_input; 
        else 
            state_next <= initial;
        end if;
    when sh0 => 
         if (Shift = '1') then 
            state_next <= sh1;
            else
            state_next <= sh0;
        end if;
    when sh1 => 
    if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh2;
    end if; 
        when sh2 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh3;
    end if; 
    when sh3 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh4;
    end if; 
    when sh4 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh5;
    end if; 
    when sh5 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh6;
    end if; 
    when sh6 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh7;
    end if; 
    when sh7 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh8;
    end if; 
    when sh8 => 
        if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh9;
    end if; 
    when sh9 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh10;
    end if; 
    when sh10 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh11;
    end if; 
    when sh11 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= sh12;
    end if; 
    when sh12 => 
         if (stop_in = '1') then
          state_next <= reset0;
          else 
          state_next <= reset0;
    end if; 
    when reset0 => 
        if (Reset = '1') then 
        state_next <= initial;
        else 
        state_next <= reset0;
          end if;
       end case;
end process;

   process (load, Shift, Reset, state, stop_info_input)
   begin 
   case  state is
            when initial => 
               
            when sh0 =>   
                
            when sh1 => 
                shift_output <= shift_register(0);
            when sh2 =>  
                shift_output <= shift_register(1);
            when sh3 =>  
                shift_output <= shift_register(2);
            when sh4 => 
                shift_output <= shift_register(3);  
            when sh5 => 
                shift_output <= shift_register(4);  
            when sh6 =>   
                shift_output <= shift_register(5);
            when sh7 =>   
                shift_output <= shift_register(6);
            when sh8 =>
                shift_output <= shift_register(7);   
            when sh9 =>   
                shift_output <= shift_register(8);
            when sh10 =>   
                shift_output <= shift_register(9);
            when sh11 =>   
                shift_output <= shift_register(10);
            when sh12 =>  
                shift_output <= shift_register(11); 
            when reset0 => 
                    if (stop_info_input = "0001") then
                        shift_output <= '1';
                    elsif (stop_info_input = "0010") then
                        shift_output <= '1';
                    elsif (stop_info_input = "0011") then
                        shift_output <= '1';
                    elsif (stop_info_input = "0100") then
                        shift_output <= '1';
                    elsif (stop_info_input = "0101") then
                        shift_output <= '0';
                    elsif (stop_info_input = "0110") then
                        shift_output <= '0';
                    elsif (stop_info_input = "0111") then
                        shift_output <= '0';
                    elsif (stop_info_input = "1000") then
                        shift_output <= '1';
                    elsif (stop_info_input = "1001") then
                        shift_output <= '1';
                    elsif (stop_info_input = "1010") then
                        shift_output <= '1';
                    elsif (stop_info_input = "1011") then
                        shift_output <= '1';
                    elsif (stop_info_input = "1100") then
                        shift_output <= '1';
                    end if;
        end case;
   end process;
end Behavioral;
