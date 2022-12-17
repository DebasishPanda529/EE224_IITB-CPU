library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Datapath is 
	port(
	     stateID: in std_logic_vector(4 downto 0);
        CLK,RST : in std_logic;
		  op_code: out std_logic_vector(3 downto 0);
		  condition: out std_logic_vector(1 downto 0);
		  t2_cnd_out: out std_logic_vector(2 downto 0); 
	     C,Z: out std_logic);
end Datapath;

architecture flow of Datapath is

  component ALU is
    port(
       ALU_A: in std_logic_vector(15 downto 0);
       ALU_B: in std_logic_vector(15 downto 0);
	    CV,EN: in std_logic_vector(1 downto 0);      
	    C_in,Z_in: in std_logic; 
       Z0 : out std_logic;		 
       ALU_C: out std_logic_vector(15 downto 0);
	    C,Z: out std_logic);
  end component;
	       
  component register_component is 
    port(
        reg_in : in std_logic_vector(15 downto 0);
		  CLK,RST: in std_logic;
		  write_enable: in std_logic;
        reg_out : out std_logic_vector(15 downto 0));
  end component;
  
  component Register_file is
    port(
        RF_A1,RF_A2,RF_A3 : in std_logic_vector(2 downto 0);      
        RF_D3 : in std_logic_vector(15 downto 0);                  
        RF_WR : in std_logic;                                        
        RF_RD : in std_logic;
        CLK,RST : in std_logic;
        RF_D1,RF_D2 : out std_logic_vector(15 downto 0);             
        R7_PC_OUT : out std_logic_vector(15 downto 0));
  end component;
  
  component memory_unit is
    port(
	     CLK,RST : in std_logic;
        MWR,MDR : in std_logic;         
        mem_address : in std_logic_vector(15 downto 0);
        mem_data_in : in std_logic_vector(15 downto 0);
        mem_data_out : out std_logic_vector(15 downto 0));
  end component;
  
  component sign_extend_6 is
     port(
	     SE_in: in std_logic_vector(5 downto 0);
        SE_out: out std_logic_vector(15 downto 0));
  end component;
  
  component sign_extend_9 is
	  port(
	     SE_in_9: in std_logic_vector(8 downto 0);
        SE_out_9: out std_logic_vector(15 downto 0));
  end component;

	signal aluA, aluB, aluC, memAddr, mem_in, mem_out, t1in, t1out, t2in, t2out, t3in, t3out, rfd1, rfd2, rfd3, r7out, se10, se7 : std_logic_vector(15 downto 0) := (others => '0');  
	signal aluCi, aluCo, aluZo, aluZ, Z_beq : std_logic;     
	signal aluOp : std_logic_vector(1 downto 0);       ---to select the operation in ALU
	signal rfa1, rfa2, rfa3 : std_logic_vector(2 downto 0) := (others => '0');
	signal enable : std_logic_vector(8 downto 0) := (others => '0');    --used to determine which component will be activated
	
begin                                            
	--Registers                                     
   T1 : register_component port map (reg_in => t1in, CLK => CLK, RST => RST, write_enable => enable(0), reg_out => t1out);    
	T2 : register_component port map (reg_in => t2in, CLK => CLK, RST => RST, write_enable => enable(1), reg_out => t2out);
	T3 : register_component port map (reg_in => t3in, CLK => CLK, RST => RST, write_enable => enable(2), reg_out => t3out);        
	--ALU
	alu_instance : ALU port map(ALU_A => aluA, ALU_B => aluB, CV => aluOp, EN => enable(4 downto 3),C_in => '0', Z_in => '0', Z0 => aluZo, ALU_C => aluC, C => aluCo, Z => aluZ);
	--Memory
	mem : memory_unit port map(CLK => CLK, MWR => enable(5), MDR => enable(6),RST => RST, mem_address => memAddr, mem_data_in => mem_in, mem_data_out => mem_out);
	--Register File
	rf : Register_file port map(RF_A1 => rfa1, RF_A2 => rfa2, RF_A3 => rfa3, RF_D3 => rfd3, RF_WR => enable(7), RF_RD => enable(8), CLK => CLK, RST => RST, RF_D1 => rfd1, RF_D2 => rfd2, R7_PC_OUT => r7out);
	--Sign Extenders
	sign_extend_10 : sign_extend_6 port map(SE_in => t1out(5 downto 0), SE_out => se10);      
	sign_extend_7 : sign_extend_9 port map(SE_in_9 => t1out(8 downto 0), SE_out_9 => se7);
	

datapath_proc: process(stateID, aluC, rfd1, rfd2, rfa3, rfd3, r7out, mem_out, t1out, t2out, t3out, se10, se7, aluZo, Z_beq, enable)

