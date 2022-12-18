library ieee;
use ieee.std_logic_1164.all;

entity iitb_cpu_tb is
end entity iitb_cpu_tb;

architecture bhv of iitb_cpu_tb is
component IITB_CPU is
port (CLK, RST : in std_logic;
      CLK_output : out std_logic);
end component IITB_CPU;

signal RST : std_logic := '0';
signal CLK, CLK_output : std_logic := '0';
constant CLK_period : time := 20 ns;
begin
	
	dut_instance: IITB_CPU port map(CLK, RST, CLK_output);
	CLK <= not CLK after CLK_period/2 ;
	RST <= '0' , '1' after 1200 ms;
end bhv;            