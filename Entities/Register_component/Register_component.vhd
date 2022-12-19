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
