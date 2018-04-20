
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TBHmux2a1de32 IS
END TBHmux2a1de32;
 
ARCHITECTURE behavior OF TBHmux2a1de32 IS 
 
 
    COMPONENT mux2a1
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic;
         c : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic := '0';

   signal c : std_logic_vector(31 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2a1 PORT MAP (
          a => a,
          b => b,
          sel => sel,
          c => c
        );
   stim_proc: process
   begin		
      
		a<="00000000000000000000000000000010";
		b<="00000000000000000000100000000100";
		sel<='1';
      wait for 100 ns;	
		
		
		a<="00000000000000010000000000100010";
		b<="00000000000000000000100100010100";
		sel<='0';
      wait for 100 ns;
		
		
		a<="00000000000000000000010000100010";
		b<="00000000000000000001000000100100";
		sel<='1';
      wait for 100 ns;
		
		
		a<="00000000000100000000010000010010";
		b<="00000000000000000000000010000100";
		sel<='0';
      wait for 100 ns;
		
		a<="00000000000000000111000000000001";
		b<="00000000000000000000100001100010";
		sel<='1';
      wait for 100 ns;	
		
		
		a<="00000000011100010000000000100010";
		b<="00000000000011100000100100010100";
		sel<='0';
      wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
