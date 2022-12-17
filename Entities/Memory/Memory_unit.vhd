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
--signal data : memory_arr := (0 => "0000001000000000", 1 => "0010000111001001", others => (others => '0')); --Load with Program
signal data : memory_arr := (others => (others => '0'));

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