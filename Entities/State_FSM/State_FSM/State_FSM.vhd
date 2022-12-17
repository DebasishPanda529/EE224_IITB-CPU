library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_FSM is 
port(op_code:in std_logic_vector(3 downto 0);
     condition: in std_logic_vector(1 downto 0);
	  t2_cnd: in std_logic_vector(2 downto 0);                          ---t2_cnd is there to check looping for LM/SM
	  C,Z,CLK,RST: in std_logic;
	  stateID: out std_logic_vector(4 downto 0));
end state_FSM;

architecture Struct of state_FSM is

type state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22);
signal present_state, next_state : state := S0;

begin

clock: process(CLK,RST)
  begin	
		if(CLK='0' and CLK' event) then
			if(RST='0') then
				present_state <= next_state; 
			else
				present_state <= S0;
		   end if;
	      else null;
		end if;
	end process;

fsm_transition: process(op_code, condition, present_state, C, Z, RST, t2_cnd)
begin
   case present_state is
      when S0 =>   
          stateID <= "00000";                           
		    if (op_code = "1100" or op_code = "1000" or op_code = "1001") then next_state <= S2;
          else next_state <= S1;
			 end if;
			 
		when S1 =>
          stateID <= "00001";
		    if (op_code = "0000" and condition = "00" and (C = '1' or Z = '1')) then next_state <= S0;
		    elsif (op_code = "0000" and condition = "01" and Z = '0') then next_state <= S0;
		    elsif (op_code = "0000" and condition = "10" and C = '0') then next_state <= S0;			
			 elsif (op_code = "0010" and condition = "00" and (C = '1' or Z = '1')) then next_state <= S0;
		    elsif (op_code = "0010" and condition = "01" and Z = '0') then next_state <= S0;
		    elsif (op_code = "0010" and condition = "10" and C = '0') then next_state <= S0;			 
		    elsif (op_code = "0011") then next_state <= S8;
			 elsif (op_code = "0110") then next_state <= S19;
			 else next_state <= S2;
			 end if;

     when S2 =>
          stateID <= "00010";
		    if (op_code = "0000") then next_state <= S3;
			 elsif (op_code = "0001") then next_state <= S6;
			 elsif (op_code = "0010") then next_state <= S5;
			 elsif (op_code = "0100") then next_state <= S9;
			 elsif (op_code = "0101") then next_state <= S12;
          elsif (op_code = "1100") then next_state <= S14;
          else next_state <= S16;	
		    end if;	 
			 
	  when S3 =>
          stateID <= "00011";
	       next_state <= S4;
	  
	  when S4 =>
          stateID <= "00100"; 
	       next_state <= S0;
			 
	  when S5 =>
          stateID <= "00101";
	       next_state <= S4;
			 
	  when S6 =>
          stateID <= "00110";
	       next_state <= S7;

	  when S7 =>
          stateID <= "00111";
	       next_state <= S0;

	  when S8 =>
          stateID <= "01000";
	       next_state <= S0;

	  when S9 =>
          stateID <= "01001";
	       next_state <= S10;

	  when S10 =>
          stateID <= "01010";
	       next_state <= S11;

	  when S11 =>
          stateID <= "01011";
	       next_state <= S0;	
	
	  when S12 =>
          stateID <= "01100";
	       next_state <= S13;	
	 
	  when S13 =>
          stateID <= "01101";
	       next_state <= S0;
			 
	  when S14 =>
          stateID <= "01110";
	       next_state <= S15;
			 
	  when S15 =>
          stateID <= "01111";
	       next_state <= S0;
		
	  when S16 =>         
          stateID <= "10000";
	       if (op_code = "1001") then next_state <= S17;
			 else next_state <= S18;
			 end if;
			 
	  when S17 =>
          stateID <= "10001";
	       next_state <= S0;
		
	  when S18 =>
          stateID <= "10010";
	       next_state <= S0;
			 
	  when S19 =>                                                 ---first step of LM and SM
	       stateID <= "10011";
			 if(op_code = "0110") then next_state <= S20;
			 else next_state <= S22;
			 end if;
			 
	  when S20 =>                                                 ---looping stage 1 of LM
	       stateID <= "10100";
			 next_state <= S21;
	  
	  when S21 =>                                                 ---looping stage 2 of LM and SM both
	       stateID <= "10101";
			 if (to_integer(unsigned(t2_cnd)) < 8) then
			   if (op_code = "0110") then next_state <= S20;
			   else next_state <= S22;
			   end if;
			 else next_state <= S0;
			 end if;
			 
	  when S22 =>                                                 ---looping stage 1 of SM                                       
      	 stateID <= "10110"; 
			 next_state <= S21; 
			 
	  when others =>
          null;
			 
 end case;		

end process;
end architecture; 