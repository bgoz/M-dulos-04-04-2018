
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity mux2a1 is
    Port ( a : in STD_LOGIC_VECTOR (31 DOWNTO 0);
           b : in STD_LOGIC_VECTOR (31 DOWNTO 0);
           sel : in  STD_LOGIC;
           c : out STD_LOGIC_VECTOR (31 DOWNTO 0));
    end mux2a1;

architecture Behavioral of mux2a1 is
begin


   process (a,b,sel)
    begin
        if (sel='0')then
        c<=a;
        else
        c<=b;
        end if;
    end process;



end Behavioral;

