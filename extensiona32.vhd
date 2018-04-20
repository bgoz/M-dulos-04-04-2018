
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity extensiona32 is
    Port (  a : in STD_LOGIC_VECTOR (12 DOWNTO 0);
           salida : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end extensiona32;

architecture Behavioral of extensiona32 is

begin
	 process (a)
    begin
        if (a(12)='0')then
        salida<="0000000000000000000"&a;
        else
        salida<="1111111111111111111"&a;
        end if;
    end process;

end Behavioral;

