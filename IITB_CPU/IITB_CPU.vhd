library ieee;
use ieee.std_logic_1164.all;

entity ALU is
 port (
   ALU_A: in std_logic_vector(15 downto 0);
   ALU_B: in std_logic_vector(15 downto 0);
	CV,EN: in std_logic_vector(1 downto 0);        ---control variables to decide the operation, enable to decide whether to modify C/Z(EN(0):C,EN(1):Z)
	C_in,Z_in: in std_logic;                       ---initial carry,zero flags
	Z0: out std_logic;                             ---to retain initial value of zero while executing BEQ
   ALU_C: out std_logic_vector(15 downto 0);
	C,Z: out std_logic) ;
end ALU;

architecture alu_arch of ALU is

 function add(A: in std_logic_vector(15 downto 0);
  B: in std_logic_vector(15 downto 0))
    return std_logic_vector is

    variable sum : std_logic_vector(15 downto 0) := (others => '0');
	 variable carry : std_logic_vector(15 downto 0) := (others => '0');
	 
   begin
     		for i in 0 to 15 loop 
			if i=0 then
				sum(i) :=  A(i) xor B(i);
				carry(i) := A(i) and B(i) ;
			else
			   sum(i) :=  A(i) xor B(i) xor carry(i-1);
				carry(i) := (A(i) and B(i)) or (carry(i-1) and (A(i) xor B(i))) ;
			end if;
		end loop;
    
    return carry(15) & sum;  
 end add;
 
 
begin  

alu_proc: process(ALU_A,ALU_B,C_in,Z_in,CV,EN) 
 
variable dummy: std_logic_vector(15 downto 0) := "0000000000000000";
variable dummy_1: std_logic_vector(16 downto 0) := "00000000000000000";
variable C_init,Z_init : std_logic := '0'; 

begin

if CV = "00" then
  dummy_1 := add(ALU_A,ALU_B);
  ALU_C <= dummy_1(15 downto 0);                         ---add function returns 17-bit value, we need 16-bit sum value
  C_init := dummy_1(16);
  
  if(dummy_1 = "00000000000000000") then                 ---conditional to check for zero output
     Z_init := '1';
  end if;
  
  if(EN(0) = '1') then
     C <= C_init;                                        ---conditional to check if C is to be modified
  else
     C <= C_in;
  end if;
  
  if(EN(1) = '1') then                                   ---conditional to check if Z is to be modified 
     Z <= Z_init;
  else
     Z <= Z_in;
  end if;
  
  Z0 <= Z_in;                                            ---don't give a shit whether Z0 is upadated here or not, I don't need it anyways
  
  
elsif CV = "01" then                                     ---NAND function always modifies the Z flag, so we don't need any conditionals here
  ALU_C <= ALU_A nand ALU_B;
  dummy := ALU_A nand ALU_B;
  
  if(dummy = "0000000000000000") then
     Z <= '1';
  else 
     Z <= '0';
  end if;
  
  C <= C_in;
  Z0 <= Z_in;                                            ---same situation as in ADD
  
  
elsif CV = "10" then                                      
  ALU_C <= ALU_A xor ALU_B;
  dummy := ALU_A xor ALU_B;
  
  if(dummy = "0000000000000000") then 
     Z_init := '1';
	  Z0 <= Z_init;
  else 
     Z0 <= Z_in;
  end if;
  
  if(EN(1) = '1') then                                   ---conditional to check if Z is to be modified 
     Z <= Z_init;
  else
     Z <= Z_in;
  end if; 
 
  C <= C_in; 
  
  
else                                                     ---dummy function for ALU
  null;
  
end if;
  
end process;
end alu_arch;


----------------------------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity register_component is 
    port(
        reg_in : in std_logic_vector(15 downto 0);
		  CLK,RST: in std_logic;
		  write_enable: in std_logic;
        reg_out : out std_logic_vector(15 downto 0)
    );
