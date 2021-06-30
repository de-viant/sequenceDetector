library ieee;
use ieee.std_logic_1164.all;
entity mealy2 is 
port(clk:in std_logic;
    reset:in std_logic;
    sequence:in std_logic;
    detector:out std_logic);
    end mealy2;
    architecture behave of mealy2 is 
    type mealy_fsm is(zero,one,onezero,onezerozero,onezeroone);
    signal currentstate , nextstate :mealy_fsm;
    begin
    process(clk,reset)
    begin
 
    if(reset='1') then 
    currentstate <=zero;
    elsif(rising_edge(clk)) then 
    currentstate<=nextstate;
    end if;
    end process;
 
	--Now For Sequence Detection 
    process(currentstate,sequence)
    begin
    case(currentstate) is 
 
    when zero =>
    if(sequence = '1') then 
    nextstate<=one;
    detector<='0';
    else
    nextstate<=zero;
    detector<='0';
    end if;
 
    when one=>
    if(sequence='0') then 
    nextstate<=onezero;
    detector<='0';
    else
    nextstate<=one; 
    detector<='0';
    end if ;
 
    when onezero=> 
    if(sequence ='0') then
    nextstate<=onezerozero;
    detector<='0';
    else 
    nextstate<=onezeroone;
    detector<='0';
    end if ;
 
    when onezerozero=>
    if(sequence = '0') then
    nextstate<=zero;
    detector<='0';
    else 
    nextstate<=one;
    detector<='1';
    end if ;
 
    when onezeroone=>
    if(sequence = '1') then
    nextstate<=one;
    detector<='0';
    else 
    nextstate<=onezero ;
    detector<='1';
    end if;
 
    end case;
    end process;
    end behave;

