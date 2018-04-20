
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TBTprocesador IS
END TBTprocesador;
 
ARCHITECTURE behavior OF TBTprocesador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT procesador
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         resultado : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal resultado : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: procesador PORT MAP (
          reset => reset,
          clk => clk,
          resultado => resultado
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
			reset <= '1';
			wait for 10 ns;
			reset <= '0';

      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
