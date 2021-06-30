library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity moore2_over is
port (
 clk, res, seq_in : in std_logic; 
 detect_out: out std_logic
);
end moore2_over;
 
architecture behavioral of moore2_over is
type moorefsm is (O, I, IO, IOO, IOI, IOOI,IOIO);
signal current_state, next_state: moorefsm;
 
begin
 
process(clk,res)
begin
 if(res='1') then
  current_state <= O;
 elsif(rising_edge(clk)) then
  current_state <= next_state;
 end if;
end process;
 
process(current_state,seq_in)
begin
 case(current_state) is
 when O =>
  if(seq_in='1') then
   next_state <= I;
  else
   next_state <= O;
  end if;
 
 when I =>
  if(seq_in='0') then
   next_state <= IO;
  else
   next_state <= I;
  end if;  
 
 when IO => 
  if(seq_in='0') then
   next_state <= IOO;
  else
   next_state <= IOI;
  end if;  
 
 when IOO =>
  if(seq_in='1') then
   next_state <= IOOI;
  else
   next_state <= O;
  end if; 
 
  when IOI =>
  if(seq_in='0') then
   next_state <= IOIO;
  else
   next_state <= I;
  end if; 
 
 when IOOI =>
  if(seq_in='1') then
   next_state <= I;
  else
   next_state <= IO;
  end if;
 
  when IOIO =>
  if(seq_in='1') then
   next_state <= IOI;
  else
   next_state <= IOO;
  end if;
 
end case;
end process;
 
process(current_state)
begin 
 case current_state is
 when O =>
  detect_out <= '0';
 when I =>
  detect_out <= '0'; 
 when IO => 
  detect_out <= '0'; 
 when IOO =>
  detect_out <= '0'; 
 when IOI =>
  detect_out <= '0';
 when IOIO =>
  detect_out <= '1';
 when IOOI =>
  detect_out <= '1';
 end case;
end process;
end behavioral;
