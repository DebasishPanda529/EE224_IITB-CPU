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
    signal R0,R1,R2,R3,R4,R5,R6,R7 : std_logic_vector(15 downto 0) := (others => '0');
--    signal R5 : std_logic_vector(15 downto 0) := "0000000000000001";
--    signal R6 : std_logic_vector(15 downto 0) := "0000000000000010";	 
	 
begin
    --writing to register when RF_WR is set
    write_process : process(CLK)
    begin
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
				else null;
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
        else null;				
        end if;
    end process read_process;
    
R7_PC_OUT <= R7;
end regf;