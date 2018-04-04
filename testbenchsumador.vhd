--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:30:13 04/04/2018
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/sumador/sumador/testbenchsumador.vhd
-- Project Name:  sumador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbenchsumador IS
END testbenchsumador;
 
ARCHITECTURE behavior OF testbenchsumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          a => a,
          b => b,
          salida => salida
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a <= "00000000000000000000000000000101";
		b <= "00000000000000000000000000010001";
      wait for 20 ns;	
		
		a <= "00000000000000000000000001000001";
		b <= "00000000000000000000000000010001";
      wait for 20 ns;

      a <= "00000000000000000000000000010001";
		b <= "00000000000000000000000000001001";
      wait for 20 ns;
		
		a <= "00000000000000000000000000000101";
		b <= "00000000000000000000000010000001";
      wait for 20 ns;
		
		a <= "00000000000000000000000001000001";
		b <= "00000000000000000000000000001001";
      wait for 20 ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
