library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity sumador is
    Port ( a : in  std_logic_vector(31 DOWNTO 0);
           b : in  std_logic_vector(31 DOWNTO 0);
           salida : out std_logic_vector(31 DOWNTO 0));
end sumador;

architecture Behavioral of sumador is

begin

process (a, b) IS
       begin
         salida <= std_logic_vector(UNSIGNED(a) + UNSIGNED(b));
       end process;

end Behavioral;

