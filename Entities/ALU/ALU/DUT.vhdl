-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(37 downto 0);
       	output_vector: out std_logic_vector(18 downto 0));
end entity;

architecture DutWrap of DUT is
   component ALU is
      port (
        ALU_A: in std_logic_vector(15 downto 0);
        ALU_B: in std_logic_vector(15 downto 0);
	     CV,EN: in std_logic_vector(1 downto 0);   
	     C_in,Z_in: in std_logic;                     
	     Z0: out std_logic;                             
        ALU_C: out std_logic_vector(15 downto 0);
	     C,Z: out std_logic) ;
   end component;
begin

   add_instance: ALU
			port map (
					-- order of inputs B A
					ALU_A => input_vector(37 downto 22),
					ALU_B => input_vector(21 downto 6),
					CV => input_vector(5 downto 4),
					EN => input_vector(3 downto 2),
					C_in => input_vector(1),
					Z_in => input_vector(0),
               -- order of output OUTPUT
					Z0 => output_vector(18),
					ALU_C => output_vector(17 downto 2),
					C => output_vector(1),
					Z => output_vector(0));
end DutWrap;