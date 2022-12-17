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