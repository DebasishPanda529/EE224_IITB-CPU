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