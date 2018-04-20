
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TBHextensiona32 IS
END TBHextensiona32;
 
ARCHITECTURE behavior OF TBHextensiona32 IS 

    COMPONENT extensiona32
    PORT(
         a : IN  std_logic_vector(12 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   signal a : std_logic_vector(12 downto 0) := (others => '0');


   signal salida : std_logic_vector(31 downto 0);
	
 
BEGIN
 

   uut: extensiona32 PORT MAP (
          a => a,
          salida => salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
		a<="0000000000000";
      wait for 100 ns;	

      a<="1000000000100";
      wait for 100 ns;
		
		a<="0000001000000";
      wait for 100 ns;	

      a<="1000000000100";
      wait for 100 ns;
		
		
		

      wait;
   end process;

END;
