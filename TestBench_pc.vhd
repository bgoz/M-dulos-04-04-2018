--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:15 04/04/2018
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/PC/PC/TestBench_pc.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc
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
 
ENTITY TestBench_pc IS
END TestBench_pc;
 
ARCHITECTURE behavior OF TestBench_pc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         CLK : IN  std_logic;
         PC_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal PC_OUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          Address => Address,
          Reset => Reset,
          CLK => CLK,
          PC_OUT => PC_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Address <= "00000000000000000000000000000101";
		Reset <= '1';
      wait for 20 ns;
		
		Address <= "00000000000000000000000000000011";
		Reset <= '0';
      wait for 20 ns;
		
		Address <= "00000000000000000000000000010100";
		Reset <= '0';
      wait for 20 ns;
		
		Address <= "00000000000000000000000000100001";
		Reset <= '0';
      wait for 20 ns;
		
		Address <= "00000000000000000000000000100000";
		Reset <= '0';
      wait for 20 ns;
		
		Address <= "00000000000000000000000000000100";
		Reset <= '0';
      wait for 20 ns;

		

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
