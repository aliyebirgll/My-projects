library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity State_Machine is
Port (
start : in std_logic;
reset_statemachine : in std_logic;
clk_statemachine : in std_logic;
input_statemachine : in std_logic;

stop_out : out std_logic;
stop_info : out std_logic_vector(3 downto 0);
output_statemachine : out std_logic_vector (11 downto 0);
stop_statemachine : out std_logic
);
end State_Machine; 

architecture Behavioral of State_Machine is
type statemachine is (initial, check1, check2, check3, check4, check5, check6, check7, check8, check9, check10, check11, check12, done_statemachine);
signal state: statemachine := initial;
signal next_state: statemachine := initial;
-- 1070
-- 0001         0000 0111 0000 

begin
    process (clk_statemachine)
        begin
            if (rising_edge(clk_statemachine)) then
                state <= next_state;
            end if;
    end process;

    -- next state determination
    process (reset_statemachine, input_statemachine, start, state)
        begin
            case state is
                when initial => 
                    if(start = '1') then 
                         next_state <= check1;
                         stop_out <= '0';
                         stop_statemachine <= '0';
                         stop_info <= "0000";
                         else
                         stop_statemachine <= '0';
                         stop_info <= "0000";
                         next_state <= initial;
                         stop_out <= '0';
                    end if;
               when check1 =>
                   if(input_statemachine = '0') then
                         next_state <= check2; 
                         stop_out <= '0';
                         stop_info <= "0000";
                         stop_statemachine <= '0';
                   elsif( input_statemachine = '1' and reset_statemachine = '0') then
                         stop_statemachine <= '1';
                         stop_out <= '1';
                         stop_info <= "0001";
                         next_state <= check1;
                   elsif( input_statemachine = '1' and reset_statemachine = '1') then
                         next_state <= initial;
                    end if;
               when check2 =>
                   if(input_statemachine = '0') then
                         next_state <= check3; 
                         stop_info <= "0000";
                         stop_statemachine <= '0';
                         stop_out <= '0';
                   elsif( input_statemachine = '1' and reset_statemachine = '0') then
                        stop_statemachine <= '1';
                        stop_out <= '1';
                        stop_info <= "0010";
                        next_state <= check2;
                   elsif( input_statemachine = '1' and reset_statemachine = '1') then
                         next_state <= initial;
                   end if;
              when check3 =>
                   if(input_statemachine = '0') then
                       next_state <= check4; 
                       stop_info <= "0000";
                       stop_statemachine <= '0';
                       stop_out <= '0';
                   elsif( input_statemachine = '1' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "0011";
                       next_state <= check3;
                   elsif( input_statemachine = '1' and reset_statemachine = '1') then
                       next_state <= initial;
                   end if;
              when check4 =>
                   if(input_statemachine = '0') then
                       next_state <= check5; 
                       stop_info <= "0000";
                       stop_statemachine <= '0';
                       stop_out <= '0';
                   elsif(input_statemachine = '1' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "0100";
                       next_state <= check4;
                   elsif(input_statemachine = '1' and reset_statemachine = '1') then
                       next_state <= initial;
                   end if;
              when check5 =>
                   if(input_statemachine = '1') then
                       stop_statemachine <= '0';
                       stop_info <= "0000";
                       next_state <= check6; 
                       stop_out <= '0';
                   elsif( input_statemachine = '0' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "0101";
                       next_state <= check5;
                   elsif(input_statemachine = '0' and reset_statemachine = '1') then
                       next_state <= initial;
                   end if;
              when check6 =>
                   if(input_statemachine = '1') then
                       stop_statemachine <= '0';
                       stop_info <= "0000";
                       next_state <= check7; 
                       stop_out <= '0';
                   elsif(input_statemachine = '0' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "0110";
                       next_state <= check6;
                   elsif(input_statemachine = '0' and reset_statemachine = '1') then
                       next_state <= initial;
                   end if;
             when check7 =>
                 if(input_statemachine = '1') then
                       stop_statemachine <= '0';
                       stop_info <= "0000";
                       next_state <= check8; 
                       stop_out <= '0';
                elsif(input_statemachine = '0' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "0111";
                       next_state <= check7;
                elsif(input_statemachine = '0' and reset_statemachine = '1') then
                       next_state <= initial;
                end if;
             when check8 =>
                if(input_statemachine = '0') then
                       next_state <= check9; 
                       stop_info <= "0000";
                       stop_statemachine <= '0';
                       stop_out <= '0';
                elsif( input_statemachine = '1' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "1000";
                       next_state <= check8;
                elsif(input_statemachine = '1' and reset_statemachine = '1') then
                       next_state <= initial;
                end if;
             when check9 =>
                if(input_statemachine = '0') then
                       stop_statemachine <= '0';
                       stop_info <= "0000";
                       next_state <= check10; 
                       stop_out <= '0';
                elsif(input_statemachine = '1' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "1001";
                       next_state <= check9;
                elsif(input_statemachine = '1' and reset_statemachine = '1') then
                       next_state <= initial;
                end if;
            when check10 =>
                if(input_statemachine = '0') then
                       stop_statemachine <= '0';
                       stop_info <= "0000";
                       next_state <= check11; 
                       stop_out <= '0';
                elsif( input_statemachine = '1' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_out <= '1';
                       stop_info <= "1010";
                       next_state <= check10;
                elsif(input_statemachine = '1' and reset_statemachine = '1') then
                       next_state <= initial;
                end if;
            when check11 =>
                if(input_statemachine = '0') then
                       stop_statemachine <= '0';
                       stop_info <= "0000";
                       next_state <= check12; 
                       stop_out <= '0';
                elsif( input_statemachine = '1' and reset_statemachine = '0') then
                       stop_statemachine <= '1';
                       stop_info <= "1011";
                       stop_out <= '1';
                       next_state <= check11;
                elsif(input_statemachine = '1' and reset_statemachine = '1') then
                        next_state <= initial;
                end if;
           when check12 =>
                if(input_statemachine = '0') then
                    stop_statemachine <= '0';
                    stop_info <= "0000";
                    next_state <= done_statemachine; 
                    stop_out <= '0';
                elsif( input_statemachine = '1' and reset_statemachine = '0') then
                    stop_statemachine <= '1';
                    stop_info <= "1100";
                    stop_out <= '1';
                    next_state <= check12;
                elsif(input_statemachine = '1' and reset_statemachine = '1') then
                    next_state <= initial;
                end if;
         when done_statemachine =>
                if (reset_statemachine = '1') then
                    stop_statemachine <= '0';
                    stop_info <= "0000";
                    next_state <= initial;
                else
                    next_state <= done_statemachine;
                    stop_info <= "0000";
                    stop_statemachine <= '0';
                end if;
      end case;
    end process;

    process (reset_statemachine, input_statemachine, start, state) 
        begin
            case state is 
                when initial =>
                output_statemachine <= "000000000000";
                when check1 =>
                output_statemachine <= "000000000000";
                when check2 =>
                output_statemachine <= "000000000001";
                when check3 =>
                output_statemachine <= "000000000011";
                when check4 =>
                output_statemachine <= "000000000111";
                when check5 =>
                output_statemachine <= "000000001111";
                when check6 =>
                output_statemachine <= "000000011111";
                when check7 =>
                output_statemachine <= "000000111111";
                when check8 =>
                output_statemachine <= "000001111111";
                when check9 =>
                output_statemachine <= "000011111111";
                when check10 =>
                output_statemachine <= "000111111111";
                when check11 =>
                output_statemachine <= "001111111111";
                when check12 =>
                output_statemachine <= "011111111111";
                when done_statemachine =>
                output_statemachine <= "111111111111";
            end case;
end process;
end Behavioral;