begin

	case stateID is 

		when"00000"=>
			memAddr <= r7out;
			t1in <= mem_out;              
			enable <= "001000001";
			
		when "00001"=>
			aluA <= r7out;
			aluB <= "0000000000000001";
			aluOp <= "00";
			rfa3 <= "111";
			rfd3 <= aluC;                  
         enable <= "010000000";						
			
		when "00010"=>
			rfa1 <= t1out(11 downto 9);
			rfa2 <= t1out(8 downto 6);
			t2in <= rfd1;
			t3in <= rfd2;               
			enable <= "100000110";
			
		when "00011"=>
			aluA <= t2out;            
			aluB <= t3out;
			aluOp <= "00";
			t2in <= aluC;               
			enable <= "000011010";
			
		when "00100"=>
			rfd3 <= t2out;
			rfa3 <= t1out(5 downto 3);  
			enable <= "010000000";
			
		when "00101"=>
			aluA <= t2out;
			aluB <= t3out;
			aluOp <= "01";
			t2in <= aluC;                
			enable <= "000010010";
			
		when "00110"=>
			aluA <= t2out;
			aluB <= se10;
			aluOp <= "10";
			t2in <= aluC;              
			enable <= "000000010";
			
		when "00111"=>
			rfd3 <= t2out;
			rfa3 <= t1out(8 downto 6);
			enable <= "010000000";		
			
		when "01000"=>
			rfd3 <= se7;
			rfa3 <= t1out(11 downto 9);  
			enable <= "010000000";
			 
		when "01001"=>
			aluA <= t3out;
			aluB <= se10;
			aluOp <= "00";
			t3in <= aluC;                
			enable <= "000010100";
			
		when "01010"=>
			memAddr <= t3out;
			t2in <= mem_out;            
			enable <= "001100010";
		
		when "01011"=>
			rfa3 <= t1out(11 downto 9);
			rfd3 <= t2out;              
			enable <= "010000000";
		 
		when "01100"=>
			aluA <= t3out;
			aluB <= se10;
			aluOp <= "00";
			t2in <= aluC;   			  
			enable <= "000000010";
			
		when "01101"=>
			memAddr <= t3out;
			mem_in <= t2out;           
			enable <= "000100010";
			
		when "01110"=>
			aluA <= t2out;               
			aluB <= t3out;
			aluOp <= "10";
			Z_beq <= aluZo;                 
			enable <= "000000000";
			
		when "01111"=>
			aluA <= r7out;
			if (Z_beq = '1') then aluB <= se10;
         else aluB <= "0000000000000001";
			end if;  
			rfa3 <= "111";
			rfd3 <= aluC; 
			enable <= "010000000";
			
		when  "10000"=>
			rfd3 <= r7out;
			rfa3 <= t1out(11 downto 9); 
			enable <= "010000000";
		
		when "10001"=>
			aluA <= r7out;
			aluB <= se7;
			aluOp <= "00";
			rfa3 <= "111";
			rfd3 <= aluC;                
			enable <= "010000000";
		
		when "10010"=>
	      rfa1 <= t1out(8 downto 6);
         rfa3 <= "111";
         rfd3 <= rfd1;			         
         enable <= "010000000";	
	
      when "10011"=>
		   t2in <= "0000000000000000";
			rfa2 <= t1out(11 downto 9);
			t3in <= rfd2;                 
			enable <= "110000110";  
			
		when "10100"=>
			enable(7) <= t1out(to_integer(unsigned(t2out(2 downto 0))));
			memAddr <= t3out;
			rfd3 <= mem_out;
			rfa3 <= t2out(2 downto 0);
         aluA <= t3out;
		   aluB <= "0000000000000001";
			aluOp <= "00";
			if (t1out(to_integer(unsigned(t2out(2 downto 0)))) = '1') then t3in <= aluC;
			end if;
			enable(8) <= '1'; enable(5) <= '1'; enable(6) <= '1'; enable(2) <= '1';
			enable(1 downto 0) <= "00"; enable(4 downto 3) <= "00";
		
		when "10101"=>
		   aluA <= t2out;
			aluB <= "0000000000000001";
			aluOp <= "00";
			t2in <= aluC;                 
			enable <= "000000010";
		
	   when "10110"=>
			aluA <= t3out;
			aluB <= "0000000000000001";
			aluOp <= "00";
		   if(t1out(to_integer(unsigned(t2out(2 downto 0)))) = '1') then
			  memAddr <= t3out;
			  rfa1 <= t2out(2 downto 0);
			  mem_in <= rfd1;
			  t3in <= aluC;
		   end if;
			enable <= "000100100";

      when others =>
		   null;
		
	end case;
	
end process datapath_proc;

op_code <= t1out(15 downto 12);
condition <= t1out(1 downto 0);
t2_cnd_out <= t2out(2 downto 0);
C <= aluCo;
Z <= aluZ;

end architecture flow; 


----------------------------------------------------------------------------------------------------------------------------------------


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
			if(RST='1') then
				present_state <= S0; 
			else
				present_state <= next_state;
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