end entity;

architecture rc of register_component is

	signal reg_data : std_logic_vector(15 downto 0);
	
begin

	 write_proc: process(write_enable,reg_in)
	 begin 
	     if(write_enable = '1') then 
	        reg_data <= reg_in;
	     end if;
	 end process write_proc;

    read_proc: process(CLK,RST,reg_data)
    begin
		  --if(RST = '1') then reg_out <= "0000000000000000";
        if (CLK'event and CLK = '0') then  --writing at negative clock edge
            reg_out <= reg_data;
        end if;
    end process read_proc;

end rc;


----------------------------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity register_file is 
    port(
        RF_A1,RF_A2,RF_A3 : in std_logic_vector(2 downto 0);         ---register encoding input
        RF_D3 : in std_logic_vector(15 downto 0);                    ---content to be stored in a given register
        RF_WR : in std_logic;                                        
        RF_RD : in std_logic;
        CLK,RST : in std_logic;
        RF_D1,RF_D2 : out std_logic_vector(15 downto 0);             ---output from registers
        R7_PC_OUT : out std_logic_vector(15 downto 0));
end entity;

architecture regf of register_file is    
    signal R0,R1,R2,R3,R4,R7 : std_logic_vector(15 downto 0) := (others => '0');
    signal R5 : std_logic_vector(15 downto 0) := "0000000000000001";
    signal R6 : std_logic_vector(15 downto 0) := "0000000000000010";	
	 
begin
    --writing to register when RF_WR is set
    write_process : process(CLK,RST)
    begin
	     --if (RST =  '1') then null;
        if (CLK'event and CLK = '0') then  -- negative clock edge 
            if(RF_WR = '1') then
               case RF_A3 is
						when "000" =>
						  R0 <= RF_D3;
						when "001" =>
						  R1 <= RF_D3;
						when "010" =>
						  R2 <= RF_D3;
						when "011" =>
						  R3 <= RF_D3;
						when "100" =>
						  R4 <= RF_D3;
						when "101" =>
						  R5 <= RF_D3;
						when "110" =>
						  R6 <= RF_D3;
						when "111" =>
						  R7 <= RF_D3;
						when others =>
						  null;
                end case; 	
				end if;
        end if;
    end process write_process;

    --reading from the registers when RF_RD is set
    read_process : process(RF_A1,RF_A2,RF_RD,R0,R1,R2,R3,R4,R5,R6,R7)
    begin
        if(RF_RD = '1') then
            case RF_A1 is
		         when "000" =>
					  RF_D1 <= R0;
					when "001" =>
					  RF_D1 <= R1;
					when "010" =>
					  RF_D1 <= R2;
					when "011" =>
					  RF_D1 <= R3;
					when "100" =>
					  RF_D1 <= R4;
					when "101" =>
					  RF_D1 <= R5;
					when "110" =>
					  RF_D1 <= R6;
					when "111" =>
					  RF_D1 <= R7;
					when others =>
					  null;
            end case;
				
            --Address 2
            case RF_A2 is
				   when "000" =>
					  RF_D2 <= R0;
					when "001" =>
					  RF_D2 <= R1;
					when "010" =>
					  RF_D2 <= R2;
					when "011" =>
					  RF_D2 <= R3;
					when "100" =>
					  RF_D2 <= R4;
					when "101" =>
					  RF_D2 <= R5;
					when "110" =>
					  RF_D2 <= R6;
					when "111" =>
					  RF_D2 <= R7;
					when others =>
					  null;
		      end case;						
        end if;
    end process read_process;
    
R7_PC_OUT <= R7;
end regf;


----------------------------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_unit is
    port(CLK : in std_logic;
        MWR : in std_logic;     ---write enable bit
		  MDR : in std_logic;     ---read enable bit
        RST : in std_logic;     
        mem_address : in std_logic_vector(15 downto 0);
        mem_data_in : in std_logic_vector(15 downto 0);
        mem_data_out : out std_logic_vector(15 downto 0));
    
end entity;

architecture abstract of memory_unit is
type memory_arr is array(0 to 65535) of std_logic_vector(15 downto 0);
signal data : memory_arr := (0 => "0000101110010000", 1 => "1100111001101101", others => (others => '0')); --Load with Program, ADD and BEQ instructions in our case

begin
    memory_proc: process(CLK,RST)
    begin
        --if (RST = '1') then null;
        if (CLK'event and CLK = '0') then  
            if (MWR = '1') then
                data(to_integer(unsigned(mem_address))) <= mem_data_in;
				 elsif(MDR = '1') then
				     mem_data_out <= data(to_integer(unsigned(mem_address)));
            end if;
        end if;
    end process memory_proc;

end architecture abstract;


----------------------------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend_6 is 
port(SE_in: in std_logic_vector(5 downto 0);
     SE_out: out std_logic_vector(15 downto 0));
end entity sign_extend_6;

architecture Extend_1 of sign_extend_6 is
begin
SE_out(5 downto 0) <= SE_in(5 downto 0);
SE_out(15 downto 6) <= "0000000000";
end Extend_1;


----------------------------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend_9 is 
port(SE_in_9: in std_logic_vector(8 downto 0);
     SE_out_9: out std_logic_vector(15 downto 0));
end entity sign_extend_9;

architecture Extend of sign_extend_9 is
begin
SE_out_9(6 downto 0) <= "0000000";
SE_out_9(15 downto 7) <= SE_in_9(8 downto 0);
end Extend;


----------------------------------------------------------------------------------------------------------------------------------------


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
	signal aluOp : std_logic_vector(1 downto 0);                        -- to select the operation in ALU
	signal rfa1, rfa2, rfa3 : std_logic_vector(2 downto 0) := (others => '0');
	signal enable : std_logic_vector(8 downto 0) := (others => '0');    -- used to determine which component will be activated
	
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
--			if(RST='1') then
--				present_state <= S0; 
--			else
			present_state <= next_state;
--		   end if;
--	      else null;
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


----------------------------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IITB_CPU is 
   port(
	     CLK, RST : in std_logic;
		  CLK_output : out std_logic);
end IITB_CPU;

architecture cpu of IITB_CPU is 

  component state_FSM is
    port(op_code: in std_logic_vector(3 downto 0);
         condition: in std_logic_vector(1 downto 0);
			t2_cnd: in std_logic_vector(2 downto 0);
	      C,Z,CLK,RST: in std_logic;
	      stateID: out std_logic_vector(4 downto 0));
  end component;
  
  component Datapath is 
    port(stateID: in std_logic_vector(4 downto 0);
         CLK,RST: in std_logic;
		   op_code: out std_logic_vector(3 downto 0);
		   condition: out std_logic_vector(1 downto 0);
			t2_cnd_out: out std_logic_vector(2 downto 0); 
	      C,Z: out std_logic);
  end component;
  
  signal S0 : std_logic_vector(3 downto 0);            ---for op_code
  signal S1 : std_logic_vector(4 downto 0);            ---for stateID
  signal S2 : std_logic_vector(1 downto 0);            ---for condition
  signal S3 : std_logic_vector(2 downto 0);            ---for counter
  signal S4, S5 : std_logic;                           ---for C, Z respectively
  
begin
  ---Datapath unit
  datapath_instance : Datapath port map (stateID => S1, CLK => CLK, RST => RST, op_code => S0, condition => S2, t2_cnd_out => S3, C => S4, Z => S5);
  ---state_FSM unit
  fsm_instance : state_FSM port map (op_code => S0, condition => S2, t2_cnd => S3, C => S4, Z => S5, CLK => CLK, RST => RST, stateID => S1);

CLK_output <= '1';

end architecture cpu;