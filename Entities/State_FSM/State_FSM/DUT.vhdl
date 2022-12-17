-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(12 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
   component state_FSM is
     port(op_code:in std_logic_vector(3 downto 0);
          condition: in std_logic_vector(1 downto 0);
			 t2_cnd: in std_logic_vector(2 downto 0);
	       C,Z,CLK,RST: in std_logic;
	       stateID: out std_logic_vector(4 downto 0));
   end component;
begin

   add_instance: state_FSM
			port map (
					-- order of inputs B A
				   op_code => input_vector(12 downto 9),
					condition => input_vector(8 downto 7),
					t2_cnd => input_vector(6 downto 4),
					C => input_vector(3),
					Z => input_vector(2),
					CLK => input_vector(1),
					RST => input_vector(0),
               -- order of output OUTPUT
					stateID => output_vector(4 downto 0));
end DutWrap;