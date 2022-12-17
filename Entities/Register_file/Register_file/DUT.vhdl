-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(28 downto 0);
       	output_vector: out std_logic_vector(47 downto 0));
end entity;

architecture DutWrap of DUT is
   component register_file is
    port(
        RF_A1,RF_A2,RF_A3 : in std_logic_vector(2 downto 0);         
        RF_D3 : in std_logic_vector(15 downto 0);                    
        RF_WR : in std_logic;                                        
        RF_RD : in std_logic;
        CLK,RST : in std_logic;
        RF_D1,RF_D2 : out std_logic_vector(15 downto 0);             
        R7_PC_OUT : out std_logic_vector(15 downto 0)
        );
   end component;
begin

   add_instance: register_file
			port map (
					-- order of inputs B A
					RF_A1 => input_vector(28 downto 26),
					RF_A2 => input_vector(25 downto 23),
					RF_A3 => input_vector(22 downto 20),
					RF_D3 => input_vector(19 downto 4),
					RF_WR => input_vector(3),
					RF_RD => input_vector(2),
					CLK => input_vector(1),
					RST => input_vector(0),
               -- order of output OUTPUT
					RF_D1 => output_vector(47 downto 32),
					RF_D2 => output_vector(31 downto 16),
					R7_PC_OUT => output_vector(15 downto 0));
end DutWrap;